import 'package:counsellor/common/appbar.dart';
import 'package:counsellor/features/authentication/widgets/profile_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/button.dart';
import '../../../core/core.dart';

class PatientProfileScreen extends StatelessWidget {
    static const routeName = '/patientprofile-screen';

  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CLAppBar(
        title: '',
        implyLeading: true,
      ),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: const BoxDecoration(
                        color: AppColors.lightblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Image.asset(
                      AssetPath.avatar,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Space.height(100),
                const ProfileField(
                  text: 'Telephone Number',
                  type: TextInputType.phone,
                ),
                Space.height(20),
                const ProfileField(
                  text: 'First Name',
                  type: TextInputType.name,
                ),
                Space.height(20),
                const ProfileField(
                  text: 'Last Name',
                  type: TextInputType.name,
                ),
                Space.height(20),
                const ProfileField(
                  text: 'Date of Birth',
                  type: TextInputType.datetime,
                ),
                Space.height(94),
                CLButtton(
                  color: AppColors.white,
                  onTap: () {},
                  borderColor: AppColors.primaryColor,
                  child: AppTheme.clText('Complete ✓', context,
                      size: 20, textColor: AppColors.primaryColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
