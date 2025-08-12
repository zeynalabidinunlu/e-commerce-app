import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/custom_text_field.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class EditUserDetailView extends StatefulWidget {
  const EditUserDetailView({super.key});

  @override
  State<EditUserDetailView> createState() => _EditUserDetailViewState();
}

class _EditUserDetailViewState extends State<EditUserDetailView> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController(text: 'Hacı Bayram');
  final _lastNameController = TextEditingController(text: 'Akkurt');
  final _emailController = TextEditingController(
    text: 'bayramakkurt@gmail.com',
  );
  final _phoneController = TextEditingController(text: '+90 0551 123 45 67');
  final _dobController = TextEditingController(text: '1 Ocak 2000');

  String _selectedGender = 'Erkek';
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorTheme.backgroundColor,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.35,
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
                  top: -50,
                  right: -50,
                  child: Container(
                    width: AppCommonSize.size150,
                    height: AppCommonSize.size150,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: AppCommonSize.size48,
                  left: AppCommonSize.size16,
                  right: AppCommonSize.size16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Text(
                        'Kullanıcı Bilgileri',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppCommonSize.size24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: AppCommonSize.size120,
                        height: AppCommonSize.size120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: AppColorTheme.primaryGradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: AppCommonSize.size4,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(100),
                          child: Image.asset(
                            'assets/images/user.png',

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(AppCommonSize.size8),
                          decoration: BoxDecoration(
                            color: AppColorTheme.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: AppCommonSize.size20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppCommonSize.size24),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppCommonSize.size24,
                    ),
                    padding: EdgeInsets.all(AppCommonSize.size16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppCommonSize.size20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: AppCommonSize.size20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Temel Bilgiler',
                            style: TextStyle(
                              fontSize: AppCommonSize.size18,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size24),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: _firstNameController,
                                  label: 'Adı',
                                  prefixIcon: Icons.person,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Gerekli';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: AppCommonSize.size16),
                              Expanded(
                                child: CustomTextField(
                                  controller: _lastNameController,
                                  label: 'Soyadı',
                                  prefixIcon: Icons.person,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Gerekli';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppCommonSize.size16),
                          CustomTextField(
                            label: 'Email',
                            prefixIcon: Icons.email,
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email gerekli';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppCommonSize.size16),
                          CustomTextField(
                            label: 'Telefon',
                            prefixIcon: Icons.phone,
                            controller: _phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Telefon numarası gerekli';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppCommonSize.size24),
                          Text(
                            'Ek Bilgiler',
                            style: TextStyle(
                              fontSize: AppCommonSize.size18,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size16),
                          CustomTextField(
                            label: 'Doğum Tarihi',
                            prefixIcon: Icons.calendar_month,
                            controller: _dobController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Gerekli';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppCommonSize.size16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cinsiyet',
                                style: TextStyle(
                                  fontSize: AppCommonSize.size14,
                                  color: AppColorTheme.textSecondary,
                                ),
                              ),
                              SizedBox(height: AppCommonSize.size8),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColorTheme.textSecondary
                                        .withValues(alpha: 0.2),
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppCommonSize.size8,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    RadioListTile<String>(
                                      title: Text('Erkek'),
                                      value: 'Erkek',
                                      activeColor: AppColorTheme.primaryColor,
                                      groupValue: _selectedGender,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedGender = value!;
                                        });
                                      },
                                    ),
                                    RadioListTile<String>(
                                      title: Text('Kadın'),
                                      value: 'Kadın',
                                      activeColor: AppColorTheme.primaryColor,
                                      groupValue: _selectedGender,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedGender = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppCommonSize.size24,), 
                          GradientButton(
                            text: 'Değişikleri Kaydet',
                            onPressed: () {
                              
                            },
                          )
                        ],
                      ),
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
