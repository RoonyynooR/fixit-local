import 'package:flutter/material.dart';
import 'package:localservice/core/constants/app_assets.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/widgets/custom_form_field.dart';
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
    return CustomFormField(
      controller: controller,
      hintText: 'Search by name or category',
      preffixIcon: const Icon(Icons.search, color: AppColors.iconColor),
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
    );
  }
}
