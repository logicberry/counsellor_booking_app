import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/core.dart';

class CLAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool implyLeading, action;
  final void Function()? ontap;
  final IconData icon;
  const CLAppBar({
    Key? key,
    this.title,
    this.action = false,
    this.implyLeading = false,
    this.ontap,
    this.icon = Icons.arrow_back,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(82.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: implyLeading,
        elevation: 0,
        leadingWidth: 100,
        backgroundColor: AppColors.primaryColor,
        title: AppTheme.clText(title!, context,
            size: 16,
            textColor: AppColors.primaryColor,
            fontWeight: FontWeight.w600),
        centerTitle: true,
        leading: implyLeading
            ? Container(
                decoration: const BoxDecoration(
                    color: AppColors.white, shape: BoxShape.circle),
                margin: const EdgeInsets.only(top: 10),
                child: IconButton(
                    onPressed: ontap,
                    icon: Icon(
                      icon,
                      color: AppColors.primaryColor,
                    )),
              )
            : null,
        actions: action
            ? [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: AppColors.primaryColor,
                    ))
              ]
            : null);
  }
}
