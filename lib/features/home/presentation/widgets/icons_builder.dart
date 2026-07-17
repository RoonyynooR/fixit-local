import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:localservice/core/routes/routes.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

class IconsBuilder extends StatelessWidget {
  IconsBuilder({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Plumbing',
      'label': 'Plumber',
      'icon': Icons.plumbing,
    },
    {
      'name': 'Electrical',
      'label': 'Electrician',
      'icon': Icons.electrical_services_outlined,
    },
    {
      'name': 'Cleaning',
      'label': 'Cleaner',
      'icon': Icons.cleaning_services_outlined,
    },
    {
      'name': 'HVAC',
      'label': 'HVAC Tech',
      'icon': Icons.ac_unit,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      separatorBuilder: (context, index) => const Gap(16),
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            context.push('${Routes.search}?category=${category['name']}');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.containercolor,
                ),
                child: Icon(
                  category['icon'] as IconData,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
              ),
              const Gap(5),
              Text(
                category['label'] as String,
                style: TextStyles.caption1.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

