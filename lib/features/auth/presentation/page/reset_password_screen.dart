import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:localservice/core/routes/routes.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      body: SafeArea(
        child: Column(
          children: [
            _TopBar(
              title: 'FixIt Local',
              onClose: () => Navigator.pop(context),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.lightgrey),
                      ),
                      child: Column(
                        children: [
                          const Gap(4),

                          Text(
                            'Reset Password',
                            style: TextStyles.title.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.blackColor,
                            ),
                          ),

                          const Gap(8),

                          Text(
                            'Set a secure new password for your\naccount to regain access to home repair\nservices.',
                            textAlign: TextAlign.center,
                            style: TextStyles.body1.copyWith(
                              color: AppColors.bodycolor,
                              height: 1.5,
                            ),
                          ),

                          const Gap(24),

                          const _Label(text: 'New Password'),

                          const Gap(8),

                          PasswordField(
                            obscureText: hidePassword,
                            onVisibilityTap: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),

                          const Gap(8),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Enter a password',
                              style: TextStyles.caption2.copyWith(
                                color: AppColors.bodycolor,
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),

                          const Gap(18),

                          const _Label(text: 'Confirm Password'),

                          const Gap(8),

                          PasswordField(
                            obscureText: hideConfirmPassword,
                            onVisibilityTap: () {
                              setState(() {
                                hideConfirmPassword = !hideConfirmPassword;
                              });
                            },
                          ),

                          const Gap(22),

                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: AppColors.lightgrey1,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.lightgrey),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.shield_outlined,
                                  color: AppColors.titlecolor,
                                  size: 22,
                                ),
                                const Gap(10),
                                Expanded(
                                  child: Text(
                                    'PASSWORD SECURITY TIP\nUse a mix of uppercase letters, numbers, and symbols to ensure your account remains secure.',
                                    style: TextStyles.caption2.copyWith(
                                      color: AppColors.bodycolor,
                                      height: 1.4,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Gap(24),

                          AuthButton(
                            title: 'Reset Password',
                            icon: Icons.lock_reset,
                            backgroundColor: AppColors.secondaryColor,
                            textColor: AppColors.bodycolor,
                            onTap: () {
                              context.push(Routes.appointmentConfirmed);
                            },
                          ),
                        ],
                      ),
                    ),

                    const Gap(22),

                    const Row(
                      children: [
                        Expanded(
                          child: SupportCard(
                            icon: Icons.support_agent,
                            title: '24/7 Support',
                          ),
                        ),
                        Gap(12),
                        Expanded(
                          child: SupportCard(
                            icon: Icons.verified_user_outlined,
                            title: 'Secure Session',
                          ),
                        ),
                      ],
                    ),

                    const Gap(14),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.help_outline,
                          color: AppColors.titlecolor,
                          size: 18,
                        ),
                        const Gap(4),
                        Text(
                          'Having trouble?',
                          style: TextStyles.caption2.copyWith(
                            color: AppColors.bodycolor,
                            fontSize: 11,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          'Contact Support',
                          style: TextStyles.caption1.copyWith(
                            color: AppColors.titlecolor,
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final String title;
  final VoidCallback onClose;

  const _TopBar({
    required this.title,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border(
          bottom: BorderSide(color: AppColors.lightgrey),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.home_repair_service_rounded,
            color: AppColors.titlecolor,
            size: 20,
          ),
          const Gap(6),
          Text(
            title,
            style: TextStyles.title1.copyWith(
              color: AppColors.titlecolor,
              fontWeight: FontWeight.w700,
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

class _Label extends StatelessWidget {
  final String text;

  const _Label({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyles.caption1.copyWith(
          color: AppColors.blackColor,
          fontWeight: fontWeight.w700,
        ),
      ),
    );
  }
}