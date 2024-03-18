import 'package:counsellor/features/authentication/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Image.asset(AssetPath.ellipse1),
            Positioned(
              top: 100.h,
              left: 40.w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AssetPath.logoWhite),
                    Space.height(10.h),
                    AppTheme.clText('Welcome', context,
                        size: 40,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.white),
                  ]),
            ),
          ],
        ),
        Space.height(130.h),
        const AuthButton(
          text: 'Sign In',
          color: AppColors.primaryColor,
        ),
        Space.height(20.h),
        const AuthButton(
            text: 'Sign Up',
            color: AppColors.white,
            textColor: AppColors.primaryColor,
            arrowColor: AppColors.primaryColor),
      ],
    ));
  }
}
