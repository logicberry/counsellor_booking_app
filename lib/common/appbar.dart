import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/core.dart';

class CLAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText, imageFile;
  final bool implyLeading, action, titleYes;
  final VoidCallback? ontap;
  final IconData icon;
  const CLAppBar({
    Key? key,
    this.action = false,
    this.implyLeading = false,
    this.ontap,
    this.icon = Icons.arrow_back,
    required this.titleYes,
    this.titleText,
    this.imageFile,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(82.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: kToolbarHeight + 5.h,
        shape: const LinearBorder(),
        automaticallyImplyLeading: implyLeading,
        elevation: 0.0,
        leadingWidth: 100,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: titleYes
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(''),
                  Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Badge(
                        smallSize: 12,
                        backgroundColor: Colors.greenAccent,
                        alignment: Alignment.bottomRight,
                        child: Hero(
                          tag: 'profile',
                          child: CircleAvatar(
                            radius: 25.r,
                            backgroundImage: MemoryImage(
                              File(imageFile!).readAsBytesSync(),
                            ),
                          ),
                        ),
                      )),
                ],
              )
            : Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: AppTheme.clText(
                  titleText ?? '',
                  context,
                  size: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
        titleSpacing: 20,
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
        actions: action ? [] : null);
  }
}
