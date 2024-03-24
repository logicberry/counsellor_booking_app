import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class DoctorCard extends StatelessWidget {
  final String name, profession;
  final Color color;
  final String image;
  final VoidCallback ontap;
  const DoctorCard(
      {super.key,
      required this.color,
      required this.image,
      required this.name,
      required this.profession,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTheme.clText(name, context,
                      size: 13, fontWeight: FontWeight.w500),
                  Space.height(5),
                  AppTheme.clText(profession, context,
                      size: 11,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.lightGrey),
                ],
              ),
              Image.asset(image)
            ],
          ),
        ),
      ),
    );
  }
}
