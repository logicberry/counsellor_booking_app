import 'package:counsellor/common/button.dart';
import 'package:counsellor/common/textfield.dart';
import 'package:counsellor/features/authentication/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/signin-screen';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(AssetPath.ellipse2),
              Positioned(
                top: 100,
                left: 40,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AssetPath.logoWhite),
                      const SizedBox(height: 10),
                      const Text('Welcome \nBack',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ]),
              ),
            ],
          ),
          Space.height(60.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTheme.clText('Sign in', context,
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
                Space.height(8.h),
                AppTheme.clText('Forgot Password ?', context,
                    textColor: AppColors.primaryColor, size: 14),
                Space.height(32.h),
                const AuthButton(text: 'Sign in', color: AppColors.primaryColor)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
