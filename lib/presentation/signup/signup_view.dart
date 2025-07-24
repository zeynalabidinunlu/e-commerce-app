import 'package:e_commerce_project/presentation/login/login_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/custom_text_field.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:e_commerce_project/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: size.height * 0.35,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColorTheme.primaryGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppCommonSize.size40),
                      bottomRight: Radius.circular(AppCommonSize.size40),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -AppCommonSize.size56,
                        left: -AppCommonSize.size56,
                        child: Container(
                          height: AppCommonSize.size56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: AppCommonSize.size48,
                        left: AppCommonSize.size16,
                        right: AppCommonSize.size16,

                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Hesap Oluştur',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppCommonSize.size24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: AppCommonSize.size40),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.15,
                left: AppCommonSize.size24,
                right: AppCommonSize.size24,

                child: Container(
                  padding: EdgeInsets.all(AppCommonSize.size24),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppCommonSize.size20),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hesabını oluştur',
                          style: TextStyle(
                            fontSize: AppCommonSize.size20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppCommonSize.size8),
                        Text(
                          'Alışveriş yolculuğu için hesabınızı kaydedin',
                          style: TextStyle(
                            fontSize: AppCommonSize.size14,
                            color: AppColorTheme.textSecondary,
                          ),
                        ),
                        SizedBox(height: AppCommonSize.size32),
                        CustomTextField(
                          label: "Kullanıcı adınız",
                          prefixIcon: Icons.person_outline,
                          keyboardType: TextInputType.emailAddress,
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Lütfen adınızı giriniz';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: AppCommonSize.size16),
                        CustomTextField(
                          label: "Email",
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Lütfen email adresinizi giriniz';
                            }
                            if (!p0.contains('@')) {
                              return 'Geçerli bir mail adresi giriniz';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          label: "Şifre",
                          prefixIcon: Icons.lock_outline,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: true,
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Lütfen şifrenizi giriniz';
                            }
                            if (p0.length < 6) {
                              return 'Şifre en az 6 karakter olmalıdır';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          label: "Şifrenizi doğrulayın",
                          prefixIcon: Icons.lock_outline,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: true,
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Lütfen şifrenizi doğrulayın';
                            }

                            return null;
                          },
                        ),

                        SizedBox(height: AppCommonSize.size24),
                        GradientButton(
                          text: 'Hesap Oluştur',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                        ),
                        SizedBox(height: AppCommonSize.size24),
                        Center(
                          child: Text(
                            'Hesabınla devam et',
                            style: TextStyle(
                              color: AppColorTheme.textSecondary,
                              fontSize: AppCommonSize.size14,
                            ),
                          ),
                        ),
                        SizedBox(height: AppCommonSize.size24),
                        Row(
                          children: [
                            Expanded(
                              child: SocialLoginButton(
                                text: 'Google',
                                iconPath: 'assets/icons/google.png',
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: AppCommonSize.size16),
                            Expanded(
                              child: SocialLoginButton(
                                text: 'Apple',
                                iconPath: 'assets/icons/apple.png',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppCommonSize.size24),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Zeten Hesabım var',
                                style: TextStyle(
                                  color: AppColorTheme.textSecondary,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginView(),
                                    ),
                                  );
                                },
                                child: Text('Giriş yap'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
