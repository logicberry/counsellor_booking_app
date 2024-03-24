import 'package:counsellor/common/button.dart';
import 'package:counsellor/common/snackbar.dart';
import 'package:counsellor/common/textfield.dart';
import 'package:counsellor/features/authentication/screens/otp_screen.dart';
import 'package:counsellor/features/authentication/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signUp() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      errorMessage(context: context, message: 'Please fill in all fields.');
    } else if (!RegExp(r'^[\w-\.]+@student\.oauife\.edu\.ng$')
        .hasMatch(email)) {
      errorMessage(
        context: context,
        message: 'Please enter a valid student email address.',
      );
    } else {
      Navigator.pushNamed(context, OtpScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, 
        body: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
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
                      CLTextField(
                        hintText: 'Student Email Address',
                        controller: _emailController,
                      ),
                      Space.height(20.h),
                      CLTextField(
                        hintText: 'Password',
                        isPassword: true,
                        controller: _passwordController,
                      ),
                      Space.height(32.h),
                      AuthButton(
                          ontap: () {
                            FocusScope.of(context).unfocus();
                            signUp();
                          },
                          text: 'Sign up',
                          color: AppColors.primaryColor),
                      Space.height(32.h),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
              ],
            ),
          ),
        ));
  }
}
