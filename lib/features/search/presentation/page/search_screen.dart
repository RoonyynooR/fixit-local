import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:localservice/core/functions/navigations.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';
import 'package:localservice/core/widgets/mybodyview.dart';
import 'package:localservice/features/home/presentation/widgets/professional_card.dart';
import 'package:localservice/features/home/presentation/widgets/mock_professionals.dart';
import 'package:localservice/features/search/presentation/widgets/search_input_field.dart';
import 'package:localservice/features/search/presentation/widgets/location_row.dart';
import 'package:localservice/features/search/presentation/widgets/filter_panel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

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

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {
    final filteredResults = mockProfessionals;
    const hasActiveSearchOrFilters = true;

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
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: _showFilters
                      ? FilterPanel(
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
                      : _buildResultsSection(filteredResults, hasActiveSearchOrFilters),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultsSection(List<ProfessionalModel> results, bool hasActiveFilters) {

    if (results.isEmpty) {
      return Center(
        
        child: Column(
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
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: results.length,
      separatorBuilder: (context, index) =>  Gap(12),
      itemBuilder: (context, index) {
        final pro = results[index];
        return ProfessionalCard(
          name: pro.name,
          rating: pro.rating,
          specialty: pro.specialty,
          distance: pro.distance,
          pricePerHour: pro.pricePerHour,
          imageUrl: pro.imageUrl,
          onTap: () {},
        );
      },
    );
  }
}