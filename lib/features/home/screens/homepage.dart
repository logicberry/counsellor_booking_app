import 'package:counsellor/common/appbar.dart';
import 'package:counsellor/common/drawer_nav.dart';
import 'package:counsellor/features/home/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../widgets/search_field.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<Color> backgroundColors = [
      const Color(0xffE2F0E9),
      const Color(0xffFDF0EA),
      const Color(0xffF0F3FA),
      const Color(0xffF5FEED)
    ];
    List<String> texts = [
      'Psycologist',
      'Mental Health',
      'Career',
      'Drug Abuse'
    ];

    List<String> icons = [
      AssetPath.sales,
      AssetPath.ribbon,
      AssetPath.career,
      AssetPath.drug
    ];
    return Scaffold(
      key: _scaffoldKey,
      appBar: CLAppBar(
          title: '',
          implyLeading: true,
          icon: Icons.menu,
          action: true,
          ontap: () {
            _scaffoldKey.currentState?.openDrawer();
          }),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r)),
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTheme.clText('Let\'s find your counsellor', context,
                        size: 18,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.white),
                    Space.height(27),
                    SearchField(
                      labeltext: 'Hello',
                      hintText: 'Search for a counsellor',
                      prefix: CircleAvatar(
                        radius: 27.r,
                        backgroundColor: AppColors.white,
                        child: const Icon(
                          Icons.search,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.height(19),
                  AppTheme.clText('Categories', context,
                      size: 18, fontWeight: FontWeight.w500),
                  Space.height(10),
                  AppTheme.clText('Find your Counselor quickly  ', context,
                      size: 12,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.lightGrey),
                  Space.height(25),
                  SizedBox(
                    height: 85.h,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) => Column(
                            children: [
                              CircleAvatar(
                                  radius: 27.r,
                                  backgroundColor: backgroundColors[index],
                                  child: Image.asset(icons[index])),
                              Space.height(10),
                              AppTheme.clText(texts[index], context,
                                  size: 11, fontWeight: FontWeight.w500),
                            ],
                          ),
                          separatorBuilder: (context, index) => Space.width(25),
                        ),
                      ),
                    ),
                  ),
                  Space.height(25),
                  AppTheme.clText('Available Counsellor', context,
                      size: 18, fontWeight: FontWeight.w500),
                  Space.height(10),
                  AppTheme.clText('Book a Session today', context,
                      size: 12,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.lightGrey),
                  Space.height(17),
                  const DoctorCard(
                      color: AppColors.lightpink,
                      image: AssetPath.femaleDoctor,
                      name: 'Dr. Mrs. Adebayo Faith',
                      profession: 'Career Counsellor'),
                  Space.height(30),
                  const DoctorCard(
                      color: AppColors.ash,
                      image: AssetPath.maleDoctor,
                      name: 'Dr. Malik Rasaq',
                      profession: 'Psychologist'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
