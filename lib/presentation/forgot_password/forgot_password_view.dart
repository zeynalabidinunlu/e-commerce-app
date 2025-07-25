import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/custom_text_field.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  bool _recoveryStarted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColorTheme.textInverse),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppCommonSize.size20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "Şifrenizi unuttunuz mu ?",
                style: TextStyle(
                  fontSize: AppCommonSize.size28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppCommonSize.size8),
              Text(
                'Şifrenizi değiştirmek için email adresini giriniz',
                style: TextStyle(color: AppColorTheme.textSecondary),
              ),
              SizedBox(height: AppCommonSize.size48),
              if (!_recoveryStarted)
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Email Adresiniz',
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen email adresinizi giriniz';
                          }
                          if (!value.contains('@')) {
                            return 'Lütfen geçerli bir email adresini giriniz';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppCommonSize.size24),
                      GradientButton(
                        text: "Şifrem'i Yenile",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _recoveryStarted = true;
                            });
                          }
                        },
                      ),
                      SizedBox(height: AppCommonSize.size24),
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Giriş sayfasına dön',
                            style: TextStyle(
                              color: AppColorTheme.primaryColor,
                              fontSize: AppCommonSize.size16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: AppCommonSize.size80,
                        height: AppCommonSize.size80,
                        decoration: BoxDecoration(
                          color: AppColorTheme.successColor.withValues(
                            alpha: 0.1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_circle_outline,
                          size: AppCommonSize.size40,
                          color: AppColorTheme.successColor,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size24),
                      Text(
                        "Email adresine gönderildi",
                        style: TextStyle(
                          fontSize: AppCommonSize.size24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size32),
                      GradientButton(
                        text: 'Email Uygulamasını Aç',
                        onPressed: () {},
                      ),
                      SizedBox(height: AppCommonSize.size16),

                      Text(
                        'Email adresine yenileme linki gönderildi. Lütfen gelen kutunuzu kontrol edin',
                        style: TextStyle(
                          color: AppColorTheme.textSecondary,
                          fontSize: AppCommonSize.size16,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppCommonSize.size16),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Giriş sayfasına dön',
                          style: TextStyle(
                            color: AppColorTheme.primaryColor,
                            fontSize: AppCommonSize.size16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
