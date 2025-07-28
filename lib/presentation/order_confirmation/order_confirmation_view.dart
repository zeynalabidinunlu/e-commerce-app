import 'package:e_commerce_project/presentation/main/main_view.dart';
import 'package:e_commerce_project/presentation/order_confirmation/order_confirmation_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class OrderConfirmationView extends StatefulWidget {
  const OrderConfirmationView({super.key});

  @override
  State<OrderConfirmationView> createState() => _OrderConfirmationViewState();
}

class _OrderConfirmationViewState extends State<OrderConfirmationView> {
  Widget _buildStep(int number, String title, bool isActive) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: AppCommonSize.size36,
            height: AppCommonSize.size36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: isActive ? AppColorTheme.primaryColor : Colors.white,
              border: Border.all(
                color: isActive
                    ? AppColorTheme.primaryColor
                    : AppColorTheme.textSecondary,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  color: isActive ? Colors.white : AppColorTheme.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: AppCommonSize.size4),
          Text(
            title,
            style: TextStyle(
              color: isActive
                  ? AppColorTheme.primaryColor
                  : AppColorTheme.textSecondary,
              fontSize: AppCommonSize.size12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepConnector(bool isActive) {
    return Container(
      width: AppCommonSize.size40,
      height: 2,
      color: isActive
          ? AppColorTheme.primaryColor
          : AppColorTheme.textSecondary.withValues(alpha: 0.2),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppCommonSize.size4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: AppCommonSize.size14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: AppColorTheme.textSecondary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: AppCommonSize.size14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: valueColor ?? AppColorTheme.textInverse,
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
            foregroundColor: Colors.white,
            pinned: true,
            expandedHeight: AppCommonSize.size128,
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
                  'Sipariş Bilgileri ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
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
                      _buildStep(1, 'Kargo', true),
                      _buildStepConnector(true),
                      _buildStep(2, 'Ödeme', true),
                      _buildStepConnector(true),
                      _buildStep(3, 'Onay', true),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: AppColorTheme.successColor.withValues(
                            alpha: 0.1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_circle,
                          size: 100,
                          color: AppColorTheme.successColor,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size16),
                      Text(
                        'Siparişiniz başarıyla alındı.',
                        style: TextStyle(
                          fontSize: AppCommonSize.size24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size8),
                      Text(
                        'Siparişiniz onaylandı, en kısa sürede teslim edilecektir',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppCommonSize.size14,
                          color: AppColorTheme.textSecondary,
                        ),
                      ),
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
                        'Sipariş Detayları',
                        style: TextStyle(
                          fontSize: AppCommonSize.size18,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.textInverse,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size16),
                      _buildDetailRow('Sipariş Numarası', '1A79862334KLM'),
                      _buildDetailRow('Sipariş Tarihi', '28/07/2025'),
                      _buildDetailRow('Toplam Tutar', '2.147,97 ₺'),
                      _buildDetailRow(
                        'Durumu',
                        'Hazırlanıyor',
                        valueColor: AppColorTheme.warningColor,
                        isBold: true,
                      ),
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
                        'Teslimat Detayları',
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
                              Icons.location_on_outlined,
                              color: AppColorTheme.primaryColor,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Teslimat Adresi',
                                  style: TextStyle(
                                    fontSize: AppCommonSize.size14,
                                    color: AppColorTheme.textSecondary,
                                  ),
                                ),
                                SizedBox(height: AppCommonSize.size4),
                                Text(
                                  'Fırat Mah. Huzur Sok. Sır Apt.\nBattalgazi/Malatya',
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
                      SizedBox(height: AppCommonSize.size16),
                      Divider(),
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
                              Icons.local_shipping_outlined,
                              color: AppColorTheme.primaryColor,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kargo Detayları',
                                  style: TextStyle(
                                    fontSize: AppCommonSize.size14,
                                    color: AppColorTheme.textSecondary,
                                  ),
                                ),
                                SizedBox(height: AppCommonSize.size4),
                                Text(
                                  'Express Teslimat (1-2 İş günü)',
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
                      SizedBox(height: AppCommonSize.size16),
                      Divider(),
                      SizedBox(height: AppCommonSize.size16),
                      _buildDetailRow('Ara Tutar', '1.999.97 ₺'),
                      _buildDetailRow('Kargo Ücreti', '100.0 ₺'),
                      _buildDetailRow('Vergi Ücreti', '50.0 ₺'),
                      Divider(height: 24),
                      _buildDetailRow(
                        'Toplam Tutar',
                        '2.147.97 ₺',
                        isBold: true,
                        valueColor: AppColorTheme.priceColor,
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
                  onPressed: () {},
                  child: Text('Sipariş Takibi'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: GradientButton(
                  text: 'Alışverişe Devam Et',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainView()),
                    );
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
