import 'package:e_commerce_project/presentation/categories/categories_view.dart';
import 'package:e_commerce_project/presentation/notifications/notifications_view.dart';
import 'package:e_commerce_project/presentation/product_detail/product_detail_view.dart';
import 'package:e_commerce_project/presentation/search_filter/search_filter_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final images = [
    'assets/images/clothes_V1.png',
    'assets/images/clothes_V2.png',
    'assets/images/clothes_V3.png',
    'assets/images/clothes_V4.png',
  ];
  final categories = [
    {'icon': Icons.laptop_mac_outlined, 'name': 'Elektronik'},
    {'icon': Icons.chair_outlined, 'name': 'Mobilya'},
    {'icon': Icons.checkroom_outlined, 'name': 'Moda'},
    {'icon': Icons.sports_basketball_outlined, 'name': 'Spor'},
    {'icon': Icons.watch_outlined, 'name': 'Aksesuar'},
  ];

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: AppCommonSize.size96,
            floating: false,
            pinned: true,
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
                centerTitle: true,
                titlePadding: EdgeInsets.symmetric(
                  horizontal: AppCommonSize.size16,
                  vertical: AppCommonSize.size16,
                ),
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: AppCommonSize.size20,
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: AppCommonSize.size20,
                      ),
                    ),
                    SizedBox(width: AppCommonSize.size12),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tarzını Keşfet',
                          style: TextStyle(
                            fontSize: AppCommonSize.size12,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          'Malatya',
                          style: TextStyle(
                            fontSize: AppCommonSize.size14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                background: Stack(
                  children: [
                    Positioned(
                      top: -50,
                      right: -50,

                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsView(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(AppCommonSize.size16),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: AppCommonSize.size20,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: TextField(
                        onSubmitted: (value) {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView(),))
                        },
                        decoration: InputDecoration(
                          hintText: 'Ürünleri Ara ... ',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColorTheme.textSecondary,
                          ),

                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: AppColorTheme.primaryColor,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchFilterView(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //KATAGORİLER
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppCommonSize.size16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kategoriler',
                            style: TextStyle(
                              fontSize: AppCommonSize.size20,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoriesView(),
                                ),
                              );
                            },
                            child: Text(
                              'Hepsini Gör',
                              style: TextStyle(
                                color: AppColorTheme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppCommonSize.size128,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppCommonSize.size10,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return Container(
                              margin: EdgeInsets.all(AppCommonSize.size6),
                              width: AppCommonSize.size96,
                              padding: EdgeInsets.all(AppCommonSize.size8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  AppCommonSize.size12,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: AppCommonSize.size10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                      AppCommonSize.size12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColorTheme.primaryColor
                                          .withValues(alpha: 0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      category['icon'] as IconData,
                                      color: AppColorTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: AppCommonSize.size8),
                                  Text(
                                    category['name'] as String,
                                    style: TextStyle(
                                      fontSize: AppCommonSize.size12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppCommonSize.size6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppCommonSize.size16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Öne Çıkanlar',
                            style: TextStyle(
                              fontSize: AppCommonSize.size20,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoriesView(),))
                            },
                            child: Text(
                              'Hepsini Gör',
                              style: TextStyle(
                                color: AppColorTheme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppCommonSize.size8,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailView(),
                                ),
                              );
                            },
                            child: Container(
                              width: 200,
                              margin: EdgeInsets.all(AppCommonSize.size8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  AppCommonSize.size12,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: AppCommonSize.size20,
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
                                        height: AppCommonSize.size160,
                                        decoration: BoxDecoration(
                                          color: AppColorTheme.primaryColor
                                              .withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(
                                              AppCommonSize.size16,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              AppCommonSize.size8,
                                            ),
                                            child: Image.asset(
                                              images[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 12,
                                        right: 12,
                                        child: Container(
                                          padding: EdgeInsets.all(
                                            AppCommonSize.size8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),

                                          child: Icon(
                                            Icons.favorite_border,
                                            size: AppCommonSize.size20,
                                            color: AppColorTheme.favoriteColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                      AppCommonSize.size12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ürün İsmi',
                                          style: TextStyle(
                                            fontSize: AppCommonSize.size16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColorTheme.textInverse,
                                          ),
                                        ),
                                        SizedBox(height: AppCommonSize.size4),
                                        Text(
                                          'Kategori',
                                          style: TextStyle(
                                            fontSize: AppCommonSize.size14,
                                            color: AppColorTheme.textSecondary,
                                          ),
                                        ),
                                        SizedBox(height: AppCommonSize.size8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '499.99 ₺',
                                              style: TextStyle(
                                                fontSize: AppCommonSize.size18,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    AppColorTheme.textSecondary,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(
                                                AppCommonSize.size8,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    AppColorTheme.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      AppCommonSize.size8,
                                                    ),
                                              ),
                                              child: Icon(
                                                Icons.shopping_cart,
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
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppCommonSize.size16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Yeni Gelenler',
                            style: TextStyle(
                              fontSize: AppCommonSize.size20,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoriesView(),))
                            },
                            child: Text(
                              'Hepsini Gör',
                              style: TextStyle(
                                color: AppColorTheme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppCommonSize.size16,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,

                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: AppCommonSize.size16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppCommonSize.size16,
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: AppCommonSize.size20,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: AppCommonSize.size96,
                                height: AppCommonSize.size96,
                                decoration: BoxDecoration(
                                  color: AppColorTheme.primaryColor.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(AppCommonSize.size16),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                      images[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(AppCommonSize.size6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Yeni Ürün İsmi',
                                        style: TextStyle(
                                          fontSize: AppCommonSize.size16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColorTheme.textInverse,
                                        ),
                                      ),
                                      SizedBox(height: AppCommonSize.size4),
                                      Text(
                                        'Kategori',
                                        style: TextStyle(
                                          fontSize: AppCommonSize.size14,
                                          //  fontWeight: FontWeight.bold,
                                          color: AppColorTheme.textSecondary,
                                        ),
                                      ),
                                      SizedBox(height: AppCommonSize.size4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '199.99 ₺',
                                            style: TextStyle(
                                              color:
                                                  AppColorTheme.textSecondary,
                                              fontSize: AppCommonSize.size16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: AppCommonSize.size12,
                                              vertical: AppCommonSize.size6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColorTheme.primaryColor
                                                  .withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    AppCommonSize.size20,
                                                  ),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: AppCommonSize.size16,
                                                  color: AppColorTheme
                                                      .warningColor,
                                                ),
                                                SizedBox(
                                                  width: AppCommonSize.size4,
                                                ),
                                                Text(
                                                  '4.5',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColorTheme
                                                        .textInverse,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
