import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/core.dart';

class CLTextField extends StatefulWidget {
  final String? hintText, labeltext;
  final TextEditingController? controller;
  final Widget? icon, prefix;
  final TextInputType? inputType;
  final bool isPassword;
  final Color? border, inputColor, labelColor;
  final Widget? suffixIcon;

  const CLTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.inputType,
      this.labeltext,
      this.icon,
      this.isPassword = false,
      this.prefix,
      this.border,
      this.inputColor,
      this.labelColor,
      this.suffixIcon});

  @override
  State<CLTextField> createState() => _CLTextFieldState();
}

class _CLTextFieldState extends State<CLTextField> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.isPassword;
    _obscureText = false;
    super.initState();
  }

  void pass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder defaultOutlineInputBorder = UnderlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: widget.border ?? AppColors.primaryColor),
    );

    UnderlineInputBorder focusedOutlineInputBorder = UnderlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: widget.border ?? AppColors.primaryColor),
    );
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        obscureText: (widget.isPassword) ? !_obscureText : _obscureText,
        style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'Inter',
            color: widget.inputColor ?? Colors.black,
            letterSpacing: 1,
            decoration: TextDecoration.none,
            decorationStyle: TextDecorationStyle.dotted,
            decorationColor: AppColors.white),
        controller: widget.controller,
        keyboardType: widget.inputType ?? TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            labelText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.only(top: 3),
            // isDense: true,
            floatingLabelStyle: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: widget.labelColor ?? Colors.grey),
            labelStyle: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: widget.labelColor ?? Colors.grey),
            hintStyle: Theme.of(context).textTheme.bodyLarge,
            prefixIcon: widget.prefix,
            suffix: (widget.isPassword)
                ? GestureDetector(
                    onTap: pass,
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
            suffixIcon: widget.suffixIcon,
            border: defaultOutlineInputBorder,
            enabledBorder: defaultOutlineInputBorder,
            focusedBorder: focusedOutlineInputBorder),
        cursorColor: AppColors.primaryColor,
      ),
    );
  }
}
