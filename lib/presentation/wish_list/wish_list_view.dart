import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class WishListView extends StatelessWidget {
  WishListView({super.key});
  final images = [
    'assets/images/clothes_V1.png',
    'assets/images/clothes_V2.png',
    'assets/images/clothes_V3.png',
    'assets/images/clothes_V4.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: AppCommonSize.size112,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColorTheme.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: FlexibleSpaceBar(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Favorilerim',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: AppCommonSize.size8),
                    CircleAvatar(
                      radius: AppCommonSize.size12,
                      backgroundColor: Colors.white,
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: AppColorTheme.primaryColor,
                          fontSize: AppCommonSize.size12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
              ),
            ),
            actions: [
              IconButton(
                iconSize: AppCommonSize.size32,
                onPressed: () {},
                icon: Icon(Icons.delete_sweep_outlined, color: Colors.white),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.all(AppCommonSize.size16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildWishListItem(context, index),
                childCount: 4,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: AppCommonSize.size16,
                crossAxisSpacing: AppCommonSize.size16,
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: AppColorTheme.primaryColor,
      //   child: Icon(Icons.shopping_cart_outlined),
      // ),
    );
  }

  Widget _buildWishListItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppCommonSize.size16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: AppCommonSize.size10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppCommonSize.size16),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppCommonSize.size16),
                      child: Image.asset(images[index], fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: AppCommonSize.size8,
                  right: AppCommonSize.size8,
                  child: Container(
                    padding: EdgeInsets.all(AppCommonSize.size8),
                    decoration: BoxDecoration(
                      color: AppColorTheme.errorColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      color: AppColorTheme.errorColor,
                    ),
                  ),
                ),
                Positioned(
                  top: AppCommonSize.size8,
                  left: AppCommonSize.size8,

                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppCommonSize.size4,
                      horizontal: AppCommonSize.size8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColorTheme.successColor,
                      borderRadius: BorderRadius.circular(AppCommonSize.size12),
                    ),
                    child: Text(
                      '%20 İndirim',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppCommonSize.size10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(AppCommonSize.size12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ürün Adı',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppCommonSize.size14,
                      fontWeight: FontWeight.bold,
                      color: AppColorTheme.textInverse,
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size4),
                  Text(
                    'Kategori',
                    style: TextStyle(
                      fontSize: AppCommonSize.size12,
                      color: AppColorTheme.textSecondary,
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '299.99 ₺',
                            style: TextStyle(
                              fontSize: AppCommonSize.size20,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.primaryColor,
                            ),
                          ),
                          Text(
                            '359.99 ₺',
                            style: TextStyle(
                              fontSize: AppCommonSize.size12,
                              color: AppColorTheme.textSecondary,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(AppCommonSize.size8),
                        decoration: BoxDecoration(
                          color: AppColorTheme.primaryColor,
                          borderRadius: BorderRadius.circular(
                            AppCommonSize.size8,
                          ),
                        ),
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: AppCommonSize.size20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
