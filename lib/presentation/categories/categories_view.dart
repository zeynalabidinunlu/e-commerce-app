import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final subcategories = [
      {'icon': Icons.checkroom_outlined, 'name': 'Kıyafetler'},
      {'icon': Icons.watch_outlined, 'name': 'Aksesuarlar'},
      {'icon': Icons.shopping_bag_outlined, 'name': 'Çantalar'},
      {'icon': Icons.diamond_outlined, 'name': 'Mücheverler'},
      {'icon': Icons.shopify_outlined, 'name': 'Ayakakbılar'},
      {'icon': Icons.sports_baseball_outlined, 'name': 'Spor'},
    ];
    final brands = ['Nike', 'Adidas', 'Puma', 'Reebok', 'Under Armour'];
    final categories = [
      {'icon': Icons.laptop_mac_outlined, 'name': 'Elektronik'},
      {'icon': Icons.chair_outlined, 'name': 'Mobilya'},
      {'icon': Icons.checkroom_outlined, 'name': 'Moda'},
      {'icon': Icons.sports_basketball_outlined, 'name': 'Spor'},
      {'icon': Icons.watch_outlined, 'name': 'Aksesuar'},
    ];
    return Scaffold(
      backgroundColor: AppColorTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: AppCommonSize.size112,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColorTheme.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Kategoriler',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: AppCommonSize.size20),
                GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppCommonSize.size16,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: AppCommonSize.size16,
                    crossAxisSpacing: AppCommonSize.size16,
                  ),
                  itemCount: subcategories.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppCommonSize.size16,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: AppCommonSize.size10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(AppCommonSize.size12),
                            decoration: BoxDecoration(
                              color: AppColorTheme.primaryColor.withValues(
                                alpha: 0.1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              subcategories[index]['icon'] as IconData,
                              color: AppColorTheme.primaryColor,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size8),
                          Text(
                            subcategories[index]['name'] as String,
                            style: TextStyle(
                              fontSize: AppCommonSize.size14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(AppCommonSize.size16),
                      child: Text(
                        'Öne Çıkan Markalar',
                        style: TextStyle(
                          fontSize: AppCommonSize.size20,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.textInverse,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppCommonSize.size80,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppCommonSize.size16,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            width: AppCommonSize.size112,
                            margin: EdgeInsets.only(
                              right: AppCommonSize.size16,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppCommonSize.size16,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: AppCommonSize.size10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                brands[index],
                                style: TextStyle(
                                  fontSize: AppCommonSize.size16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColorTheme.primaryColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppCommonSize.size16),
                      child: Text(
                        'Popüler',
                        style: TextStyle(
                          fontSize: AppCommonSize.size20,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.textInverse,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppCommonSize.size16,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            right: AppCommonSize.size16,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              AppCommonSize.size16,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: AppCommonSize.size10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(AppCommonSize.size12),
                                decoration: BoxDecoration(
                                  color: AppColorTheme.primaryColor.withValues(
                                    alpha: 0.1,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  categories[index]['icon'] as IconData,
                                  color: AppColorTheme.primaryColor,
                                ),
                              ),
                              title: Text(
                                categories[index]['name'] as String,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '${(index + 1 * 100)} Ürün',
                                style: TextStyle(
                                  color: AppColorTheme.textSecondary,
                                ),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                              size:AppCommonSize.size16),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
