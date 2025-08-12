import 'package:e_commerce_project/presentation/order_list/order_list_view.dart';
import 'package:e_commerce_project/presentation/user_detail/user_details_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(AppCommonSize.size16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppCommonSize.size16),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.5),
                blurRadius: AppCommonSize.size10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(icon, color: color),
              SizedBox(height: AppCommonSize.size8),
              Text(
                value,
                style: TextStyle(
                  fontSize: AppCommonSize.size20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              SizedBox(height: AppCommonSize.size4),
              Text(
                title,
                style: TextStyle(
                  fontSize: AppCommonSize.size12,
                  color: AppColorTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppCommonSize.size4,
            bottom: AppCommonSize.size12,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: AppCommonSize.size18,
              fontWeight: FontWeight.bold,
              color: AppColorTheme.textInverse,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppCommonSize.size16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppCommonSize.size16),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: AppCommonSize.size16,
          vertical: AppCommonSize.size12,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(AppCommonSize.size10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppCommonSize.size24),
                color: isDestructive
                    ? AppColorTheme.errorColor.withValues(alpha: 0.1)
                    : color.withValues(alpha: 0.3),
              ),
              child: Icon(
                icon,
                color: isDestructive ? AppColorTheme.errorColor : color,
                size: AppCommonSize.size24,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppCommonSize.size16,
                      fontWeight: FontWeight.w500,
                      color: isDestructive
                          ? AppColorTheme.errorColor
                          : AppColorTheme.textInverse,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: AppCommonSize.size12,

                      color: AppColorTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColorTheme.textSecondary,
              size: AppCommonSize.size20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColorTheme.primaryGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppCommonSize.size36),
                      bottomRight: Radius.circular(AppCommonSize.size36),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -50,
                        right: -50,
                        child: Container(
                          height: AppCommonSize.size150,
                          width: AppCommonSize.size150,

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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profil',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppCommonSize.size24,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_vert, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.15),
                    child: Column(
                      children: [
                        Container(
                          width: size.width / 1.5,
                          margin: EdgeInsets.symmetric(
                            horizontal: AppCommonSize.size24,
                          ),
                          padding: EdgeInsets.all(AppCommonSize.size24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              AppCommonSize.size20,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: AppCommonSize.size20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: AppCommonSize.size100,
                                width: AppCommonSize.size100,
                                decoration: BoxDecoration(),
                                child: Image.asset('assets/images/user.png'),
                              ),
                              SizedBox(height: AppCommonSize.size16),
                              Text(
                                'Hacı Bayram Akkurt',
                                style: TextStyle(
                                  fontSize: AppCommonSize.size24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColorTheme.textInverse,
                                ),
                              ),
                              SizedBox(height: AppCommonSize.size8),
                              Text(
                                'bayramakkurt@gmail.com',
                                style: TextStyle(
                                  fontSize: AppCommonSize.size14,
                                  color: AppColorTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppCommonSize.size24),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppCommonSize.size24,
                          ),
                          child: Row(
                            children: [
                              _buildActionCard(
                                icon: Icons.shopping_bag_outlined,
                                title: 'Siparişlerim',
                                value: '14',
                                color: AppColorTheme.primaryColor,
                              ),
                              _buildActionCard(
                                icon: Icons.favorite_border_outlined,
                                title: 'Favorilerim',
                                value: '4',
                                color: AppColorTheme.secondaryColor,
                              ),
                              _buildActionCard(
                                icon: Icons.local_shipping_outlined,
                                title: 'Teslimat',
                                value: '3',
                                color: AppColorTheme.infoColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppCommonSize.size24),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppCommonSize.size24,
                          ),
                          child: Column(
                            children: [
                              _buildSection(
                                title: 'Profili Düzenle',
                                items: [
                                  _buildMenuItem(
                                    icon: Icons.person_outline,
                                    title: 'Hesap Detayları',
                                    subtitle: 'Profil bilgilerini güncelle',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UserDetailsView(),
                                        ),
                                      );
                                    },
                                    color: AppColorTheme.primaryColor,
                                  ),
                                  _buildMenuItem(
                                    icon: Icons.lock_outline,
                                    title: 'Şifreni Değiştir',
                                    subtitle: 'Şifreni  güncelle',
                                    onTap: () {},
                                    color: AppColorTheme.primaryColor,
                                  ),
                                  _buildMenuItem(
                                    icon: Icons.notifications,
                                    title: 'Bildirimler',
                                    subtitle: 'Bildirimlerini yönet',
                                    onTap: () {},
                                    color: AppColorTheme.primaryColor,
                                  ),
                                ],
                              ),
                              SizedBox(height: AppCommonSize.size24),
                              _buildSection(
                                title: 'Alışveriş Tercihlerim',
                                items: [
                                  _buildMenuItem(
                                    icon: Icons.shopping_bag_outlined,
                                    title: 'Siparişlerim',
                                    subtitle: 'Sipariş geçmişini görüntüle',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OrderListView(),
                                        ),
                                      );
                                    },
                                    color: AppColorTheme.secondaryColor,
                                  ),
                                  _buildMenuItem(
                                    icon: Icons.location_on_outlined,
                                    title: 'Kargo Adresi',
                                    subtitle: 'Teslimat adresilerini yönet',
                                    onTap: () {},
                                    color: AppColorTheme.secondaryColor,
                                  ),
                                  _buildMenuItem(
                                    icon: Icons.payment_outlined,
                                    title: 'Ödeme Metodları',
                                    subtitle: 'Ödeme metodlarını yönet',
                                    onTap: () {},
                                    color: AppColorTheme.secondaryColor,
                                  ),
                                ],
                              ),
                              SizedBox(height: AppCommonSize.size24),
                              _buildSection(
                                title: 'Daha Fazlası',
                                items: [
                                  _buildMenuItem(
                                    icon: Icons.settings_outlined,
                                    title: 'Ayarlar',
                                    subtitle: '',
                                    onTap: () {},
                                    color: AppColorTheme.successLight,
                                  ),
                                  _buildMenuItem(
                                    icon: Icons.help_outline,
                                    title: 'Yardım Al',
                                    subtitle: '',
                                    onTap: () {},
                                    color: AppColorTheme.successLight,
                                  ),
                                  _buildMenuItem(
                                    icon: Icons.payment_outlined,
                                    title: 'Çıkış Yap',
                                    subtitle: '',
                                    onTap: () {},
                                    color: AppColorTheme.errorColor,
                                    isDestructive: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppCommonSize.size100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
