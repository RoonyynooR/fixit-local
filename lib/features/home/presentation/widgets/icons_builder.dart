import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

class IconsBuilder extends StatelessWidget {
  const IconsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      separatorBuilder: (context, index) => const Gap(10),
      itemBuilder: (context, index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.containercolor,
            ),
            child: const Icon(Icons.electrical_services_outlined),
          ),
          const Gap(5),
          Text('Electrician', style: TextStyles.caption1),
        ],
      ),
    );
  }
}

