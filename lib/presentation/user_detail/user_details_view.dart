import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key});
  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: EdgeInsets.all(AppCommonSize.size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: AppCommonSize.size18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppCommonSize.size10),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppCommonSize.size8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppCommonSize.size8),
            decoration: BoxDecoration(
              color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppCommonSize.size8),
            ),
            child: Icon(
              icon,
              size: AppCommonSize.size20,
              color: AppColorTheme.primaryColor,
            ),
          ),
          SizedBox(width: AppCommonSize.size16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: AppCommonSize.size12,
                    color: AppColorTheme.textSecondary,
                  ),
                ),
                SizedBox(height: AppCommonSize.size4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: AppCommonSize.size16,
                    fontWeight: FontWeight.bold,
                    color: valueColor ?? AppColorTheme.textInverse,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                      Expanded(
                        child: Text(
                          'Profil Bilgileri',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppCommonSize.size24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit, color: Colors.white),
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
                  SizedBox(height: AppCommonSize.size24),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppCommonSize.size24,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppCommonSize.size20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSection('Kullanıcı Bilgileri', [
                          _buildInfoRow(
                            icon: Icons.badge,
                            label: 'Tam Kullanıcı Adı',
                            value: 'Hacı Bayram Akkurt',
                          ),
                          _buildInfoRow(
                            icon: Icons.email,
                            label: 'Email',
                            value: 'bayramakkurt@gmail.com',
                          ),
                          _buildInfoRow(
                            icon: Icons.phone,
                            label: 'Telefon Numarası',
                            value: '+90 0551 123 45 67',
                          ),
                        ]),
                        _buildSection('Daha Fazla', [
                          _buildInfoRow(
                            icon: Icons.calendar_today,
                            label: 'Doğum Günü',
                            value: '1 Ocak 2000',
                          ),
                          _buildInfoRow(
                            icon: Icons.person,
                            label: 'Cinsiyet',
                            value: 'Erkek',
                          ),
                         
                        ]),
                          _buildSection('Hesap Bilgileri', [
                          _buildInfoRow(
                            icon: Icons.calendar_month,
                            label: 'Katılma Tarihi',
                            value: 'Ekim 2022',
                          ),
                          
                         
                        ]),
                      ],
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
