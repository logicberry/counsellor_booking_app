import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../core/core.dart';

class CLAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool implyLeading, action;
  final void Function()? ontap;
  const CLAppBar({
    Key? key,
    this.title,
    this.action = false,
    this.implyLeading = false,
    this.ontap,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 13),
      child: AppBar(
          automaticallyImplyLeading: implyLeading,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leadingWidth: 30,
          title: AppTheme.clText(title!, context,
              size: 16,
              textColor: AppColors.primaryColor,
              fontWeight: FontWeight.w600),
          centerTitle: true,
          leading: implyLeading
              ? IconButton(
                  onPressed: ontap ??
                      () => Navigator.pop(context, PageTransitionType.fade),
                  icon: const Icon(Icons.arrow_back_ios,
                      color: AppColors.primaryColor),
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
              : null),
    );
  }
}
