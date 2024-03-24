import 'package:counsellor/features/authentication/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import 'screens.dart';

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
            Image.asset(
              AssetPath.ellipse1,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
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
        AuthButton(
          text: 'Sign In',
          color: AppColors.primaryColor,
          ontap: () => Navigator.pushNamed(context, SignInScreen.routeName),
        ),
        Space.height(20.h),
        AuthButton(
            text: 'Sign Up',
            color: AppColors.white,
            textColor: AppColors.primaryColor,
            arrowColor: AppColors.primaryColor,
            ontap: () => Navigator.pushNamed(context, SignUpScreen.routeName)),
      ],
    ));
  }
}
