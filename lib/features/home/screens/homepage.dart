import 'package:counsellor/common/appbar.dart';
import 'package:counsellor/common/drawer_nav.dart';
import 'package:counsellor/features/home/screens/counsellor_info_screen.dart';
import 'package:counsellor/features/home/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String? userName = '';
  String? userImage = '';

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('firstName');
      userImage = prefs.getString('image');
    });
  }

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
          titleYes: true,
          implyLeading: true,
          icon: Icons.menu,
          action: true,
          imageFile: userImage,
          ontap: () {
            _scaffoldKey.currentState?.openDrawer();
          }),
      drawer: SideMenu(
        name: userName!,
        image: userImage!,
      ),
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
                        padding: EdgeInsets.only(left: 20.0.w),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) => Column(
                            children: [
                              CircleAvatar(
                                  radius: 27.r,
                                  backgroundColor: backgroundColors[index],
                                  child: Image.asset(icons[index])),
                              Space.height(8),
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
                    profession: 'Career Counsellor',
                  ),
                  Space.height(30),
                  DoctorCard(
                      ontap: () => Navigator.pushNamed(
                          context, CounsellorInfoPage.routeName,
                          arguments: const CounsellorInfoPage(
                              name: 'Dr. Malik Rasaq',
                              about:
                                  "Dr. Malik Rasaq is not just a psychologist; he's your trusted companion on the journey to mental well-being. With a passion for understanding the intricacies of the human mind, Dr. Noah offers a unique blend of empathy and scientific expertise through our counseling app. Drawing from years of experience and a commitment to destigmatizing mental health, Dr. Noah creates a safe space for you to explore your thoughts and emotions. Whether you're struggling with anxiety, depression, or simply seeking guidance, Dr. Noah provides personalized support tailored to your needs.",
                              title: 'Psychologist')),
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
