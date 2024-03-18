import 'package:flutter/material.dart';

import '../core/core.dart';

class NavItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  const NavItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      horizontalTitleGap: 20,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      minLeadingWidth: 26,
      dense: true,
      onTap: onTap,
      title: AppTheme.clText(
        text,
        context,
        size: 16,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      leading: Icon(
        icon,
        color: isSelected ? AppColors.primaryColor : AppColors.darkGrey,
      ),
    );
  }
}
