import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

class UploadTile extends StatelessWidget {
  final VoidCallback onTap;
  const UploadTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor1,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.lightgrey1, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.lightgrey1,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                color: AppColors.darkgreycolor,
                size: 26,
              ),
            ),
            const Gap(8),
            Text(
              'Upload Work',
              style: TextStyles.caption1.copyWith(
                color: AppColors.darkgreycolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
