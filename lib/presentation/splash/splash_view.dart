import 'dart:async';

import 'package:e_commerce_project/core/constants/app_common_strings.dart';
import 'package:e_commerce_project/presentation/onboarding/onboarding_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  double _loadingProgress = 0.0;
  Timer? _progressTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _controller.forward();

    _startLoadingProgress();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnBoardingView()),
        );
      }
    });
  }

  void _startLoadingProgress() {
    const totalSteps = 100;
    const stepDuration = Duration(milliseconds: 25);
    _progressTimer = Timer.periodic(stepDuration, (timer) {
      setState(() {
        if (_loadingProgress < 1.0) {
          _loadingProgress += 1 / totalSteps;
        } else {
          _progressTimer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _progressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColorTheme.primaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -AppCommonSize.size112,
              right: -AppCommonSize.size112,
              child: Container(
                width: AppCommonSize.size192,
                height: AppCommonSize.size192,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
            ),
            Positioned(
              bottom: -AppCommonSize.size52,
              left: -AppCommonSize.size52,
              child: Container(
                width: AppCommonSize.size160,
                height: AppCommonSize.size160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            padding: AppCommonSize.paddingAllMd,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: AppCommonSize.size20,
                                  offset: const Offset(
                                    AppCommonSize.shadowNone,
                                    AppCommonSize.shadowMedium,
                                  ),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.shopping_cart,
                              size: AppCommonSize.size64,
                              color: AppColorTheme.primaryColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: AppCommonSize.heightMd),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: const Column(
                          children: [
                            Text(
                              AppCommonStrings.appName,
                              style: AppTextTheme.h1,
                            ),
                            SizedBox(height: AppCommonSize.size12),
                            Text(
                              AppCommonStrings.splashDesc,
                              style: AppTextTheme.h6,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppCommonSize.size48),
                  SizedBox(
                    width: AppCommonSize.size192,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppCommonSize.radiusMedium,
                          ),
                          child: LinearProgressIndicator(
                            value: _loadingProgress,
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.1,
                            ),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                            minHeight: AppCommonSize.size8,
                          ),
                        ),
                        SizedBox(height: AppCommonSize.size16),
                        Text(
                          '${(_loadingProgress * 100).toInt()}%',
                          style: AppTextTheme.h5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
