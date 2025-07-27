import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  final images = [
    'assets/images/clothes_V1.png',
    'assets/images/clothes_V2.png',
    'assets/images/clothes_V3.png',
  ];

  CartView({super.key});
  Widget _buildCarItem(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: AppCommonSize.size16),
      padding: EdgeInsets.all(AppCommonSize.size12),
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
          Container(
            width: AppCommonSize.size96,
            height: AppCommonSize.size96,
            decoration: BoxDecoration(
              color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppCommonSize.size12),
            ),
            child: Center(child: Image.asset(images[index], fit: BoxFit.cover)),
          ),
          SizedBox(width: AppCommonSize.size16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Ürün İsmi',
                        style: TextStyle(
                          fontSize: AppCommonSize.size16,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.textInverse,
                        ),
                      ),
                    ),
                    Icon(Icons.delete_outline, color: AppColorTheme.errorColor),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Beden: M | Renk: Mavi',
                  style: TextStyle(
                    fontSize: AppCommonSize.size12,
                    color: AppColorTheme.textSecondary,
                  ),
                ),
                SizedBox(height: AppCommonSize.size8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '399.99 ₺',
                      style: TextStyle(
                        fontSize: AppCommonSize.size16,
                        fontWeight: FontWeight.bold,
                        color: AppColorTheme.primaryColor,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppCommonSize.size20,
                        ),
                        border: Border.all(
                          color: AppColorTheme.textSecondary.withValues(
                            alpha: 0.2,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          _buildQuantityButton(
                            icon: Icons.remove,
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: AppCommonSize.size40,
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: AppCommonSize.size16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          _buildQuantityButton(
                            icon: Icons.add,
                            onPressed: () {},
                          ),
                        ],
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
                title: Text(
                  'Alışveriş Sepeti',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_outline, color: Colors.white),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(AppCommonSize.size16),
                  child: Column(
                    children: List.generate(3, (index) => _buildCarItem(index)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppCommonSize.size16,
                    vertical: AppCommonSize.size8,
                  ),
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
                      Icon(
                        Icons.local_offer_outlined,
                        color: AppColorTheme.primaryColor,
                      ),
                      SizedBox(width: AppCommonSize.size12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Promosyon Kodunu Giriniz',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColorTheme.textSecondary,
                            ),
                          ),
                        ),
                      ),
                      TextButton(onPressed: () {}, child: Text('Uygula')),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(AppCommonSize.size16),
                  padding: EdgeInsets.all(AppCommonSize.size16),
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
                      Text(
                        'Sipariş Özeti',
                        style: TextStyle(
                          fontSize: AppCommonSize.size18,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.textInverse,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size16),
                      _buildSummaryRow('Ürün Toplam Tutar', '1.999,97 ₺'),
                      _buildSummaryRow('Kargo Ücreti', '100.0 ₺'),
                      _buildSummaryRow('Vergi Ücreti', '50.0 ₺'),
                      Divider(height: AppCommonSize.size24),
                      _buildSummaryRow(
                        'Toplam Tutar',
                        '2.147,97 ₺',
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
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
        child: SafeArea(
          child: GradientButton(text: 'Siparişi Onayla (2.147,97 ₺)', onPressed: () {}),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppCommonSize.size4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal
                  ? AppColorTheme.textInverse
                  : AppColorTheme.textSecondary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal
                  ? AppColorTheme.textInverse
                  : AppColorTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppCommonSize.size20),
        ),
        child: Icon(
          icon,
          size: AppCommonSize.size16,
          color: AppColorTheme.primaryColor,
        ),
      ),
    );
  }
}
