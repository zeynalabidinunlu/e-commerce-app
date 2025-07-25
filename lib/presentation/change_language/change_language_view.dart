import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class ChangeLanguageView extends StatefulWidget {
  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  String? _selectedLanguage;
  final List<Map<String, String>> _languages = [
    {'code': 'tr', 'name': 'Türkçe', 'nativeName': 'Türkçe'},
    {'code': 'en', 'name': 'English', 'nativeName': 'English'},
    {'code': 'es', 'name': 'Spanish', 'nativeName': 'Espanol'},
    {'code': 'fr', 'name': 'French', 'nativeName': 'Francais'},
    {'code': 'it', 'name': 'İtalian', 'nativeName': 'Italiano'},
  ];

  void _hendleLanguageSelection() {
    if (_selectedLanguage != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColorTheme.textInverse),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppCommonSize.size24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dili Seçiniz',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppCommonSize.size36,
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size8),
                  Text(
                    'Tercih ettiğiniz dili seçin',
                    style: TextStyle(fontSize: AppCommonSize.size16),
                  ),
                  SizedBox(height: AppCommonSize.size8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _languages.length,
                    itemBuilder: (context, index) {
                      final language = _languages[index];
                      final isSelected = language['code'] == _selectedLanguage;
                      return Container(
                        margin: EdgeInsets.only(bottom: AppCommonSize.size12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: isSelected ? 2 : 1,
                            color: isSelected
                                ? AppColorTheme.primaryColor
                                : AppColorTheme.textSecondary.withValues(
                                    alpha: 0.2,
                                  ),
                          ),
                          borderRadius: BorderRadius.circular(
                            AppCommonSize.size12,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedLanguage = language['code'];
                            });
                          },
                          borderRadius: BorderRadius.circular(
                            AppCommonSize.size12,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(AppCommonSize.size16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        language['name'] ?? "",
                                        style: TextStyle(
                                          color: AppColorTheme.textInverse,
                                          fontSize: AppCommonSize.size16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: AppCommonSize.size4),
                                      Text(
                                        language['nativeName'] ?? "",
                                        style: TextStyle(
                                          color: AppColorTheme.textSecondary,
                                          fontSize: AppCommonSize.size12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: AppCommonSize.size24,
                                  height: AppCommonSize.size24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColorTheme.primaryColor
                                          : AppColorTheme.textSecondary
                                                .withValues(alpha: 0.2),
                                      width: 2,
                                    ),
                                  ),
                                  child: isSelected
                                      ? Container(
                                          margin: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: AppColorTheme.primaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppCommonSize.size24),
                  Padding(
                    padding: EdgeInsets.all(AppCommonSize.size24),
                    child: GradientButton(
                      text: 'Devam et',
                      onPressed: _hendleLanguageSelection,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
