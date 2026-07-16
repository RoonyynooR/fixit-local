import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';
import 'package:localservice/features/provider_info/presentation/widgets/__photo_tile.dart';
import 'package:localservice/features/provider_info/presentation/widgets/__upload_tile.dart';

const int kMaxPhotos = 10;

class PhotosOfWorkSection extends StatefulWidget {
  final List<File> photos;
  final ValueChanged<List<File>> onChanged;

  const PhotosOfWorkSection({
    super.key,
    required this.photos,
    required this.onChanged,
  });

  @override
  State<PhotosOfWorkSection> createState() => _PhotosOfWorkSectionState();
}

class _PhotosOfWorkSectionState extends State<PhotosOfWorkSection> {
  late List<File> _photos;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _photos = widget.photos;
  }

  Future<void> _pickImage() async {
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Select Source', style: TextStyles.title1),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.camera_alt_outlined,
                color: AppColors.primaryColor),
            label: Text('Camera',
                style:
                    TextStyles.body1.copyWith(color: AppColors.primaryColor)),
            onPressed: () => Navigator.pop(context, ImageSource.camera),
          ),
          TextButton.icon(
            icon: const Icon(Icons.photo_library_outlined,
                color: AppColors.primaryColor),
            label: Text('Gallery',
                style:
                    TextStyles.body1.copyWith(color: AppColors.primaryColor)),
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
          ),
        ],
      ),
    );

    if (source == null) return;

    try {
      final XFile? picked = await _picker.pickImage(
        source: source,
        imageQuality: 85,
      );
      if (picked != null) {
        setState(() => _photos.add(File(picked.path)));
        
      }
    } catch (e) {
      log('Error picking image: $e');
    }
  }

  void _removePhoto(int index) {
    setState(() => _photos.removeAt(index));
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Photos of Your Work', style: TextStyles.title1),
        const Gap(16),

        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
          itemCount: _photos.length + (_photos.length < kMaxPhotos ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _photos.length) {
              return UploadTile(onTap: _pickImage);
            }
            return PhotoTile(
              file: _photos[index],
              onRemove: () => _removePhoto(index),
            );
          },
        ),

        const Gap(12),
        Text(
          'Upload up to $kMaxPhotos photos of your best projects to build trust with homeowners',
          style: TextStyles.caption2.copyWith(
            color: AppColors.greycolor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
