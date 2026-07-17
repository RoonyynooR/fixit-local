import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:localservice/core/models/provider_model.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

class ProfessionalCard extends StatelessWidget {
  final ProviderModel providerModel;
  final VoidCallback? onTap;

  const ProfessionalCard({
    super.key,
    required this.providerModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.lightgrey1,
            width: 1,
          ),
          
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.lightgrey1,
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: providerModel.imageUrl != null && providerModel.imageUrl!.startsWith('http')
                    ? CachedNetworkImage(
                        imageUrl: providerModel.imageUrl!,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/images/user_placeholder.png',
                          fit: BoxFit.cover,
                        ),
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Image.asset(
                        providerModel.imageUrl ?? 'assets/images/user_placeholder.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.person, size: 30),
                      ),
              ),
            ),
            const Gap(12),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                      Expanded(
                        child: Text(
                          providerModel.name,
                          style: TextStyles.title1.copyWith(
                            fontSize: 16,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Gap(8),
                      
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFEBD6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xff191C1E),
                              size: 14,
                            ),
                            const Gap(4),
                            Text(
                              providerModel.rating.toStringAsFixed(1),
                              style: TextStyles.caption1.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff191C1E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(4),
                  
                  Text(
                    '${providerModel.specialty} • ${providerModel.distance.toStringAsFixed(1)} miles away',
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.bodycolor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Gap(12),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Starts from \$${providerModel.pricePerHour.toStringAsFixed(0)}/hr',
                        style: TextStyles.title2.copyWith(
                          color: AppColors.titlecolor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: AppColors.iconColor,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
