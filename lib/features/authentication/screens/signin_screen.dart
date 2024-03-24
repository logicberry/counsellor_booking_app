import 'package:counsellor/common/button.dart';
import 'package:counsellor/common/textfield.dart';
import 'package:counsellor/features/authentication/widgets/auth_button.dart';
import 'package:counsellor/features/home/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/snackbar.dart';
import '../../../core/core.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/signin-screen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signIn() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    String? storedEmail = _prefs.getString('email');
    String? storedPassword = _prefs.getString('password');

    if (email.isEmpty || password.isEmpty) {
      errorMessage(context: context, message: 'Please fill in all fields.');
    } else if (storedEmail == null || storedPassword == null) {
      errorMessage(
          context: context, message: 'No account found. Please sign up.');
    } else if (email != storedEmail || password != storedPassword) {
      errorMessage(context: context, message: 'Invalid email or password.');
    } else {
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          physics: const BouncingScrollPhysics(),
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
                    Space.height(8.h),
                    AppTheme.clText('Forgot Password ?', context,
                        textColor: AppColors.primaryColor, size: 14),
                    Space.height(32.h),
                    AuthButton(
                        ontap: () {
                          FocusScope.of(context).unfocus();
                          signIn();
                        },
                        text: 'Sign in',
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
        ));
  }
}
