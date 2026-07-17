import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import 'package:localservice/core/routes/routes.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';
import 'package:localservice/features/auth/presentation/widgets/auth_button.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  static const String checkEmailImage =
      'assets/images/checkemail.png';

  @override
  Widget build(BuildContext context) {
    final PinTheme pinTheme = PinTheme(
      width: 58,
      height: 64,
      textStyle: TextStyles.title.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.lightgrey,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              const Gap(16),

              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    color: AppColors.blackColor,
                    iconSize: 20,
                  ),
                ),
              ),

              const Spacer(),

              Container(
                width: 98,
                height: 98,
                decoration: const BoxDecoration(
                  color: AppColors.containercolor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    checkEmailImage,
                    width: 64,
                    height: 64,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const Gap(26),

              Text(
                'Check your email',
                textAlign: TextAlign.center,
                style: TextStyles.title.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),

              const Gap(8),

              Text(
                'We sent a 4-digit verification code to\n'
                'j.doe@example.com',
                textAlign: TextAlign.center,
                style: TextStyles.body1.copyWith(
                  color: AppColors.bodycolor,
                  height: 1.5,
                ),
              ),

              const Gap(30),

              Pinput(
                length: 4,
                defaultPinTheme: pinTheme,
                focusedPinTheme: pinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.titlecolor,
                      width: 1.5,
                    ),
                  ),
                ),
                submittedPinTheme: pinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.titlecolor,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),

              const Gap(24),

              AuthButton(
                title: 'Verify Code',
                icon: Icons.verified_user_outlined,
                backgroundColor: AppColors.titlecolor,
                textColor: AppColors.backgroundColor,
                onTap: () {
                  context.push(Routes.resetPassword);
                },
              ),

              const Gap(26),

              RichText(
                text: TextSpan(
                  style: TextStyles.caption2.copyWith(
                    color: AppColors.bodycolor,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Resend code in ',
                    ),
                    TextSpan(
                      text: '00:59',
                      style: TextStyles.caption1.copyWith(
                        color: AppColors.titlecolor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(28),

              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  'CHANGE EMAIL ADDRESS',
                  style: TextStyles.caption1.copyWith(
                    color: AppColors.bodycolor,
                    fontSize: 11,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}