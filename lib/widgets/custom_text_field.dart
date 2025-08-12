import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.validator,
    this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppCommonSize.size16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppCommonSize.size16),
        boxShadow: [
          BoxShadow(
            color: AppColorTheme.primaryColor.withValues(alpha: 0.3),
            offset: Offset(0, 5),
            blurRadius: AppCommonSize.size20,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validator,
        style: TextStyle(
          color: AppColorTheme.buttonPrimary,
          fontSize: AppCommonSize.size16,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: AppColorTheme.textSecondary,
            fontSize: 14,
          ),
          prefixIcon: Icon(prefixIcon, color: AppColorTheme.primaryColor),
          suffixIcon:
              suffixIcon ??
              (isPassword
                  ? IconButton(
                      onPressed: () {},
                      color: AppColorTheme.primaryColor,
                      icon: Icon(Icons.visibility_outlined),
                    )
                  : null),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppCommonSize.size16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppCommonSize.size20,
            vertical: AppCommonSize.size16,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppCommonSize.size16),
            borderSide: BorderSide(color: AppColorTheme.primaryColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppCommonSize.size16),
            borderSide: BorderSide(
              color: AppColorTheme.textSecondary.withValues(alpha: 0.1),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
