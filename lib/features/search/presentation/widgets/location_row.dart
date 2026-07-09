import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

class LocationRow extends StatelessWidget {
  final String location;
  final VoidCallback onChangeTap;

  const LocationRow({
    super.key,
    required this.location,
    required this.onChangeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.lightgrey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               Icon(Icons.location_on, size: 16, color: AppColors.titlecolor),
               Gap(4),
              Text(
                location,
                style: TextStyles.body1.copyWith(color:AppColors.primaryColor)
                  
                
                ),
              
            ],
          ),
        ),
        const Gap(8),
        TextButton(
          onPressed: onChangeTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child:  Text(
            'Change',
            style: TextStyles.title2.copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
