import 'package:counsellor/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CLAppBar(
        title: '',
        implyLeading: true,
        icon: Icons.menu,
        action: true,
      ),
      body: Column(
        children: [
          Container(
            height: 150.h,
            width: double.infinity,
            color: AppColors.primaryColor,
          )
        ],
      ),
    );
  }
}
