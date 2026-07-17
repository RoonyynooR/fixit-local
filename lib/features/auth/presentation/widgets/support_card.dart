import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

class SupportCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const SupportCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.lightgrey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.titlecolor,
            size: 20,
          ),
          const Gap(8),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.caption1.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}