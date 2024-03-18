import 'package:flutter/material.dart';

import '../../../common/textfield.dart';
import '../../../core/core.dart';

class ProfileField extends StatelessWidget {
  final String? text;
  final TextInputType? type;
  const ProfileField({super.key, this.text, this.type});

  @override
  Widget build(BuildContext context) {
    return CLTextField(
        hintText: text,
        inputType: type,
        border: AppColors.white,
        labelColor: AppColors.lightblue,
        inputColor: AppColors.white,
        suffixIcon: const Icon(
          Icons.check,
          size: 15,
          color: AppColors.white,
        ));
  }
}
