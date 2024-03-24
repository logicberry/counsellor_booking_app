import 'package:counsellor/common/appbar.dart';
import 'package:counsellor/features/authentication/widgets/profile_field.dart';
import 'package:counsellor/features/home/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/button.dart';
import '../../../common/snackbar.dart';
import '../../../core/core.dart';

class PatientProfileScreen extends StatefulWidget {
  static const routeName = '/patientprofile-screen';

  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();

    super.dispose();
  }

  void next() {
    String phone = _phoneController.text.trim();
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String dob = _dobController.text.trim();

    if (phone.isEmpty || firstName.isEmpty || lastName.isEmpty || dob.isEmpty) {
      errorMessage(context: context, message: 'Please fill in all fields.');
    } else {
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CLAppBar(
        titleYes: false,
        implyLeading: true,
        ontap: () => Navigator.pop(context),
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
                  onTap: () => next(),
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
