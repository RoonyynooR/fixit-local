import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/models/provider_model.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';
import 'package:localservice/features/home/presentation/widgets/professional_card.dart';

class BuildResults extends StatelessWidget {
  const BuildResults({
    super.key,
    required this.results,
    required this.hasActiveFilters,
  });

  final List<ProviderModel> results;
  final bool hasActiveFilters;

  @override
  Widget build(BuildContext context) {
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