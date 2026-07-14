import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/functions/navigations.dart';
import 'package:localservice/core/models/provider_model.dart';
import 'package:localservice/core/services/firebase_service.dart';
import 'package:localservice/core/shimmer/list_shimmer.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';
import 'package:localservice/core/widgets/mybodyview.dart';
import 'package:localservice/features/home/presentation/widgets/professional_card.dart';
import 'package:localservice/features/search/presentation/widgets/search_input_field.dart';
import 'package:localservice/features/search/presentation/widgets/location_row.dart';
import 'package:localservice/features/search/presentation/widgets/filter_panel.dart';

class SearchScreen extends StatefulWidget {
  final String? initialCategory;
  const SearchScreen({super.key, this.initialCategory});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _showFilters = false;
  String _selectedQuickFilter = "";
  bool _isNearby = true;
  bool _isTopRated = false;

  final List<String> _quickFilters = ['Plumbing', 'Electrical', 'Cleaning', 'HVAC'];
  late Future<List<ProviderModel>> _providersFuture;

  @override
  void initState() {
    super.initState();
    _providersFuture = AppFirebaseService.getAllProviders();
    if (widget.initialCategory != null) {
      _selectedQuickFilter = widget.initialCategory!;
    }
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () => pop(context),
        ),
      ),
      body: SafeArea(
        child: MyBodyView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find Your Pro',
                style: TextStyles.headline.copyWith(fontWeight: FontWeight.w700),
              ),
              const Gap(16),
              SearchInputField(
                controller: _searchController,
                isFilterActive: _showFilters,
                onFilterTap: () {
                  setState(() {
                    _showFilters = !_showFilters;
                  });
                },
              ),
              const Gap(12),
              LocationRow(
                location: 'Downtown Seattle',
                onChangeTap: () {},
              ),
              const Gap(20),
              Expanded(
                child: FutureBuilder<List<ProviderModel>>(
                  future: _providersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ListShimmer();
                    }
                    if (snapshot.hasError) {
                      debugPrint("Search FutureBuilder error: ${snapshot.error}");
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: TextStyles.caption2.copyWith(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    final allProviders = snapshot.data ?? [];
                    final query = _searchController.text.toLowerCase().trim();
                    
                    // In-memory local contains filtering for fast response
                    final filteredResults = allProviders.where((pro) {
                      final matchesQuery = query.isEmpty ||
                          pro.name.toLowerCase().contains(query) ||
                          pro.specialty.toLowerCase().contains(query) ||
                          pro.category.toLowerCase().contains(query);

                      final matchesCategory = _selectedQuickFilter.isEmpty ||
                          pro.category.toLowerCase() == _selectedQuickFilter.toLowerCase();

                      final matchesTopRated = !_isTopRated || pro.rating >= 4.8;

                      final matchesNearby = !_isNearby || pro.distance <= 1.5;

                      return matchesQuery && matchesCategory && matchesTopRated && matchesNearby;
                    }).toList();

                    
                    if (_isNearby) {
                      filteredResults.sort((a, b) => a.distance.compareTo(b.distance));
                    }

                    final hasActiveSearchOrFilters = query.isNotEmpty ||
                        _selectedQuickFilter.isNotEmpty ||
                        _isTopRated ||
                        _isNearby;

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: _showFilters
                          ? FilterPanel(
                              key: const ValueKey('filter_panel'),
                              quickFilters: _quickFilters,
                              selectedQuickFilter: _selectedQuickFilter,
                              onQuickFilterSelected: (val) {
                                setState(() {
                                  _selectedQuickFilter = val;
                                });
                              },
                              isNearby: _isNearby,
                              onNearbyChanged: (val) {
                                setState(() {
                                  _isNearby = val;
                                });
                              },
                              isTopRated: _isTopRated,
                              onTopRatedChanged: (val) {
                                setState(() {
                                  _isTopRated = val;
                                });
                              },
                              onApply: () {
                                setState(() {
                                  _showFilters = false;
                                });
                              },
                            )
                          : _buildResultsSection(
                              filteredResults,
                              hasActiveSearchOrFilters,
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultsSection(List<ProviderModel> results, bool hasActiveFilters) {
    if (results.isEmpty) {
      return Center(
        child: Column(
          key: const ValueKey('no_results'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 64, color: AppColors.greycolor),
            const Gap(16),
            Text(
              'No Professionals Found',
              style: TextStyles.title1.copyWith(fontSize: 18),
            ),
            const Gap(8),
            Text(
              'Try adjusting your search query or filters.',
              style: TextStyles.caption2.copyWith(color: AppColors.bodycolor),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      key: const ValueKey('results_list'),
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: results.length,
      separatorBuilder: (context, index) => const Gap(12),
      itemBuilder: (context, index) {
        final pro = results[index];
        return ProfessionalCard(
          providerModel: pro,
          onTap: () {},
        );
      },
    );
  }
}