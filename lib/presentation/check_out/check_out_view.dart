import 'package:e_commerce_project/presentation/payment/payment_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int _selectedAddressIndex = 0;
  int _selectedDeliveryMethod = 0;
  final deliveryMethods = [
    {
      'title': 'Standart Teslimat',
      'duration': '3-5 İş Günü',
      'price': '50.0 ₺',
      'icon': Icons.local_shipping_outlined,
    },
    {
      'title': 'Express Teslimat',
      'duration': '1-2 İş Günü',
      'price': '100.0 ₺',
      'icon': Icons.delivery_dining_outlined,
    },
  ];

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

  Widget _buildAddressCard(int index) {
    final isSelected = _selectedAddressIndex == index;
    return GestureDetector(
      onTap: () => setState(() {
        _selectedAddressIndex = index;
      }),
      child: Container(
        margin: EdgeInsets.only(bottom: AppCommonSize.size16),
        padding: EdgeInsets.all(AppCommonSize.size16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppCommonSize.size16),
          border: Border.all(
            color: isSelected ? AppColorTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
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
            Radio(
              value: index,
              groupValue: _selectedAddressIndex,
              onChanged: (value) {
                setState(() {
                  _selectedAddressIndex = value as int;
                });
              },
              activeColor: AppColorTheme.primaryColor,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Sevglili Haci Bayram',
                        style: TextStyle(
                          fontSize: AppCommonSize.size16,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.textInverse,
                        ),
                      ),
                      SizedBox(width: AppCommonSize.size8),
                      if (index == 0)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppCommonSize.size8,
                            vertical: AppCommonSize.size4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColorTheme.primaryColor.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppCommonSize.size12,
                            ),
                          ),
                          child: Text(
                            'Varsayılan',
                            style: TextStyle(
                              fontSize: AppCommonSize.size10,
                              color: AppColorTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(width: AppCommonSize.size4),
                  Text(
                    '0537 430 ** **',
                    style: TextStyle(color: AppColorTheme.textInverse),
                  ),
                  SizedBox(width: AppCommonSize.size4),
                  Text(
                    'Fırat Mah. Azerbeycan Sok.\nBattalgazi / Malatya',
                    style: TextStyle(color: AppColorTheme.textInverse),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit_outlined,
                    color: AppColorTheme.primaryColor,
                  ),
                ),
                if (index != 0)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline,
                      color: AppColorTheme.primaryColor,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryMethodCard(int index, Map<String, dynamic> method) {
    final isSelected = _selectedDeliveryMethod == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDeliveryMethod = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: AppCommonSize.size16),
        padding: EdgeInsets.all(AppCommonSize.size16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppCommonSize.size16),
          border: Border.all(
            color: isSelected ? AppColorTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
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
            Radio(
              value: index,
              groupValue: _selectedDeliveryMethod,
              onChanged: (value) {
                setState(() {
                  _selectedDeliveryMethod = value as int;
                });
              },
              activeColor: AppColorTheme.primaryColor,
            ),
            Container(
              padding: EdgeInsets.all(AppCommonSize.size12),
              decoration: BoxDecoration(
                color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppCommonSize.size12),
              ),
              child: Icon(
                method['icon'] as IconData,
                color: AppColorTheme.primaryColor,
              ),
            ),
            SizedBox(width: AppCommonSize.size16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method['title'] as String,
                    style: TextStyle(
                      fontSize: AppCommonSize.size16,
                      fontWeight: FontWeight.bold,
                      color: AppColorTheme.textInverse,
                    ),
                  ),
                  Text(
                    method['duration'] as String,
                    style: TextStyle(color: AppColorTheme.textSecondary),
                  ),
                ],
              ),
            ),
            Text(
              method['price'] as String,
              style: TextStyle(
                fontSize: AppCommonSize.size16,
                fontWeight: FontWeight.bold,
                color: AppColorTheme.primaryColor,
              ),
            ),
          ],
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
                  'Ödeme Ekranı',
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
                      _buildStep(2, 'Ödeme', false),
                      _buildStepConnector(false),
                      _buildStep(3, 'Onay', false),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(AppCommonSize.size16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Teslimat Adresi",
                            style: TextStyle(
                              fontSize: AppCommonSize.size18,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            label: Text('Yeni Adres'),
                          ),
                        ],
                      ),
                      SizedBox(height: AppCommonSize.size16),
                      ...List.generate(2, (index) => _buildAddressCard(index)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(AppCommonSize.size16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Teslimat Seçeneği",
                            style: TextStyle(
                              fontSize: AppCommonSize.size18,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppCommonSize.size16),
                      ...List.generate(
                        2,
                        (index) => _buildDeliveryMethodCard(
                          index,
                          deliveryMethods[index],
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
          child: GradientButton(
            text: 'Ödeme ile devam et',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentView()),
              );
            },
          ),
        ),
      ),
    );
  }
}
