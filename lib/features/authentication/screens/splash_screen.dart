import 'package:counsellor/features/authentication/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, SignUpScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 128.h,
                width: 128.w,
                child: Image.asset(AssetPath.logoGreen)),
            Space.height(8.h),
            AppTheme.clText(
                size: 24,
                fontWeight: FontWeight.w400,
                textColor: AppColors.primaryColor,
                'Counsellor',
                context),
          ],
        ),
      ),
    );
  }
}
