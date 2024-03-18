import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CLButtton extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onTap;
  const CLButtton(
      {super.key,
      required this.child,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          fixedSize: Size(302.w, 72.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: child,
    );
  }
}
