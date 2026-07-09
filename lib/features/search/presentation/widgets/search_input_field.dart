import 'package:flutter/material.dart';
import 'package:localservice/core/constants/app_assets.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';
import 'package:localservice/core/widgets/svg_pic.dart';

class SearchInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isFilterActive;
  final VoidCallback onFilterTap;

  const SearchInputField({
    super.key,
    required this.controller,
    required this.isFilterActive,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search by name or category (e.g. Smith or Plumbing)',
        hintStyle: TextStyles.body1.copyWith(
          color: AppColors.greycolor,
          fontSize: 14,
        ),
        prefixIcon: const Icon(Icons.search, color: AppColors.iconColor),
        suffixIcon: GestureDetector(
          onTap: onFilterTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: SvgPic(
              assetName: AppAssets.filter,
              width: 20,
              height: 20,
              color: isFilterActive ? AppColors.titlecolor : AppColors.iconColor,
            ),
          ),
        ),
        filled: true,
        fillColor: const Color(0xffF7F8F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.lightgrey1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.lightgrey1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.titlecolor, width: 1.5),
        ),
      ),
    );
  }
}
