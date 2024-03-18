import 'package:counsellor/common/button.dart';
import 'package:counsellor/common/textfield.dart';
import 'package:counsellor/features/authentication/screens/otp_screen.dart';
import 'package:counsellor/features/authentication/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup-screen';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Space.height(40.h),
          Image.asset(
            AssetPath.counsel,
            height: 300.h,
          ),
          Space.height(20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTheme.clText('Sign Up', context,
                    size: 28, fontWeight: FontWeight.bold),
                Space.height(11.h),
                SizedBox(
                  height: 48.h,
                  child: CLButtton(
                    color: AppColors.white,
                    onTap: () {},
                    borderColor: AppColors.primaryColor,
                    child: Row(
                      children: [
                        Image.asset(AssetPath.google),
                        Space.width(20.w),
                        AppTheme.clText('Use Google Account', context,
                            size: 18,
                            textColor: AppColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                ),
                Space.height(20.h),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.primaryColor,
                        thickness: 2,
                      ),
                    ),
                    Space.width(10.w),
                    AppTheme.clText('or', context,
                        textColor: AppColors.primaryColor, size: 14),
                    Space.width(10.w),
                    const Expanded(
                      child: Divider(
                        color: AppColors.primaryColor,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                Space.height(20.h),
                const CLTextField(
                  hintText: 'Email Address',
                ),
                Space.height(20.h),
                const CLTextField(
                  hintText: 'Password',
                  isPassword: true,
                ),
                Space.height(32.h),
                AuthButton(
                    ontap: () =>
                        Navigator.pushNamed(context, OtpScreen.routeName),
                    text: 'Sign up',
                    color: AppColors.primaryColor),
                Space.height(32.h),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
