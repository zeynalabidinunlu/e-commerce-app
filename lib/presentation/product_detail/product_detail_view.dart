import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int _selectedImageIndex = 0;
  int _selectedSize = 1;
  int _selectedColor = 0;
  bool _isFavorite = false;
  final PageController _pageController = PageController();
  final images = [
    'assets/images/resize/clothes_V1.png',
    'assets/images/resize/clothes_V2.png',
    'assets/images/resize/clothes_V3.png',
    'assets/images/resize/clothes_V4.png',
  ];
  Widget _buildSizeOption(int index) {
    final sizes = ["XS", "S", "M", "L", "XL"];

    final isSelected = _selectedSize == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedSize = index),
      child: Container(
        width: AppCommonSize.size56,
        margin: EdgeInsets.only(right: AppCommonSize.size12),
        padding: EdgeInsets.symmetric(
          horizontal: AppCommonSize.size8,
          vertical: AppCommonSize.size12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? AppColorTheme.primaryColor : Colors.white,
          border: Border.all(
            color: isSelected
                ? AppColorTheme.primaryColor
                : AppColorTheme.textSecondary.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          sizes[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppCommonSize.size16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColorTheme.textInverse,
          ),
        ),
      ),
    );
  }

  Widget _buildColorOption(int index) {
    final colors = [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.green,
      Colors.amber,
    ];

    final isSelected = _selectedColor == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = index;
        });
      },
      child: Container(
        height: AppCommonSize.size40,

        width: AppCommonSize.size40,
        margin: EdgeInsets.only(right: AppCommonSize.size12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors[index],
          border: Border.all(
            color: isSelected ? AppColorTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: isSelected ? Icon(Icons.check, color: Colors.white) : null,
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(AppCommonSize.size12),
            decoration: BoxDecoration(
              color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColorTheme.primaryColor),
          ),
          SizedBox(),
          Text(
            text,
            style: TextStyle(
              fontSize: AppCommonSize.size12,
              color: AppColorTheme.textInverse,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorTheme.backgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 0,
                floating: true,
                pinned: true,
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColorTheme.textInverse,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite
                          ? AppColorTheme.errorColor
                          : AppColorTheme.textInverse,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / 1.34,
                          child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _selectedImageIndex = index;
                              });
                            },
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(AppCommonSize.size16),
                                decoration: BoxDecoration(
                                  color: AppColorTheme.primaryColor.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppCommonSize.size20,
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
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: AppCommonSize.size32,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              images.length,
                              (index) => Container(
                                width: AppCommonSize.size8,
                                height: AppCommonSize.size8,
                                margin: EdgeInsets.symmetric(
                                  horizontal: AppCommonSize.size4,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _selectedImageIndex == index
                                      ? AppColorTheme.primaryColor
                                      : AppColorTheme.textSecondary.withValues(
                                          alpha: 0.3,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppCommonSize.size16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppCommonSize.size8,
                                  vertical: AppCommonSize.size4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColorTheme.successColor.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppCommonSize.size20,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: AppCommonSize.size16,
                                      color: AppColorTheme.successColor,
                                    ),
                                    SizedBox(width: AppCommonSize.size4),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        color: AppColorTheme.successColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: AppCommonSize.size8),
                              Text(
                                '(156 Yorum)',
                                style: TextStyle(
                                  color: AppColorTheme.textSecondary,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppCommonSize.size8,
                                  vertical: AppCommonSize.size4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColorTheme.errorColor.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppCommonSize.size20,
                                  ),
                                ),
                                child: Text(
                                  '%20 İndirim',
                                  style: TextStyle(
                                    color: AppColorTheme.errorColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppCommonSize.size12),
                          Text(
                            "Nike Eşofman Takımı",
                            style: TextStyle(
                              fontSize: AppCommonSize.size24,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size8),
                          Text(
                            'Nike',
                            style: TextStyle(
                              fontSize: AppCommonSize.size16,
                              color: AppColorTheme.textSecondary,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size8),
                          Row(
                            children: [
                              Text(
                                '399.99 ₺',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppCommonSize.size28,
                                  color: AppColorTheme.primaryColor,
                                ),
                              ),
                              SizedBox(width: AppCommonSize.size12),
                              Text(
                                '499.99 ₺',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: AppCommonSize.size20,
                                  color: AppColorTheme.textSecondary.withValues(
                                    alpha: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Beden Seçin',
                            style: TextStyle(
                              fontSize: AppCommonSize.size18,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size12),
                          Row(
                            children: List.generate(
                              5,
                              (index) => _buildSizeOption(index),
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size12),
                          Text(
                            'Renk Seçin',
                            style: TextStyle(
                              fontSize: AppCommonSize.size18,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size12),
                          Row(
                            children: List.generate(
                              4,
                              (index) => _buildColorOption(index),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppCommonSize.size16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Açıklama',
                            style: TextStyle(
                              fontSize: AppCommonSize.size18,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size12),
                          Text(
                            'Bu rahat eşofman, sadeliği klasik yapıyla buluşturuyor. Hafif polyester örgü kumaştan üretilen stilin standart kesimi gövde, kalça ve uyluklarda boldur.',

                            style: TextStyle(
                              fontSize: AppCommonSize.size14,
                              height: 1.6,
                              color: AppColorTheme.textSecondary,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size16),
                          Row(
                            children: [
                              _buildFeature(Icons.eco, 'Örgü\nKumaş'),
                              _buildFeature(
                                Icons.local_laundry_service,
                                'Makinede\nYıkanabilir',
                              ),
                              _buildFeature(Icons.verified, 'Kalite\nGüvence'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppCommonSize.size16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Yorumlar',
                                style: TextStyle(
                                  fontSize: AppCommonSize.size18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColorTheme.textInverse,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('Hepsini Gör'),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(AppCommonSize.size16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppCommonSize.size16,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.09),
                                  blurRadius: AppCommonSize.size16,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: AppCommonSize.size20,
                                      backgroundColor:
                                          AppColorTheme.primaryColor,
                                      child: Text(
                                        'HB',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: AppCommonSize.size12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Haci Bayram',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColorTheme.textInverse,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: AppCommonSize.size16,
                                                color:
                                                    AppColorTheme.warningColor,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: AppCommonSize.size16,
                                                color:
                                                    AppColorTheme.warningColor,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: AppCommonSize.size16,
                                                color:
                                                    AppColorTheme.warningColor,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: AppCommonSize.size16,
                                                color:
                                                    AppColorTheme.warningColor,
                                              ),
                                              Icon(
                                                Icons.star_half,
                                                size: AppCommonSize.size16,
                                                color:
                                                    AppColorTheme.warningColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '2 Gün önce',
                                      style: TextStyle(
                                        color: AppColorTheme.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppCommonSize.size12),
                                Text(
                                  'Fiyatını hakeden bi ürün olduğunu  düşünüyorum , tavsiye ediyorum ',
                                  style: TextStyle(
                                    height: 1.5,
                                    color: AppColorTheme.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppCommonSize.size192),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: AppCommonSize.size96,
              padding: EdgeInsets.all(AppCommonSize.size16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: AppCommonSize.size10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: AppCommonSize.size48,
                    width: AppCommonSize.size48,
                    decoration: BoxDecoration(
                      color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppCommonSize.size12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColorTheme.primaryColor,
                      ),
                    ),
                  ),
                SizedBox(width: AppCommonSize.size16,),
                Expanded(child: GradientButton(text: 'Sepete Ekle - 399.99 ₺', onPressed: () {
                  
                },))
                ],
              ),
            
            ),
          ),
        ],
      ),
    );
  }
}
