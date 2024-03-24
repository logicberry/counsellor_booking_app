import 'dart:io';

import 'package:counsellor/common/appbar.dart';
import 'package:counsellor/features/authentication/widgets/profile_field.dart';
import 'package:counsellor/features/home/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  late SharedPreferences _prefs;
  late ImagePicker _picker;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
    _picker = ImagePicker();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> selectImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedImage;
    });
  }

  void next() {
    String phone = _phoneController.text.trim();
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String dob = _dobController.text.trim();

    if (phone.isEmpty || firstName.isEmpty || lastName.isEmpty || dob.isEmpty) {
      errorMessage(context: context, message: 'Please fill in all fields.');
    }
    if (_imageFile == null) {
      errorMessage(context: context, message: 'Please select an image.');
    } else {
      // Save profile details along with authentication credentials
      _prefs.setString('phone', phone);
      _prefs.setString('firstName', firstName);
      _prefs.setString('lastName', lastName);
      _prefs.setString('dob', dob);
      _prefs.setString('image', _imageFile!.path);

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
                  onTap: selectImage,
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: const BoxDecoration(
                        color: AppColors.lightblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: _imageFile != null
                        ? Container(
                            height: 100.h,
                            width: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.white,
                                width: 2,
                              ),
                              image: DecorationImage(
                                image: FileImage(File(_imageFile!.path)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Image.asset(
                            AssetPath.avatar,
                            color: Colors.white,
                          ),
                  ),
                ),
                Space.height(100),
                ProfileField(
                  text: 'Telephone Number',
                  type: TextInputType.phone,
                  controller: _phoneController,
                ),
                Space.height(20),
                ProfileField(
                  text: 'First Name',
                  type: TextInputType.name,
                  controller: _firstNameController,
                ),
                Space.height(20),
                ProfileField(
                  text: 'Last Name',
                  type: TextInputType.name,
                  controller: _lastNameController,
                ),
                Space.height(20),
                ProfileField(
                  text: 'Date of Birth',
                  type: TextInputType.datetime,
                  controller: _dobController,
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
