import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:localservice/core/routes/routes.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';


import '../../../../core/shimmer/shimmer_widget.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

class AppointmentConfirmedScreen extends StatelessWidget {
  const AppointmentConfirmedScreen({super.key});

  static const String marcusImage = 'assets/images/marcus.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      body: SafeArea(
        child: Column(
          children: [
            _TopBar(
              onClose: () => Navigator.pop(context),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Gap(34),

                    Container(
                      width: 78,
                      height: 78,
                      decoration: const BoxDecoration(
                        color: AppColors.titlecolor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        color: AppColors.backgroundColor,
                        size: 42,
                      ),
                    ),

                    const Gap(22),

                    Text(
                      'Appointment Confirmed!',
                      textAlign: TextAlign.center,
                      style: TextStyles.title.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),

                    const Gap(8),

                    Text(
                      'Your request has been accepted.\nProfessional help is on the way to your\nhome.',
                      textAlign: TextAlign.center,
                      style: TextStyles.body1.copyWith(
                        color: AppColors.bodycolor,
                        height: 1.5,
                      ),
                    ),

                    const Gap(26),

                    const _ProfessionalCard(),

                    const Gap(14),

                    const _DateCard(),

                    const Gap(14),

                    const _DetailsCard(),

                    const Gap(22),

                    AuthButton(
                      title: 'Add to Calendar',
                      icon: Icons.calendar_month_outlined,
                      backgroundColor: AppColors.titlecolor,
                      textColor: AppColors.backgroundColor,
                      onTap: () {},
                    ),

                    const Gap(10),

                    AuthButton(
                      title: 'View All Bookings',
                      icon: Icons.list_alt_outlined,
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.backgroundColor,
                      onTap: () {},
                    ),

                    const Gap(18),

                    Text(
                      'Need to modify? Contact Support',
                      style: TextStyles.caption1.copyWith(
                        color: AppColors.titlecolor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const Gap(34),

                    const Divider(color: AppColors.lightgrey),

                    const Gap(18),

                    Text(
                      'Verified & Insured Service',
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.bodycolor,
                        fontSize: 11,
                      ),
                    ),

                    const Gap(10),

                    Text(
                      'A confirmation email has been sent to your inbox.',
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.bodycolor,
                        fontSize: 11,
                      ),
                    ),

                    const Gap(16),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: AuthButton(
                title: 'Return to Dashboard',
                icon: Icons.home_outlined,
                backgroundColor: AppColors.titlecolor,
                textColor: AppColors.backgroundColor,
                onTap: () {
                  context.go(Routes.splash);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final VoidCallback onClose;

  const _TopBar({
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border(
          bottom: BorderSide(color: AppColors.lightgrey),
        ),
      ),
      child: Row(
        children: [
          Text(
            'FixIt\nLocal',
            style: TextStyles.title1.copyWith(
              color: AppColors.titlecolor,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close),
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}

class _ProfessionalCard extends StatelessWidget {
  const _ProfessionalCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(
              AppointmentConfirmedScreen.marcusImage,
            ),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ASSIGNED\nPROFESSIONAL',
                  style: TextStyles.caption1.copyWith(
                    color: AppColors.titlecolor,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const Gap(6),
                Text(
                  'Marcus\nSterling',
                  style: TextStyles.title1.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const Gap(6),
                Text(
                  '⭐ 4.9 (124 reviews)',
                  style: TextStyles.caption2.copyWith(
                    color: AppColors.bodycolor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DateCard extends StatelessWidget {
  const _DateCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: const Column(
        children: [
          _InfoRow(
            icon: Icons.calendar_today_outlined,
            label: 'Date',
            value: 'Thursday, Oct 12',
          ),
          Gap(16),
          _InfoRow(
            icon: Icons.access_time,
            label: 'Arrival Window',
            value: '9:00 AM - 11:00 AM',
          ),
        ],
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SERVICE DETAILS',
            style: TextStyles.caption1.copyWith(
              color: AppColors.bodycolor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(8),
          Row(
            children: [
              const Icon(
                Icons.build_circle_outlined,
                color: AppColors.titlecolor,
                size: 18,
              ),
              const Gap(6),
              Expanded(
                child: Text(
                  'Kitchen Sink Repair & Maintenance',
                  style: TextStyles.body2.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          const Row(
            children: [
              _Tag(text: 'Emergency', isBlue: true),
              Gap(6),
              _Tag(text: 'Residential'),
            ],
          ),
          const Gap(16),
          const Divider(color: AppColors.lightgrey),
          const Gap(14),
          Text(
            'SERVICE ADDRESS',
            style: TextStyles.caption1.copyWith(
              color: AppColors.bodycolor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.bodycolor,
                size: 18,
              ),
              const Gap(4),
              Expanded(
                child: Text(
                  '1248 Oakwood Drive, Apt 4B\nMaple Heights, WA 98101',
                  style: TextStyles.caption2.copyWith(
                    color: AppColors.blackColor,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.titlecolor, size: 22),
        const Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyles.caption2.copyWith(
                color: AppColors.bodycolor,
              ),
            ),
            const Gap(3),
            Text(
              value,
              style: TextStyles.caption1.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final bool isBlue;

  const _Tag({
    required this.text,
    this.isBlue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isBlue ? AppColors.containercolor : AppColors.lightgrey1,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyles.caption1.copyWith(
          color: isBlue ? AppColors.titlecolor : AppColors.bodycolor,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: AppColors.backgroundColor,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: AppColors.lightgrey),
  );
}