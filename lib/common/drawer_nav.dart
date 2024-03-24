import 'package:counsellor/common/button.dart';
import 'package:counsellor/common/navite.dart';
import 'package:counsellor/features/home/screens/counsellors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/core.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedItemIndex = 0;

  void selectItem(int index) {
    setState(() {
      selectedItemIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, CounsellorsListPage.routeName);
        break;
      case 1:
        Navigator.pushNamed(context, "/m");
        break;
      case 2:
        Navigator.pushNamed(context, "/m");
        break;
      case 3 || 4 || 6:
        Navigator.pushNamed(context, "/m");

        break;
      case 5:
        Navigator.pushNamed(context, "/m");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.white,
        width: 298.w,
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 100.h,
                    width: 210.w,
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.white,
                            child: Image.asset(AssetPath.profile)),
                        title: AppTheme.clText('Malik', context,
                            size: 16, fontWeight: FontWeight.w600),
                        subtitle: AppTheme.clText('@Malik', context,
                            size: 11, fontWeight: FontWeight.w400),
                      ),
                    )),
                IconButton(
                  icon: const Icon(Icons.close),
                  color: AppColors.primaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          NavItem(
            icon: AssetPath.notification,
            text: 'List of Counsellors',
            isSelected: selectedItemIndex == 0,
            onTap: () => selectItem(0),
          ),
          NavItem(
            icon: AssetPath.notification,
            text: 'Notifications',
            isSelected: selectedItemIndex == 1,
            onTap: () => selectItem(1),
          ),
          NavItem(
            icon: AssetPath.support,
            text: 'Support',
            isSelected: selectedItemIndex == 2,
            onTap: () => selectItem(2),
          ),
          NavItem(
            icon: AssetPath.about,
            text: 'About',
            isSelected: selectedItemIndex == 3,
            onTap: () => selectItem(3),
          ),
          Space.height(100),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CLButtton(
                color: AppColors.white,
                onTap: () {},
                borderColor: AppColors.primaryColor,
                child: Row(
                  children: [
                    AppTheme.clText(
                      'Sign Out',
                      context,
                      textColor: AppColors.primaryColor,
                      size: 16,
                    ),
                    const Spacer(),
                    SvgPicture.asset(AssetPath.logout)
                  ],
                )),
          )
        ]));
  }
}
