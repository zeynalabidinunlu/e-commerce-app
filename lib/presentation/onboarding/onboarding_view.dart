import 'package:e_commerce_project/presentation/onboarding/onboarding_page.dart';
import 'package:e_commerce_project/presentation/onboarding/provider.dart';
import 'package:e_commerce_project/presentation/welcome/welcome_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardingView extends ConsumerStatefulWidget {
  const OnBoardingView({super.key});

  @override
  ConsumerState<OnBoardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingItems = ref
        .read(onboardingViewModelProvider)
        .onboardingItems;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingItems.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(onboardingModel: onboardingItems[index]);
            },
          ),
          Positioned(
            top: AppCommonSize.size48,
            right: AppCommonSize.size48,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeView()),
                );
              },
              child: Text(
                'Atla',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColorTheme.primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: AppCommonSize.size48,
            left: AppCommonSize.size24,
            right: AppCommonSize.size24,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingItems.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(
                        horizontal: AppCommonSize.marginXs,
                      ),
                      height: AppCommonSize.size8,
                      width: _currentPage == index
                          ? AppCommonSize.size24
                          : AppCommonSize.size8,
                      decoration: BoxDecoration(
                        color: AppColorTheme.primaryColor.withValues(
                          alpha: _currentPage == index ? 1 : 0.3,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppCommonSize.size4,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: AppCommonSize.size32),
                Row(
                  children: [
                    if (_currentPage > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: AppCommonSize.paddingVerticalMd,
                            side: BorderSide(color: AppColorTheme.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppCommonSize.size12,
                              ),
                            ),
                          ),
                          child: Text(
                            'Önceki',
                            style: TextStyle(
                              color: AppColorTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                    if (_currentPage > 0)
                      const SizedBox(width: AppCommonSize.size16),
                    Expanded(
                      child: GradientButton(
                        gradient: AppColorTheme.secondaryGradient,
                        text: _currentPage == onboardingItems.length - 1
                            ? "Haydi Başlayalım "
                            : "Sonraki",
                        onPressed: () {
                          if (_currentPage < onboardingItems.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomeView(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
