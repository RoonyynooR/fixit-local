import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

class FilterPanel extends StatelessWidget {
  final List<String> quickFilters;
  final String selectedQuickFilter;
  final ValueChanged<String> onQuickFilterSelected;
  final bool isNearby;
  final ValueChanged<bool> onNearbyChanged;
  final bool isTopRated;
  final ValueChanged<bool> onTopRatedChanged;
  final VoidCallback onApply;

  const FilterPanel({
    super.key,
    required this.quickFilters,
    required this.selectedQuickFilter,
    required this.onQuickFilterSelected,
    required this.isNearby,
    required this.onNearbyChanged,
    required this.isTopRated,
    required this.onTopRatedChanged,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Gap(8),
        Text(
          'QUICK FILTERS',
          style: TextStyles.caption2.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.darkgreycolor,
          ),
        ),
        const Gap(12),
        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: quickFilters.length,
            separatorBuilder: (context, index) =>  Gap(8),
            itemBuilder: (context, index) {
              final filter = quickFilters[index];
              final isSelected = selectedQuickFilter == filter;
              return GestureDetector(
                onTap: () => onQuickFilterSelected(isSelected ? "" : filter),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.darkgrey : AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? AppColors.titlecolor : AppColors.lightgrey1,
                      width: isSelected ? 1.5 : 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected ? AppColors.titlecolor : AppColors.darkgreycolor,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
         Gap(24),
        Text(
          'Essential Filters',
          style: TextStyles.title1.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
         Gap(16),

        
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightgrey1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nearby',
                style: TextStyles.title2.copyWith(color: AppColors.blackColor),
              ),
              Switch.adaptive(
                value: isNearby,
                activeThumbColor: AppColors.backgroundColor,
                activeTrackColor: AppColors.titlecolor,
                onChanged: onNearbyChanged,
              ),
            ],
          ),
        ),
        const Gap(12),

        // Top Rated Toggle
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightgrey1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Rated',
                style: TextStyles.title2.copyWith(color: AppColors.blackColor),
              ),
              Switch.adaptive(
                value: isTopRated,
                activeThumbColor: AppColors.backgroundColor,
                activeTrackColor: AppColors.titlecolor,
                onChanged: onTopRatedChanged,
              ),
            ],
          ),
        ),
        const Gap(40),

        // Apply Filters Button
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: onApply,
            icon: const Icon(Icons.filter_list, color: AppColors.backgroundColor),
            label: const Text(
              'Apply Filters',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.backgroundColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.titlecolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              
            ),
          ),
        ),
      ],
    );
  }
}
