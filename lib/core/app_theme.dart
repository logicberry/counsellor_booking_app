import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      colorScheme: const ColorScheme.light(
        background: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.white,
      textTheme: const TextTheme(),
      fontFamily: 'Inter');

  static Text clText(String text, BuildContext context,
      {FontWeight? fontWeight,
      double? size,
      Color? textColor,
      double? lineheight,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: 'Inter',
          fontSize: size?.h,
          fontWeight: fontWeight,
          color: textColor,
          height: lineheight),
    );
  }
}
