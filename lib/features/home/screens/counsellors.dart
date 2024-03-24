import 'package:counsellor/common/appbar.dart';
import 'package:counsellor/features/home/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CounsellorsListPage extends StatelessWidget {
  static const routeName = '/counsellor-screen';

  const CounsellorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CLAppBar(
        titleYes: false,
        titleText: 'Counsellors List',
        implyLeading: true,
        ontap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const DoctorCard(
                  color: AppColors.lightpink,
                  image: AssetPath.femaleDoctor,
                  name: 'Dr. Mrs. Adebayo Faith',
                  profession: 'Career Counsellor'),
              Space.height(30),
              const DoctorCard(
                  color: AppColors.ash,
                  image: AssetPath.maleDoctor,
                  name: 'Dr. Omoleye Noah',
                  profession: 'Psychologist'),
              Space.height(30),
              const DoctorCard(
                  color: AppColors.lightpink,
                  image: AssetPath.femaleDoctor,
                  name: 'Dr. Mrs. Adebayo Faith',
                  profession: 'Career Counsellor'),
              Space.height(30),
              const DoctorCard(
                  color: AppColors.ash,
                  image: AssetPath.maleDoctor,
                  name: 'Dr. Omoleye Noah',
                  profession: 'Psychologist'),
              Space.height(30),
              const DoctorCard(
                  color: AppColors.lightpink,
                  image: AssetPath.femaleDoctor,
                  name: 'Dr. Mrs. Adebayo Faith',
                  profession: 'Career Counsellor'),
              Space.height(30),
              const DoctorCard(
                  color: AppColors.ash,
                  image: AssetPath.maleDoctor,
                  name: 'Dr. Omoleye Noah',
                  profession: 'Psychologist'),
            ],
          ),
        ),
      ),
    );
  }
}
