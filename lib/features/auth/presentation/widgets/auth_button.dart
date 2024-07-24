import 'package:flutter/material.dart';
import 'package:royal_task/core/extentions/extentions.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_padding.dart';
import '../../../../core/theme/app_radius.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.gradient1,
            AppColors.gradient2,
          ],
        ),
        borderRadius: AppRadius.radiusC10,
      ),
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: MaterialButton(
        minWidth: double.infinity,
        padding: AppPadding.paddingA20,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.radiusC10),
        onPressed: onPressed,
        child: Text(
          text,
          style: context.primaryTextTheme.labelLarge,
        ),
      ),
    );
  }
}
