import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/custom_text_field.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class ForgotEmailView extends StatefulWidget {
  const ForgotEmailView({super.key});

  @override
  State<ForgotEmailView> createState() => _ForgotEmailViewState();
}

class _ForgotEmailViewState extends State<ForgotEmailView> {
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
                "Email'i unuttunuz mu ?",
                style: TextStyle(
                  fontSize: AppCommonSize.size28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppCommonSize.size8),
              Text(
                'Email adresinizi kurtarmak için telefon numarasını giriniz',
                style: TextStyle(color: AppColorTheme.textSecondary),
              ),
              SizedBox(height: AppCommonSize.size48),
              if (!_recoveryStarted)
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Telefon Numarası',
                        prefixIcon: Icons.phone_outlined,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen telefon numaranızı giriniz';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppCommonSize.size24),
                      GradientButton(
                        text: "Emaili'i Hatırlat",
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
                        "SMS Gönderildi",
                        style: TextStyle(
                          fontSize: AppCommonSize.size24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size32),
                      GradientButton(text: 'Mesajları Aç', onPressed: () {}),
                      SizedBox(height: AppCommonSize.size16),

                      Text(
                        'Telefon numarınıza email adresi gönderildi.Lütfen telefonunuzu kontrol ediniz',
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
