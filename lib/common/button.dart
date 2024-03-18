import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CLButtton extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color? borderColor;
  final VoidCallback onTap;
  const CLButtton(
      {super.key,
      required this.child,
      required this.color,
      required this.onTap, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: color,
          fixedSize: Size(302.w, 72.h),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor!),
              borderRadius: BorderRadius.circular(28.r))),
      child: child,
    );
  }
}
