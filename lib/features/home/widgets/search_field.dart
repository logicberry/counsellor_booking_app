import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class SearchField extends StatelessWidget {
  final String? hintText, labeltext;
  final TextEditingController? controller;
  final Widget? icon, prefix;
  final TextInputType? inputType;
  const SearchField(
      {super.key,
      this.hintText,
      this.controller,
      this.inputType,
      required this.labeltext,
      this.icon,
      this.prefix});
  @override
  Widget build(BuildContext context) {
    const OutlineInputBorder customOutlineInputBorder =
        OutlineInputBorder(borderSide: BorderSide.none);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.search.withOpacity(0.5),
      ),
      height: 52.h,
      child: TextFormField(
        style: const TextStyle(
            fontSize: 16,
            letterSpacing: 1,
            decoration: TextDecoration.none,
            decorationStyle: TextDecorationStyle.dotted,
            decorationColor: AppColors.white),
        controller: controller,
        keyboardType: inputType ?? TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: 'Search for counsellor',
            contentPadding: const EdgeInsets.all(15),
            hintStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 11,
            ),
            suffixIcon: prefix,
            border: customOutlineInputBorder,
            enabledBorder: customOutlineInputBorder,
            focusedBorder: customOutlineInputBorder),
        cursorColor: AppColors.primaryColor,
      ),
    );
  }
}
