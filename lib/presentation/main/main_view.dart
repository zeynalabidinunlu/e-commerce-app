import 'package:e_commerce_project/presentation/cart/cart_view.dart';
import 'package:e_commerce_project/presentation/chat/chat_view.dart';
import 'package:e_commerce_project/presentation/home/home_view.dart';
import 'package:e_commerce_project/presentation/profile/profile_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeView(),
    ChatView(),
    CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppCommonSize.size8,
              vertical: AppCommonSize.size8,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppCommonSize.size20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    0,
                    Icons.home_outlined,
                    Icons.home,
                    'Ana Sayfa',
                  ),
                  _buildNavItem(
                    1,
                    Icons.favorite,
                    Icons.favorite_outline,
                    'Favorilerim',
                  ),
                  _buildCarNavItem(),

                  _buildNavItem(
                    3,
                    Icons.person_outline,
                    Icons.person,
                    'Profil',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData outlinedIcon,
    IconData filledIcon,
    String label,
  ) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppCommonSize.size16,
          vertical: AppCommonSize.size8,
        ),
        decoration: isSelected
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColorTheme.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? filledIcon : outlinedIcon,
              color: isSelected ? Colors.white : AppColorTheme.textSecondary,
            ),
            SizedBox(height: AppCommonSize.size4),
            Text(
              label,
              style: TextStyle(
                fontSize: AppCommonSize.size12,
                color: isSelected ? Colors.white : AppColorTheme.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarNavItem() {
    bool isSelected = _currentIndex == 2;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = 2),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppCommonSize.size16,
          vertical: AppCommonSize.size8,
        ),
        decoration: isSelected
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColorTheme.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                  color: isSelected
                      ? Colors.white
                      : AppColorTheme.textSecondary,
                ),
                SizedBox(height: AppCommonSize.size4),
                Text(
                  'Sepet',
                  style: TextStyle(
                    fontSize: AppCommonSize.size12,
                    color: isSelected
                        ? Colors.white
                        : AppColorTheme.textSecondary,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
            Positioned(
              top: -AppCommonSize.size8,
              right: -AppCommonSize.size8,
              child: Container(
                padding: EdgeInsets.all(AppCommonSize.size6),
                decoration: BoxDecoration(
                  color: AppColorTheme.errorColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
