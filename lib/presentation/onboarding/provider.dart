
import 'package:e_commerce_project/presentation/onboarding/on_boarding_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingViewModelProvider = Provider<OnboardingViewModel>((ref) {
  return OnboardingViewModel();
});