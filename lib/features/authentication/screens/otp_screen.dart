import 'package:counsellor/common/appbar.dart';
import 'package:counsellor/common/button.dart';
import 'package:counsellor/features/authentication/screens/form_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../core/core.dart';

class OtpScreen extends StatelessWidget {
  static const routeName = '/otp-screen';
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
        ),
      ],
    );
    final defaultPinTheme = PinTheme(
        width: 45.w,
        height: 59.h,
        textStyle: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: AppColors.lightGrey),
          ),
        ));
    return Scaffold(
        appBar: CLAppBar(
          titleYes: false,
          implyLeading: true,
          ontap: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Space.height(30),
              Center(child: Image.asset(AssetPath.otp)),
              Space.height(13),
              AppTheme.clText('OTP Verification', context,
                  size: 24, fontWeight: FontWeight.w700),
              Space.height(13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTheme.clText('Enter the OTP sent to ', context,
                      size: 16,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.darkGrey),
                  AppTheme.clText('design@test.com', context,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.darkGrey),
                ],
              ),
              Space.height(29),
              Pinput(
                separatorBuilder: (index) => SizedBox(width: 26.h),
                length: 4,
                cursor: cursor,
                defaultPinTheme: defaultPinTheme,
                pinAnimationType: PinAnimationType.slide,
              ),
              Space.height(29),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTheme.clText('Didn\'t receive OTP?   ', context,
                      size: 14,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.lightGrey),
                  AppTheme.clText('Resend OTP', context,
                      size: 14,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.primaryColor),
                ],
              ),
              Space.height(43),
              CLButtton(
                color: AppColors.primaryColor,
                onTap: () => Navigator.pushNamed(
                    context, PatientProfileScreen.routeName),
                borderColor: AppColors.primaryColor,
                child: AppTheme.clText('verify', context, size: 20),
              )
            ],
          ),
        ));
  }
}
