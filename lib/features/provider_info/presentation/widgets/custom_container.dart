import 'package:flutter/material.dart';
import 'package:localservice/core/styles/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const CustomContainer({
    super.key, required this.child, this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:padding ?? const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
       color: AppColors.backgroundColor,
       border: Border.all(color: AppColors.lightgrey1)
      ),
      child: child,
    );
  }
}



