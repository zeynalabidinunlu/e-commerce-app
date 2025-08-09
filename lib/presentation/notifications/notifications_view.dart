import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});

  final List<Map<String, dynamic>> notifications = [
    {
      'type': 'Sipariş',
      'title': 'Siparişiniz alındı',
      'message': '12314 numaralı siparişiniz başarıyla alındı.',
      'time': '2 dakika önce',
      'read': false,
      'icon': Icons.local_shipping_outlined,
      'iconColor': AppColorTheme.successColor,
    },
    {
      'type': 'Promosyon',
      'title': 'Özel teklif',
      'message': 'Bu hafta sonu tüm ürünlerde %20 indirim!',
      'time': '1 saat önce',
      'read': false,
      'icon': Icons.local_offer_outlined,
      'iconColor': AppColorTheme.primaryColor,
    },
    {
      'type': 'Ödeme',
      'title': 'Ödeme onayı',
      'message': 'Ödemeniz başarıyla alındı.',
      'time': '3 saat önce',
      'read': true,
      'icon': Icons.payment_outlined,
      'iconColor': AppColorTheme.successColor,
    },
    {
      'type': 'Uyarı',
      'title': 'Ürünün fiyatı düştü !',
      'message': 'Favori ürününüzün fiyatı %15 düştü.',
      'time': '1 gün önce',
      'read': true,
      'icon': Icons.price_change_outlined,
      'iconColor': AppColorTheme.warningColor,
    },
    {
      'type': 'Sistem',
      'title': 'Sistem güncellemesi',
      'message': 'Sistemimizde önemli bir güncelleme yapıldı.',
      'time': '2 gün önce',
      'read': true,
      'icon': Icons.system_update_outlined,
      'iconColor': AppColorTheme.infoColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: AppCommonSize.size112,
            floating: false,
            pinned: true,
            foregroundColor: Colors.white,
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
                title: Text(
                  'Bildirimler',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppCommonSize.size24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Stack(
                  children: [
                    Positioned(
                      top: -50,
                      right: -50,
                      child: Container(
                        height: 150,
                        width: 150,
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
                onPressed: () {},
                icon: Icon(Icons.done_all, size: AppCommonSize.size24),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, size: AppCommonSize.size24),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppCommonSize.size16,
                    vertical: AppCommonSize.size8,
                  ),
                  decoration: BoxDecoration(
                    color: notification['read'] ? Colors.white54 : Colors.white,
                    borderRadius: BorderRadius.circular(AppCommonSize.size12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: AppCommonSize.size20,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppCommonSize.size10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (notification['iconColor'] as Color)
                                .withValues(alpha: 0.1),
                          ),
                          child: Icon(
                            notification['icon'] as IconData,
                            color: notification['iconColor'] as Color,
                            size: AppCommonSize.size32,
                          ),
                        ),
                        if (!notification['read']) ...[
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: AppCommonSize.size8,
                              height: AppCommonSize.size8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    title: Text(
                      notification['title'] as String,
                      style: TextStyle(
                        fontWeight: notification['read']
                            ? FontWeight.normal
                            : FontWeight.bold,
                        fontSize: AppCommonSize.size16,
                        color: AppColorTheme.textInverse,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification['message'] as String,
                          style: TextStyle(
                            fontSize: AppCommonSize.size14,
                            color: AppColorTheme.textSecondary,
                          ),
                        ),
                        SizedBox(height: AppCommonSize.size4),
                        Text(
                          notification['time'] as String,
                          style: TextStyle(
                            fontSize: AppCommonSize.size12,
                            color: AppColorTheme.textTertiary,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.more_horiz, size: AppCommonSize.size20),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(AppCommonSize.size20),
                            ),
                          ),
                          builder: (context) => Container(
                            padding: EdgeInsets.all(AppCommonSize.size16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.mark_email_read_outlined, color: Colors.blue),
                                  title: Text('Okundu olarak işaretle'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.delete_outline, color: Colors.red),
                                  title: Text('Sil'),
                                  onTap: () {
                                    // Arşivleme işlemi
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.block_outlined, color: Colors.grey),
                                  title: Text('Bildirimleri engelle'),
                                  onTap: () {
                                    // Paylaşma işlemi
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
