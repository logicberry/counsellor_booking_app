import 'package:counsellor/common/button.dart';
import 'package:counsellor/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/appbar.dart';

class CounsellorInfoPage extends StatelessWidget {
  static const routeName = '/counsellorinfo-screen';

  const CounsellorInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CLAppBar(
        titleYes: false,
        titleText: 'Information',
        implyLeading: true,
        ontap: () => Navigator.pop(context),
        action: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            Container(
              height: 203.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.darkGrey, width: 0.2),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 23.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AssetPath.maleDoctor,
                          height: 96.h,
                        ),
                        Space.width(15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTheme.clText('Dr. Mrs. Adebayo Faith', context,
                                size: 14, fontWeight: FontWeight.w500),
                            Space.height(5),
                            AppTheme.clText('Psychologist', context,
                                textColor: AppColors.lightGrey, size: 12),
                            Space.height(20),
                            Image.asset(AssetPath.call),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 48.h,
                      child: CLButtton(
                          borderColor: AppColors.primaryColor,
                          color: AppColors.primaryColor,
                          onTap: () {},
                          child: const Text('Book Appointment')),
                    ),
                  ],
                ),
              ),
            ),
            Space.height(20),
            DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                        labelPadding: EdgeInsets.zero,
                        labelColor: AppColors.primaryColor,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600),
                        unselectedLabelColor: AppColors.darkGrey,
                        indicatorColor: AppColors.primaryColor,
                        tabs: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.darkGrey,
                                              width: 1))),
                                  child: const Tab(
                                    text: 'Overview',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.darkGrey,
                                              width: 1))),
                                  child: const Tab(
                                    text: 'Review',
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                    SizedBox(
                      height: 285.h,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Overview Tab View
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTheme.clText('About', context,
                                    size: 16, fontWeight: FontWeight.w500),
                                Space.height(10),
                                AppTheme.clText(
                                    "Dr. Omoleye Noah is not just a psychologist; he's your trusted companion on the journey to mental well-being.With a passion for understanding the intricacies of the human mind, Dr. Noah offers a unique blend of empathy and scientific expertise through our counseling app. Drawing from years of experience and a commitment to destigmatizing mental health, Dr. Noah creates a safe space for you to explore your thoughts and emotions. Whether you're struggling with anxiety, depression, or simply seeking guidance, Dr. Noah provides personalized support tailored to your needs.",
                                    context,
                                    size: 13,
                                    textColor:
                                        AppColors.darkGrey.withOpacity(0.5)),
                              ],
                            ),
                          ),
                          // Reviews Tab View
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                children: [],
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCard(
                  color: AppColors.primaryColor,
                  title: 'Patients',
                  number: '10',
                  unit: 'k',
                ),
                InfoCard(
                  color: Colors.redAccent,
                  title: 'Experience',
                  number: '4',
                  unit: 'Yrs',
                ),
                InfoCard(
                  color: Colors.orangeAccent,
                  title: 'Rating',
                  number: '4.8',
                  unit: '',
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final Color color;
  final String title, number, unit;
  const InfoCard(
      {super.key,
      required this.color,
      required this.title,
      required this.number,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.h,
      width: 105.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTheme.clText(title, context,
                  size: 12,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.white),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppTheme.clText(number, context,
                      size: 20,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.white),
                  Space.width(3),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: AppTheme.clText(unit, context,
                        size: 11,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.white),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
