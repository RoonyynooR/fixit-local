import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/styles/text_styles.dart';

import '../../../../core/styles/text_styles.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;

  const AuthButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    this.icon,
  });

  @override
  Widget build( BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon (icon, size: 17, color: textColor),
              const Gap(8),
            ],
            Text(
              title,
              style: TextStyles.body2.copyWith(
                color: textColor,
                fontWeight: fontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}