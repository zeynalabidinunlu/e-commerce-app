import 'package:e_commerce_project/presentation/main/main_view.dart';
import 'package:e_commerce_project/presentation/order_detail/order_detail_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({super.key});

  Widget _buildTimelineItem({
    required String status,
    required String date,
    required String description,
    required bool isCompleted,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: AppCommonSize.size60,
            child: Column(
              children: [
                if (!isFirst)
                  Container(
                    width: 2,
                    height: AppCommonSize.size32,
                    color: isCompleted
                        ? AppColorTheme.primaryColor
                        : AppColorTheme.textSecondary.withValues(alpha: 0.2),
                  ),
                Container(
                  width: AppCommonSize.size24,
                  height: AppCommonSize.size24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? AppColorTheme.primaryColor
                        : Colors.white,
                    border: Border.all(
                      width: 2,
                      color: isCompleted
                          ? AppColorTheme.primaryColor
                          : AppColorTheme.textSecondary,
                    ),
                  ),
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          size: AppCommonSize.size16,
                          color: Colors.white,
                        )
                      : null,
                ),
                if (isFirst)
                  Container(
                    width: 2,
                    height: AppCommonSize.size52,
                    color: isCompleted
                        ? AppColorTheme.primaryColor
                        : AppColorTheme.textSecondary.withValues(alpha: 0.2),
                  ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: AppCommonSize.size32,
                    color: isCompleted
                        ? AppColorTheme.primaryColor
                        : AppColorTheme.textSecondary.withValues(alpha: 0.2),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: AppCommonSize.size8,
                bottom: AppCommonSize.size16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: AppCommonSize.size16,
                      fontWeight: FontWeight.bold,
                      color: isCompleted
                          ? AppColorTheme.primaryColor
                          : AppColorTheme.textInverse,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: AppCommonSize.size12,
                      color: AppColorTheme.textSecondary,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: AppCommonSize.size14,
                      color: AppColorTheme.textSecondary,
                    ),
                  ),
                ],
              ),
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
                  'Sipariş Takibi',
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
                  width: double.infinity,
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
                    children: [
                      Text(
                        'Tahmini Teslimat Tarihi',
                        style: TextStyle(
                          fontSize: AppCommonSize.size14,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.textSecondary,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size8),
                      Text(
                        '3 Temmuz 2025',
                        style: TextStyle(
                          fontSize: AppCommonSize.size24,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.primaryColor,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size4),
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
                          'Sevkiyat Aşamasında',
                          style: TextStyle(
                            color: AppColorTheme.warningColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppCommonSize.size16,
                  ),
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
                    children: [
                      _buildTimelineItem(
                        status: 'Sipariş Verildi',
                        date: '31 Ağustos 2025 - 11:30',
                        description: 'Siparişiniz onaylandı ve hazırlanıyor.',
                        isCompleted: true,
                        isFirst: true,
                      ),
                      _buildTimelineItem(
                        status: 'Kargo için Hazırlanıyor',
                        date: '1 Temmuz 2025 - 11:30',
                        description: 'Siparişiniz kargo için hazırlanıyor.',
                        isCompleted: true,
                      ),
                      _buildTimelineItem(
                        status: 'Sevkiyat Aşamasında',
                        date: '2 Temmuz 2025 - 11:30',
                        description: 'Siparişiniz teslimat için yola çıktı.',
                        isCompleted: true,
                      ),
                      _buildTimelineItem(
                        status: 'Dağıtım Aşamasında',
                        date: '3 Temmuz 2025',
                        description: 'Siparişiniz bugün teslim edilebilir.',
                        isCompleted: false,
                      ),
                      _buildTimelineItem(
                        status: 'Teslim Edildi',
                        date: '3 Temmuz 2025',
                        description: 'Siparişiniz bugün teslim edilebilir.',
                        isCompleted: false,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppCommonSize.size16),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppCommonSize.size16,
                  ),
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
                            padding: EdgeInsets.all(AppCommonSize.size12),
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
                                  'Sipariş Numarası',
                                  style: TextStyle(
                                    fontSize: AppCommonSize.size14,
                                    color: AppColorTheme.textSecondary,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'TRKYKAJDGFWI5',
                                  style: TextStyle(
                                    fontSize: AppCommonSize.size16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColorTheme.textInverse,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.copy,
                              color: AppColorTheme.primaryColor,
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
                            padding: EdgeInsets.all(AppCommonSize.size12),
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
                                SizedBox(height: 4),
                                Text(
                                  'Fırat Mah. Azerbeycan Sok.\n Battalgazi/Malatya',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColorTheme.textInverse,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.copy,
                              color: AppColorTheme.primaryColor,
                            ),
                          ),
                        ],
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
      bottomSheet:  Container(
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
                        builder: (context) => OrderDetailView(),
                      ),
                    );
                  },
                  child: Text('Sipariş Detayları'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: GradientButton(
                  text: 'Ana Sayfa',
                  onPressed: () {
                    Navigator.pushReplacement(
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
