import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:localservice/core/routes/routes.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

import 'package:localservice/features/auth/presentation/widgets/auth_button.dart';



class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  static const String forgotImage = 'assets/images/forgotpass.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Gap(12),

              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.blackColor,
                  ),
                  Text(
                    'Reset Password',
                    style: TextStyles.body2.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              const Gap(28),

              Container(
                width: 84,
                height: 84,
                decoration: const BoxDecoration(
                  color: AppColors.containercolor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    forgotImage,
                    width: 46,
                    height: 46,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const Gap(24),

              Text(
                'Forgot your password?',
                textAlign: TextAlign.center,
                style: TextStyles.title.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),

              const Gap(8),

              Text(
                "Enter your email to receive a verification\ncode. We'll help you get back into your\naccount in no time.",
                textAlign: TextAlign.center,
                style: TextStyles.body1.copyWith(
                  color: AppColors.bodycolor,
                  height: 1.5,
                ),
              ),

              const Gap(30),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email Address',
                  style: TextStyles.caption1.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),
              ),

              const Gap(8),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'e.g. alex@example.com',
                  hintStyle: TextStyles.body1.copyWith(
                    color: AppColors.greycolor,
                    fontSize: 13,
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    size: 20,
                    color: AppColors.iconColor,
                  ),
                  filled: true,
                  fillColor: AppColors.backgroundColor,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.lightgrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.lightgrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.titlecolor),
                  ),
                ),
              ),

              const Gap(18),

              AuthButton(
                title: 'Send Code',
                icon: Icons.send_rounded,
                backgroundColor: const Color(0xFFFFC107),
                textColor: AppColors.blackColor,
                onTap: () {
                  context.push(Routes.checkEmail);
                },
              ),

              const Gap(26),

              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.lightgrey)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      'OR',
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.greycolor,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: AppColors.lightgrey)),
                ],
              ),

              const Gap(12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Remembered it?',
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.greycolor,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Back to Sign In',
                      style: TextStyles.caption1.copyWith(
                        color: AppColors.titlecolor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              const Gap(10),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightgrey1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.security_rounded,
                      color: AppColors.iconColor,
                      size: 22,
                    ),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        'Secure Verification\nA unique 6-digit code will be sent to your inbox. This code expires in 10 minutes for your protection.',
                        style: TextStyles.caption2.copyWith(
                          color: AppColors.bodycolor,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Text(
                'Protected by FixIt Local Security',
                style: TextStyles.caption2.copyWith(
                  color: AppColors.greycolor,
                  fontSize: 11,
                ),
              ),

              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}