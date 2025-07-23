// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final List<Color> gradient;
  final double? width;
  final double height;
  final bool isLoading;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.gradient = AppColorTheme.primaryGradient,
    this.width,
    this.height = AppCommonSize.size56,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(AppCommonSize.size16),
        boxShadow: [
          BoxShadow(
            color: gradient.first.withValues(alpha: 0),
            blurRadius: AppCommonSize.size20,
            offset: Offset(0, AppCommonSize.size12),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
         backgroundColor: Colors.transparent,
         foregroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppCommonSize.size16),
          ),
          padding: EdgeInsets.zero

        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: AppCommonSize.size24,
                  width: AppCommonSize.size24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(text, style: AppTextTheme.h5),
        ),
      ),
    );
  }
}
