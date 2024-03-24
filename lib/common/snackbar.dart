import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../core/core.dart';


errorMessage({required BuildContext context, required String message}) {
  showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        textStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AppColors.white),
      ),
      animationDuration: const Duration(milliseconds: 900));
}
