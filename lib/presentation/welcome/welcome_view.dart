import 'package:e_commerce_project/core/constants/app_common_strings.dart';
import 'package:e_commerce_project/presentation/login/login_view.dart';
import 'package:e_commerce_project/presentation/signup/signup_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/theme/app_text_theme.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColorTheme.darkBackground,
              image: DecorationImage(
                image: AssetImage('assets/images/image1.png'),
                fit: BoxFit.cover,
                opacity: 0.3,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppCommonSize.size24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            AppCommonSize.size12,
                          ),
                        ),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColorTheme.primaryColor,
                          size: AppCommonSize.iconHuge,
                        ),
                      ),
                      SizedBox(width: AppCommonSize.size12),
                      Text(AppCommonStrings.appName, style: AppTextTheme.h1),
                    ],
                  ),
                  SizedBox(height: AppCommonSize.size12),
                  Text(
                    'Kendi Tarzını\nKeşfet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size12),
                  Text(
                    'Favori markalarınla alışveriş yap, yenilerini keşfet hepsi tek yerde!',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: AppCommonSize.size16,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size48),
                  GradientButton(
                    text: 'Haydi Başlayalım !!',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpView()),
                      );
                    },
                  ),
                  SizedBox(height: AppCommonSize.size20),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: AppCommonSize.size16,
                        ),
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppCommonSize.size12,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: Text(
                        'Zaten hesabım var',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppCommonSize.size16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
