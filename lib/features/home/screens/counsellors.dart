import 'package:counsellor/common/appbar.dart';
import 'package:counsellor/features/home/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'counsellor_info_screen.dart';

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
              DoctorCard(
                  ontap: () => Navigator.pushNamed(
                      context, CounsellorInfoPage.routeName,
                      arguments: const CounsellorInfoPage(
                          name: 'Dr Mrs Adebayo Faith',
                          about:
                              "Dr. Mrs Adebayo Faith is a career counselor with a passion for helping individuals navigate the complexities of the job market. With years of experience in the field, Dr. Faith offers personalized guidance tailored to your unique needs. Whether you're a recent graduate or a seasoned professional, Dr. Faith provides expert advice to help you achieve your career goals. Book a session with Dr. Faith today and take the first step towards a brighter future.",
                          title: 'Career Counsellor')),
                  color: AppColors.lightpink,
                  image: AssetPath.femaleDoctor,
                  name: 'Dr. Mrs. Adebayo Faith',
                  profession: 'Career Counsellor'),
              Space.height(30),
              DoctorCard(
                  ontap: () => Navigator.pushNamed(
                      context, CounsellorInfoPage.routeName,
                      arguments: const CounsellorInfoPage(
                          name: 'Dr. Omoyele Noah',
                          about:
                              "Dr. Omoleye Noah is not just a psychologist; he's your trusted companion on the journey to mental well-being. With a passion for understanding the intricacies of the human mind, Dr. Noah offers a unique blend of empathy and scientific expertise through our counseling app. Drawing from years of experience and a commitment to destigmatizing mental health, Dr. Noah creates a safe space for you to explore your thoughts and emotions. Whether you're struggling with anxiety, depression, or simply seeking guidance, Dr. Noah provides personalized support tailored to your needs.",
                          title: 'Psychologist')),
                  color: AppColors.ash,
                  image: AssetPath.maleDoctor,
                  name: 'Dr. Omoleye Noah',
                  profession: 'Psychologist'),
              Space.height(30),
              DoctorCard(
                  ontap: () => Navigator.pushNamed(
                      context, CounsellorInfoPage.routeName,
                      arguments: const CounsellorInfoPage(
                          name: 'Dr Mrs Adebayo Faith',
                          about:
                              "Dr. Mrs Adebayo Faith is a career counselor with a passion for helping individuals navigate the complexities of the job market. With years of experience in the field, Dr. Faith offers personalized guidance tailored to your unique needs. Whether you're a recent graduate or a seasoned professional, Dr. Faith provides expert advice to help you achieve your career goals. Book a session with Dr. Faith today and take the first step towards a brighter future.",
                          title: 'Career Counsellor')),
                  color: AppColors.lightpink,
                  image: AssetPath.femaleDoctor,
                  name: 'Dr. Mrs. Adebayo Faith',
                  profession: 'Career Counsellor'),
              Space.height(30),
              DoctorCard(
                  ontap: () => Navigator.pushNamed(
                      context, CounsellorInfoPage.routeName,
                      arguments: const CounsellorInfoPage(
                          name: 'Dr. Omoyele Noah',
                          about:
                              "Dr. Omoleye Noah is not just a psychologist; he's your trusted companion on the journey to mental well-being. With a passion for understanding the intricacies of the human mind, Dr. Noah offers a unique blend of empathy and scientific expertise through our counseling app. Drawing from years of experience and a commitment to destigmatizing mental health, Dr. Noah creates a safe space for you to explore your thoughts and emotions. Whether you're struggling with anxiety, depression, or simply seeking guidance, Dr. Noah provides personalized support tailored to your needs.",
                          title: 'Psychologist')),
                  color: AppColors.ash,
                  image: AssetPath.maleDoctor,
                  name: 'Dr. Omoleye Noah',
                  profession: 'Psychologist'),
              Space.height(30),
              DoctorCard(
                  ontap: () => Navigator.pushNamed(
                      context, CounsellorInfoPage.routeName,
                      arguments: const CounsellorInfoPage(
                          name: 'Dr Mrd Adebayo Faith',
                          about:
                              "Dr. Mrs Adebayo Faith is a career counselor with a passion for helping individuals navigate the complexities of the job market. With years of experience in the field, Dr. Faith offers personalized guidance tailored to your unique needs. Whether you're a recent graduate or a seasoned professional, Dr. Faith provides expert advice to help you achieve your career goals. Book a session with Dr. Faith today and take the first step towards a brighter future.",
                          title: 'Career Counsellor')),
                  color: AppColors.lightpink,
                  image: AssetPath.femaleDoctor,
                  name: 'Dr. Mrs. Adebayo Faith',
                  profession: 'Career Counsellor'),
              Space.height(30),
              DoctorCard(
                  ontap: () => Navigator.pushNamed(
                      context, CounsellorInfoPage.routeName,
                      arguments: const CounsellorInfoPage(
                          name: 'Dr. Omoyele Noah',
                          about:
                              "Dr. Omoleye Noah is not just a psychologist; he's your trusted companion on the journey to mental well-being. With a passion for understanding the intricacies of the human mind, Dr. Noah offers a unique blend of empathy and scientific expertise through our counseling app. Drawing from years of experience and a commitment to destigmatizing mental health, Dr. Noah creates a safe space for you to explore your thoughts and emotions. Whether you're struggling with anxiety, depression, or simply seeking guidance, Dr. Noah provides personalized support tailored to your needs.",
                          title: 'Psychologist')),
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
