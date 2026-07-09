import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/constants/app_assets.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';
import 'package:localservice/core/widgets/svg_pic.dart';

class Message extends StatelessWidget {
  const Message({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.black1,
      ),
      child: Row(
        children: [
         Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.lightblack.withValues(alpha: 0.1),
      ),
      child: SvgPic(assetName: AppAssets.warning),
         ),
         Gap(12),
         Text(
           "Emergency help needed?\nFind pros available within\n1 hour.",style: TextStyles.body1.copyWith(
             color: AppColors.lightblack
           ),
         ),
         Gap(17),
     GestureDetector(
      onTap: () {},
       child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.backgroundColor,
        ),
        child: Text(
          'View\nPros',
          style: TextStyles.title2.copyWith(color: AppColors.blackColor),
        ),
           ),
     ),
    
         
              ],
            ),
          );
  }
}
