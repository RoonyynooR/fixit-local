
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:localservice/core/constants/app_assets.dart';
import 'package:localservice/core/routes/routes.dart';
import 'package:localservice/core/styles/text_styles.dart';
import 'package:localservice/core/widgets/custom_form_field.dart';
import 'package:localservice/core/widgets/mybodyview.dart';
import 'package:localservice/core/widgets/svg_pic.dart';
import 'package:localservice/core/models/provider_model.dart';
import 'package:localservice/core/services/firebase_service.dart';
import 'package:localservice/core/shimmer/list_shimmer.dart';
import 'package:localservice/features/home/presentation/widgets/icons_builder.dart';
import 'package:localservice/features/home/presentation/widgets/message.dart';
import 'package:localservice/features/home/presentation/widgets/professional_card.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MyBodyView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Find your local expert', style: TextStyles.headline),
            const Gap(12),
            CustomFormField(
              onTap: () => context.push(Routes.search),
              hintText: 'What needs fixing today?',
              preffixIcon: const Icon(Icons.search),
              suffixIcon: GestureDetector(
                onTap: () => context.push(Routes.search),
                child: Center(
                  child: SvgPic(assetName: AppAssets.filter, width: 20, height: 20),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
                maxWidth: 40,
                maxHeight: 40,
              ),
              readOnly: true,
            ),
            Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Services', style: TextStyles.title1),
                Text('View all', style: TextStyles.title2),
              ],
            ),
            Gap(12),
            SizedBox(
              height: 110,
              child: IconsBuilder(),
            ),
            Gap(24),
            Message(),
      Gap(24),
      Text('Nearby Professionals', style: TextStyles.title1),
      const Gap(16),
      FutureBuilder<List<ProviderModel>>(
        future: AppFirebaseService.getNearbyProviders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ListShimmer(itemCount: 3);
          }
          if (snapshot.hasError) {
            log("Home FutureBuilder error: ${snapshot.error}");
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyles.caption2.copyWith(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          final providers = snapshot.data ?? [];
          if (providers.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'No professionals found.',
                  style: TextStyles.caption2,
                ),
              ),
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: providers.length,
            separatorBuilder: (context, index) => const Gap(12),
            itemBuilder: (context, index) {
              final pro = providers[index];
              return ProfessionalCard(
                providerModel: pro,
                onTap: () {},
              );
            },
          );
        },
      ),
    ],
    ),
      ),
    );
  }
}
