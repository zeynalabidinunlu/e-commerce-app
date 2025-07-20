import 'package:e_commerce_project/model/onboarding/onboarding_model.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnBoardingPage({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppCommonSize.paddingAllMd,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            onboardingModel.image,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SizedBox(height: AppCommonSize.size48),
          Text(
            onboardingModel.title,
            style: AppTextTheme.h11,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppCommonSize.size16),
          Text(
            onboardingModel.desc,
            style: AppTextTheme.h66,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
