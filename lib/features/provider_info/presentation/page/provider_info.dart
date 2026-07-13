import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';
import 'package:localservice/core/widgets/custom_form_field.dart';
import 'package:localservice/core/widgets/custom_image_picker.dart';
import 'package:localservice/core/widgets/mybodyview.dart';
import 'package:localservice/features/provider_info/presentation/widgets/custom_container.dart';
import 'package:localservice/features/provider_info/presentation/widgets/services_offered_section.dart';
import 'package:localservice/features/provider_info/presentation/widgets/photos_of_work_section.dart';

class ProviderInfo extends StatefulWidget {
  const ProviderInfo({super.key});

  @override
  State<ProviderInfo> createState() => _ProviderInfoState();
}

class _ProviderInfoState extends State<ProviderInfo> {

  List<String> _selectedServices = [
    'Wiring Repair',
    'Panel Upgrades',
    'Lighting Installation',
    'EV Charging Ports', 
  ];


  List<File> _workPhotos = [];

  @override
  Widget build(BuildContext context) {
    return  Scaffold( backgroundColor: AppColors.backgroundColor1,
      appBar: AppBar(centerTitle: true, leading:BackButton(),backgroundColor: AppColors.backgroundColor,
        title: const Text("Complete Profile"),
        actions: [
          TextButton(onPressed: (){}, child:  Text("Save",style: TextStyles.body2,))
        ]
      ),
      body: SingleChildScrollView(
        child: MyBodyView(
            child: Column(
              children: [
               
                CustomContainer(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 20),
                  child: Column(
                    children: [
                      CustomImagePicker(onImagePicked: (image) {}),
                      const Gap(16),
                      Text('PROFILE PHOTO', style: TextStyles.body2),
                      const Gap(5),
                      Text(
                        'Recommended: 400x400px',
                        style: TextStyles.caption2
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const Gap(10),

               
                CustomContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Personal Details', style: TextStyles.title1),
                      const Gap(16),
                      Text('Full Name', style: TextStyles.body2),
                      const Gap(5),
                      CustomFormField(
                        hintText: 'e.g. Marcus Thorne',
                      ),
                      const Gap(16),
                      Text('Primary Specialty', style: TextStyles.body2),
                      const Gap(5),
                      CustomFormField(
                        hintText: 'e.g. Master Electrician',
                      ),
                      const Gap(16),
                      Text('Years of Experience', style: TextStyles.body2),
                      const Gap(5),
                      CustomFormField(
                        hintText: 'e.g. 12',
                        keyboardtype: 2,
                      ),
                      const Gap(16),
                      Text('About Me', style: TextStyles.body2),
                      const Gap(5),
                      CustomFormField(
                        hintText:
                            'Briefly describe your expertise,\n certifications, and approach to\n customer service...',
                        maxlines: false,
                      ),
                    ],
                  ),
                ),
                const Gap(10),

                CustomContainer(
                  child: ServicesOfferedSection(
                    selectedServices: _selectedServices,
                    onChanged: (updated) =>
                        setState(() => _selectedServices = updated),
                  ),
                ),
                const Gap(10),

                CustomContainer(
                  child: PhotosOfWorkSection(
                    photos: _workPhotos,
                    onChanged: (updated) =>
                        setState(() => _workPhotos = updated),
                  ),
                ),
                const Gap(10),
              ],
            ),
        ),
      ),
    );
  }
}
