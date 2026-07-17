import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

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
      height: 86,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightgrey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.titlecolor),
          const Gap(8),
          Text(
            title,
            style: TextStyles.caption1.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}