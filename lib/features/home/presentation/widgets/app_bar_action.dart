import 'package:flutter/material.dart';
import 'package:royal_task/core/theme/app_colors.dart';
import 'package:royal_task/core/theme/app_padding.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    super.key,
    this.onTap,
    required this.icon,
  });
  final Function()? onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: AppPadding.paddingA8,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteColor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              AppColors.gradient1,
              AppColors.gradient2,
            ],
          ),
        ),
        child: icon,
      ),
    );
  }
}
