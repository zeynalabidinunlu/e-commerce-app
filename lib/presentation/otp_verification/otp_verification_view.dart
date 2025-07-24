import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final int otpLength = 6;
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];

  bool _isVerifing = false;
  int _resendTimer = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < otpLength; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
    _startResendTimer();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _verifyOTP() {
    String otp = _controllers.map((e) => e.text).join();
    if (otp.length == otpLength) {
      setState(() {
        _isVerifing = true;
        Future.delayed(Duration(seconds: 2), () {
          if (!mounted) return;
        });
      });
    }
  }

  void _startResendTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;

      setState(() {
        if (_resendTimer > 0) {
          _resendTimer--;
          _startResendTimer();
        } else {
          _canResend = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColorTheme.textSecondary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppCommonSize.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Telefonu doğrula',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: AppCommonSize.size8),
              Text(
                '0537 420 ** ** numaralı telefona gönderilen 6 haneli kodu girin',
                style: TextStyle(
                  fontSize: AppCommonSize.size16,
                  color: AppColorTheme.textSecondary,
                ),
              ),
              SizedBox(height: AppCommonSize.size48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  otpLength,
                  (index) => SizedBox(
                    width: AppCommonSize.size48,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(fontSize: AppCommonSize.size24),
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppCommonSize.size8,
                          ),
                          borderSide: BorderSide(
                            color: AppColorTheme.textSecondary.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppCommonSize.size8,
                          ),
                          borderSide: BorderSide(
                            color: AppColorTheme.primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (index < otpLength - 1) {
                            _focusNodes[index + 1].requestFocus();
                          } else {
                            _focusNodes[index].unfocus();
                            _verifyOTP();
                          }
                        } else if (index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppCommonSize.size32),
              GradientButton(
                onPressed: () {
                  if (_isVerifing) {
                    _verifyOTP();
                  }
                },
                text: _isVerifing ? "Doğrulanıyor ..." : "Doğrula",
              ),
              SizedBox(height: AppCommonSize.size24),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Kod alamadınız mı ?',
                      style: TextStyle(
                        fontSize: AppCommonSize.size14,
                        color: AppColorTheme.textSecondary,
                      ),
                    ),
                    SizedBox(height: AppCommonSize.size4),
                    TextButton(
                      onPressed: _canResend
                          ? () {
                              setState(() {
                                _canResend = false;
                                _resendTimer = 30;
                              });
                              _startResendTimer();
                            }
                          : null,
                      child: Text(
                        _canResend
                            ? "Kodu Gönder"
                            : "Kodu yeniden gönder $_resendTimer",
                        style: TextStyle(
                          color: _canResend
                              ? AppColorTheme.primaryColor
                              : AppColorTheme.textSecondary,
                          fontWeight: FontWeight.w600,
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
