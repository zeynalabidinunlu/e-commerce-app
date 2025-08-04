import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class SearchFilterView extends StatefulWidget {
  const SearchFilterView({super.key});

  @override
  State<SearchFilterView> createState() => _SearchFilterViewState();
}

class _SearchFilterViewState extends State<SearchFilterView> {
  bool _showGrid = true;
  String _sortBy = 'Popüler';
  RangeValues _pricesRange = RangeValues(0, 1000);
  List<String> _selectedBrands = [];
  List<String> _selectedSize = [];
  final images = [
    'assets/images/clothes_V1.png',
    'assets/images/clothes_V2.png',
    'assets/images/clothes_V3.png',
    'assets/images/clothes_V4.png',
  ];

  final sortOptions = [
    'Popüler',
    'En Düşük Fiyat',
    'En Yüksek Fiyat',
    'En Yeni',
    'Sıralama',
  ];
  final activeFilters = [
    '0₺ - 100₺',
    'Marka: Nike',
    'Beden: M',
    'Stokta Olanlar',
  ];

  final brands = ['Nike', 'Adidas', 'Puma', 'Reebok', 'Under Armour'];
  final sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.black,
    Colors.white,
    Colors.purple,
    Colors.orange,
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
            backgroundColor: AppColorTheme.primaryColor,
            foregroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppCommonSize.size60),
              child: Container(
                height: AppCommonSize.size56,
                margin: EdgeInsets.all(AppCommonSize.size8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppCommonSize.size12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Ürünleri Ara',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.clear),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(AppCommonSize.size16),
                  child: Row(
                    children: [
                      Text(
                        '154 Sonuç',
                        style: TextStyle(
                          color: AppColorTheme.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _showGrid = !_showGrid;
                          });
                        },
                        icon: Icon(_showGrid ? Icons.list : Icons.grid_view),
                        color: AppColorTheme.textSecondary,
                      ),
                      SizedBox(width: AppCommonSize.size8),
                      TextButton.icon(
                        onPressed: () {
                          _showFilterBottomSheet();
                        },
                        icon: Icon(Icons.tune),
                        label: Text('Filtrele'),
                      ),
                      SizedBox(width: AppCommonSize.size8),
                      TextButton.icon(
                        onPressed: () {
                          _showSortBottomSheet();
                        },
                        icon: Icon(Icons.sort),
                        label: Text('Sırala'),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: AppCommonSize.size40,
                  margin: EdgeInsets.only(bottom: AppCommonSize.size16),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppCommonSize.size16,
                    ),
                    itemCount: activeFilters.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: AppCommonSize.size8),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppCommonSize.size12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColorTheme.primaryColor.withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppCommonSize.size20,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              activeFilters[index],
                              style: TextStyle(
                                color: AppColorTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.close,
                              size: AppCommonSize.size16,
                              color: AppColorTheme.primaryColor,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          _showGrid
              ? SliverPadding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: AppCommonSize.size16,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildProductCard(index),

                      childCount: 4,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                  ),
                )
              : SliverPadding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: AppCommonSize.size16,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _builProductListTile(index),

                      childCount: 4,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildProductCard(int index) {
    return Container(
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
                height: AppCommonSize.size160,
                decoration: BoxDecoration(
                  color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppCommonSize.size16),
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

                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: AppColorTheme.errorColor,
                  ),
                ),
              ),
              Positioned(
                top: AppCommonSize.size8,
                left: AppCommonSize.size8,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppCommonSize.size8,
                    vertical: AppCommonSize.size4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColorTheme.successColor,
                    borderRadius: BorderRadius.circular(AppCommonSize.size12),
                  ),
                  child: Text(
                    '20%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppCommonSize.size12,
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  'Ürün İsmi',
                  style: TextStyle(
                    fontSize: AppCommonSize.size14,
                    fontWeight: FontWeight.bold,
                    color: AppColorTheme.textInverse,
                  ),
                ),
                SizedBox(height: AppCommonSize.size4),
                Text(
                  'Moda',
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
                          '80.00 ₺',
                          style: TextStyle(
                            fontSize: AppCommonSize.size16,
                            color: AppColorTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '100.00 ₺',
                          style: TextStyle(
                            fontSize: AppCommonSize.size12,
                            decoration: TextDecoration.lineThrough,
                            color: AppColorTheme.textSecondary,
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
                        color: Colors.white,
                        size: AppCommonSize.size20,
                      ),
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

  Widget _builProductListTile(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 17),
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
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: AppCommonSize.size128,
                height: AppCommonSize.size128,
                decoration: BoxDecoration(
                  color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(AppCommonSize.size16),
                  ),
                ),
                child: Center(
                  child: Image.asset(images[index], fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: AppCommonSize.size8,
                left: AppCommonSize.size8,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppCommonSize.size8,
                    vertical: AppCommonSize.size4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColorTheme.successColor,
                    borderRadius: BorderRadius.circular(AppCommonSize.size12),
                  ),
                  child: Text(
                    '20%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppCommonSize.size12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppCommonSize.size12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          'Ürün İsmi',
                          style: TextStyle(
                            fontSize: AppCommonSize.size14,
                            fontWeight: FontWeight.bold,
                            color: AppColorTheme.textInverse,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: AppColorTheme.errorColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppCommonSize.size4),
                  Text(
                    'Moda',
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
                            '80.00 ₺',
                            style: TextStyle(
                              fontSize: AppCommonSize.size16,
                              color: AppColorTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '100.00 ₺',
                            style: TextStyle(
                              fontSize: AppCommonSize.size12,
                              decoration: TextDecoration.lineThrough,
                              color: AppColorTheme.textSecondary,
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
                          color: Colors.white,
                          size: AppCommonSize.size20,
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
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppCommonSize.size20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(AppCommonSize.size16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: Text('Temizle')),
                      Text(
                        'Filtrele',
                        style: TextStyle(
                          fontSize: AppCommonSize.size18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Uygula'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.all(AppCommonSize.size16),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ücret Aralığı',
                            style: TextStyle(
                              fontSize: AppCommonSize.size16,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size16),
                          RangeSlider(
                            min: 0,
                            max: 1000,
                            divisions: 100,
                            labels: RangeLabels(
                              '${_pricesRange.start.round()} ₺',
                              '${_pricesRange.end.round()} ₺',
                            ),
                            activeColor: AppColorTheme.primaryColor,
                            inactiveColor: AppColorTheme.primaryColor
                                .withValues(alpha: 0.2),
                            values: _pricesRange,
                            onChanged: (value) {
                              setState(() {
                                _pricesRange = value;
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${_pricesRange.start.round()} ₺',
                                style: TextStyle(
                                  color: AppColorTheme.textSecondary,
                                ),
                              ),
                              Text(
                                '${_pricesRange.end.round()} ₺',
                                style: TextStyle(
                                  color: AppColorTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Beden',
                            style: TextStyle(
                              fontSize: AppCommonSize.size16,
                              color: AppColorTheme.textInverse,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size16),
                          Wrap(
                            spacing: AppCommonSize.size8,
                            runSpacing: AppCommonSize.size8,
                            children: sizes.map((size) {
                              final isSelected = _selectedSize.contains(size);
                              return FilterChip(
                                label: Text(size),
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      _selectedSize.add(size);
                                    } else {
                                      _selectedSize.remove(size);
                                    }
                                  });
                                },
                                selectedColor: AppColorTheme.primaryColor
                                    .withValues(alpha: 0.2),
                                checkmarkColor: AppColorTheme.primaryColor,
                                labelStyle: TextStyle(
                                  color: isSelected
                                      ? AppColorTheme.primaryColor
                                      : AppColorTheme.textSecondary,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Divider(height: AppCommonSize.size32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Markalar',
                            style: TextStyle(
                              fontSize: AppCommonSize.size16,
                              color: AppColorTheme.textInverse,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size16),
                          Wrap(
                            spacing: AppCommonSize.size8,
                            runSpacing: AppCommonSize.size8,
                            children: brands.map((brand) {
                              final isSelected = _selectedBrands.contains(
                                brand,
                              );
                              return FilterChip(
                                label: Text(brand),
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      _selectedBrands.add(brand);
                                    } else {
                                      _selectedBrands.remove(brand);
                                    }
                                  });
                                },
                                selectedColor: AppColorTheme.primaryColor
                                    .withValues(alpha: 0.2),
                                checkmarkColor: AppColorTheme.primaryColor,
                                labelStyle: TextStyle(
                                  color: isSelected
                                      ? AppColorTheme.primaryColor
                                      : AppColorTheme.textSecondary,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Divider(height: AppCommonSize.size32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Renkler',
                            style: TextStyle(
                              fontSize: AppCommonSize.size16,
                              color: AppColorTheme.textInverse,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size16),
                          Wrap(
                            spacing: AppCommonSize.size8,
                            runSpacing: AppCommonSize.size8,
                            children: colors.map((color) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: AppCommonSize.size40,
                                  height: AppCommonSize.size40,
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey.withValues(alpha: 0.3),
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: AppCommonSize.size24,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppCommonSize.size20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(AppCommonSize.size16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withValues(alpha: 0.2),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sırala',
                      style: TextStyle(
                        fontSize: AppCommonSize.size18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: sortOptions.length,
                itemBuilder: (context, index) {
                  final option = sortOptions[index];
                  return ListTile(
                    title: Text(option),
                    trailing: _sortBy == option
                        ? Icon(Icons.check, color: AppColorTheme.primaryColor)
                        : SizedBox(),
                    onTap: () {
                      setState(() {
                        _sortBy = option;
                        Navigator.pop(context);
                      });
                    },
                  );
                },
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(AppCommonSize.size16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorTheme.primaryColor,
                      minimumSize: Size.fromHeight(AppCommonSize.size52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppCommonSize.size12,
                        ),
                      ),
                    ),
                    child: Text('Uygula',style:TextStyle(
                      color: Colors.white
                    )),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
