import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/button.dart';
import '../../../core/core.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Color color, textColor, arrowColor;
  final void Function() ontap;
  const AuthButton(
      {super.key,
      required this.text,
      required this.color,
      this.textColor = AppColors.white,
      this.arrowColor = AppColors.white, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return CLButtton(
        borderColor: AppColors.primaryColor,
        color: color,
        onTap: ontap,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppTheme.clText(text, context, size: 20.h, textColor: textColor),
          Space.height(10.h),
          Icon(
            Icons.arrow_forward_sharp,
            color: arrowColor,
          )
        ]));
  }
}
