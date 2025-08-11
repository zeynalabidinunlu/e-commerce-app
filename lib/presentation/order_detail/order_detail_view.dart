import 'package:e_commerce_project/presentation/order_tracking/order_tracking_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  Widget _buildOrderItem({
    required String image,
    required String name,
    required String variant,
    required double price,
    required int quantity,
  }) {
    return Container(
      padding: EdgeInsets.all(AppCommonSize.size16),
      margin: EdgeInsets.only(bottom: AppCommonSize.size16),
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
            height: AppCommonSize.size80,
            width: AppCommonSize.size80,
            decoration: BoxDecoration(
              color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppCommonSize.size12),
            ),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          SizedBox(width: AppCommonSize.size16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: AppCommonSize.size16,
                    fontWeight: FontWeight.bold,
                    color: AppColorTheme.textInverse,
                  ),
                ),
                SizedBox(height: AppCommonSize.size4),
                Text(
                  variant,
                  style: TextStyle(
                    fontSize: AppCommonSize.size14,
                    color: AppColorTheme.textSecondary,
                  ),
                ),
                SizedBox(height: AppCommonSize.size8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${price.toStringAsFixed(2)} ₺',
                      style: TextStyle(
                        fontSize: AppCommonSize.size16,
                        color: AppColorTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'KLT $quantity',
                      style: TextStyle(color: AppColorTheme.textSecondary),
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

  Widget _buildDetailItem(
    String label,
    String value, {
    bool isPrimary = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppCommonSize.size8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: AppCommonSize.size14,
              color: AppColorTheme.textSecondary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: AppCommonSize.size16,
              color: isPrimary
                  ? AppColorTheme.primaryColor
                  : AppColorTheme.textSecondary,
              fontWeight: isPrimary ? FontWeight.bold : FontWeight.normal,
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
                  'Sipariş Detayları',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.all(AppCommonSize.size16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sipariş #ASDFGS234',
                              style: TextStyle(
                                fontSize: AppCommonSize.size18,
                                fontWeight: FontWeight.bold,
                                color: AppColorTheme.textInverse,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppCommonSize.size12,
                                vertical: AppCommonSize.size6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColorTheme.warningColor.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppCommonSize.size12,
                                ),
                              ),
                              child: Text(
                                'Sevkiyat\nAşamasında',
                                style: TextStyle(
                                  color: AppColorTheme.warningColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppCommonSize.size16),
                        Text(
                          '31 Temmuz 2025 tarihinde verildi',
                          style: TextStyle(color: AppColorTheme.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size24),
                  Text(
                    'Siparişler',
                    style: TextStyle(
                      fontSize: AppCommonSize.size18,
                      fontWeight: FontWeight.bold,
                      color: AppColorTheme.textInverse,
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size16),
                  _buildOrderItem(
                    image: 'assets/images/clothes_V1.png',
                    name: 'Nike Eşofman Takımı',
                    price: 600.00,
                    quantity: 2,
                    variant: 'Renk: Siyah | Beden:M',
                  ),
                  _buildOrderItem(
                    image: 'assets/images/clothes_V2.png',
                    name: 'Nike SweatShirt',
                    price: 400.00,
                    quantity: 1,
                    variant: 'Renk: Yeşil | Beden:L',
                  ),
                  SizedBox(height: AppCommonSize.size24),
                  Container(
                    padding: EdgeInsets.all(AppCommonSize.size16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppCommonSize.size16),
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
                        SizedBox(height: 16),
                        _buildDetailItem('Ara Toplam', '1000.00 ₺'),
                        _buildDetailItem('Kargo Ücreti', '100.00 ₺'),
                        _buildDetailItem('Vergi', '50.00 ₺'),
                        Divider(height: AppCommonSize.size24),
                        _buildDetailItem(
                          'Toplam Tutar',
                          '1150.00 ₺',
                          isPrimary: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size24),
                  Container(
                    padding: EdgeInsets.all(AppCommonSize.size16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppCommonSize.size16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kargo Bilgileri',
                          style: TextStyle(
                            fontSize: AppCommonSize.size18,
                            fontWeight: FontWeight.bold,
                            color: AppColorTheme.textInverse,
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildDetailItem('Kargo Şirketi', 'Yurtiçi Kargo'),
                        _buildDetailItem('Takip Numarası', '1234567890'),
                        _buildDetailItem('Gönderim Tarihi', '01 Ağustos 2025'),
                        _buildDetailItem('Tahmini Teslimat', '05 Ağustos 2025'),
                        _buildDetailItem(
                          'Durum',
                          'Sevkiyat Aşamasında',
                          isPrimary: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size24),
                  // Container(
                  //   padding: EdgeInsets.all(AppCommonSize.size16),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(AppCommonSize.size16),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Kargo Bilgileri',
                  //         style: TextStyle(
                  //           fontSize: AppCommonSize.size18,
                  //           fontWeight: FontWeight.bold,
                  //           color: AppColorTheme.textInverse,
                  //         ),
                  //       ),
                  //       SizedBox(height: 16),
                  //       _buildDetailItem('Kargo Şirketi', 'Yurtiçi Kargo'),
                  //       _buildDetailItem('Takip Numarası', '1234567890'),
                  //       _buildDetailItem('Gönderim Tarihi', '01 Ağustos 2025'),
                  //       _buildDetailItem('Tahmini Teslimat', '05 Ağustos 2025'),
                  //       _buildDetailItem(
                  //         'Durum',
                  //         'Sevkiyat Aşamasında',
                  //         isPrimary: true,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: AppCommonSize.size24),
                  Container(
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
                          'Ödeme Detayları',
                          style: TextStyle(
                            fontSize: AppCommonSize.size18,
                            fontWeight: FontWeight.bold,
                            color: AppColorTheme.textInverse,
                          ),
                        ),
                        SizedBox(height: AppCommonSize.size16),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(AppCommonSize.size16),
                              decoration: BoxDecoration(
                                color: AppColorTheme.primaryColor.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppCommonSize.size12,
                                ),
                              ),
                              child: Icon(
                                Icons.credit_card,
                                color: AppColorTheme.primaryColor,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ödeme Şekli',
                                    style: TextStyle(
                                      fontSize: AppCommonSize.size14,
                                      color: AppColorTheme.textSecondary,
                                    ),
                                  ),
                                  SizedBox(height: AppCommonSize.size4),
                                  Text(
                                    'Kredi Kartı **** **** **** 6003',
                                    style: TextStyle(
                                      color: AppColorTheme.textInverse,
                                      fontWeight: FontWeight.w400,
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
                  SizedBox(height: AppCommonSize.size112),
                ],
              ),
            ),
          ),
        ],
      ),
       bottomSheet: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: AppColorTheme.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderTrackingView(),
                      ),
                    );
                  },
                  child: Text('Sipariş Takibi'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: GradientButton(
                  text: 'Yardım Al',
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MainView()),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
