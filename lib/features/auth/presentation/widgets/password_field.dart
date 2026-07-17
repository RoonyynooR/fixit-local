import 'package:flutter/material.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

import '../../../../core/styles/app_colors.dart';

class PasswordField extends StatelessWidget {
  final bool obscureText;
  final VoidCallback onVisibilityTap;

  const PasswordField({
    super.key,
    required this.obscureText,
    required this.onVisibilityTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: '••••••••',
        hintStyle: TextStyles.body1.copyWith(
          color: AppColors.greycolor,
        ),
        filled: true,
        fillColor: AppColors.backgroundColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        suffixIcon: IconButton(
          onPressed: onVisibilityTap,
          icon: Icon(
            obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: AppColors.iconColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.lightgrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const borderSide(color: AppColors.lightgrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.titlecolor),
        ),
      ),
    );
  }
}