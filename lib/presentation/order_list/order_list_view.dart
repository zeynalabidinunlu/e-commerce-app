import 'package:e_commerce_project/presentation/order_detail/order_detail_view.dart';
import 'package:e_commerce_project/presentation/order_tracking/order_tracking_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class OrderListView extends StatelessWidget {
  OrderListView({super.key});
  final orders = [
    {
      'orderId': '12345',
      'date': '3 Temmuz 2025',
      'status': 'Sevkiyat Aşamasında',
      'items': ['Preimium Eşofman (2x)', 'Nike Spor Ayakkabı(1x)'],
      'total': 299.99,
    },
    {
      'orderId': '12345',
      'date': '3 Temmuz 2025',
      'status': 'İptal Edildi',
      'items': ['Bileklik (1x)', 'Saat (1x)'],
      'total': 299.99,
    },
    {
      'orderId': '12345',
      'date': '3 Temmuz 2025',
      'status': 'Teslim Edildi',
      'items': [' Kot Pantolon (1x)', 'Puma Spor Ayakkabı(1x)'],
      'total': 299.99,
    },
    {
      'orderId': '12345',
      'date': '3 Temmuz 2025',
      'status': 'Hazırlanıyor',
      'items': ['Kışlık Mont (1x)', 'Sneaker Bot (1x)'],
      'total': 299.99,
    },
  ];
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Teslim Edildi':
        return AppColorTheme.successColor;

      case 'Sevkiyat Aşamasında':
        return AppColorTheme.warningColor;

      case 'Hazırlanıyor':
        return AppColorTheme.primaryColor;

      case 'İptal Edildi':
        return AppColorTheme.errorColor;
      default:
        return AppColorTheme.textSecondary;
    }
  }

  Widget _buildOrderCard({
    required String orderId,
    required String date,
    required String status,
    required List<String> items,
    required double total,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return Container(
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
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppCommonSize.size16),
        child: Padding(
          padding: EdgeInsetsGeometry.all(AppCommonSize.size16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sipariş #$orderId',
                    style: TextStyle(
                      fontSize: AppCommonSize.size16,
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
                      color: _getStatusColor(status).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppCommonSize.size12),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: _getStatusColor(status),
                        fontWeight: FontWeight.bold,
                        fontSize: AppCommonSize.size12,
                      ),
                    ),
                  ),
                ]),
                  SizedBox(height: 12),
                  Text(
                    'Sipariş Tarihi #$date',
                    style: TextStyle(
                      fontSize: AppCommonSize.size14,
                      color: AppColorTheme.textSecondary,
                    ),
                  ),
                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 12),
                  Text(
                    '${items.length} ${items.length == 1 ? 'item' : 'items'}:',
                    style: TextStyle(
                      fontSize: AppCommonSize.size14,
                      color: AppColorTheme.textSecondary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    items.join(', '),
                    style: TextStyle(
                      fontSize: AppCommonSize.size14,
                      color: AppColorTheme.textInverse,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Toplam:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.textInverse,
                        ),
                      ),
                      Text(
                        '${total.toStringAsFixed(2)} ₺',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderTrackingView(),
                            ),
                          );
                        },
                        label: Text('Sipariş Takibi'),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColorTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            
          ),
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
            expandedHeight: 120,
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
                title: Text(
                  'Siparişlerim',
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
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppCommonSize.size16,
                      vertical: AppCommonSize.size12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppCommonSize.size12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Siparişlerimi Ara...',
                              hintStyle: TextStyle(
                                color: AppColorTheme.textSecondary,
                              ),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.search,
                                color: AppColorTheme.textSecondary,
                              ),
                              suffixIcon: Container(
                                padding: EdgeInsets.all(AppCommonSize.size8),
                                decoration: BoxDecoration(
                                  color: AppColorTheme.primaryColor.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppCommonSize.size8,
                                  ),
                                ),
                                child: Icon(
                                  Icons.filter_list,
                                  color: AppColorTheme.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size24,),
                  ...orders.map((order) => _buildOrderCard(
                    orderId: order['orderId'] as String, 
                  date: order['date'] as String, 
                  status: order['status'] as String, 
                  items: order['items'] as List<String>, 
                  total: order['total'] as double, 
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailView(),));
                  }, 
                  context: context),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
