import 'package:e_commerce_project/presentation/payment/payment_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  int _selectedPaymentMethod = 0;
  int _selectedCard = 0;
  final paymentMethods = [
    {'title': 'Kredi/Banka Kartı', 'icon': Icons.credit_card},
    {'title': 'PayPal', 'icon': Icons.paypal},
    {'title': 'Apple', 'icon': Icons.apple},
    {'title': 'Google Pay', 'icon': Icons.g_mobiledata},
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
                      _buildStep(2, 'Ödeme', true),
                      _buildStepConnector(true),
                      _buildStep(3, 'Onay', false),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(AppCommonSize.size8),
                  padding: EdgeInsets.all(AppCommonSize.size8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ödeme Seçenekleri",
                            style: TextStyle(
                              fontSize: AppCommonSize.size18,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),

                          SizedBox(height: AppCommonSize.size16),
                          ...List.generate(
                            paymentMethods.length,
                            (index) => _buildPaymentsMethodCard(
                              index,
                              paymentMethods[index],
                            ),
                          ),
                        ],
                      ),
                      _buildSaveCards(),
                    //  SizedBox(height: 5),
                      Container(
                        margin: EdgeInsets.all(AppCommonSize.size16),
                        padding: EdgeInsets.all(AppCommonSize.size16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            AppCommonSize.size16,
                          ),
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
                      SizedBox(height: 100,)
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
            text: 'Ödemeyi Onayla',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PaymentView()),
              // );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentsMethodCard(int index, Map<String, dynamic> method) {
    final isSelected = _selectedPaymentMethod == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = index;
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
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value as int;
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
            Text(
              method['title'] as String,
              style: TextStyle(
                fontSize: AppCommonSize.size18,
                fontWeight: FontWeight.bold,
                color: AppColorTheme.textInverse,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveCards() {
    if (_selectedPaymentMethod != 0) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppCommonSize.size16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kayıtlı Kartlar',
                style: TextStyle(
                  fontSize: AppCommonSize.size18,
                  fontWeight: FontWeight.bold,
                  color: AppColorTheme.textInverse,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text('Yeni Ekle'),
                icon: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(height: AppCommonSize.size16),
          SizedBox(
            height: AppCommonSize.size192,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => _buildCreditCard(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCard(index) {
    final isSelected = _selectedCard == index;
    final colors = [
      AppColorTheme.primaryGradient,
      [AppColorTheme.secondaryColor, AppColorTheme.successDark],
      [AppColorTheme.primaryColor, AppColorTheme.secondaryColor],
    ];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCard = index;
        });
      },
      child: Container(
        width: 300,
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(AppCommonSize.size20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors[index],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppCommonSize.size20),
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: AppCommonSize.size20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kredi Kartı',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppCommonSize.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.credit_card,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: AppCommonSize.size32,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '**** **** **** 6003',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppCommonSize.size20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: AppCommonSize.size16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kart Sahibi',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: AppCommonSize.size10,
                          ),
                        ),
                        Text(
                          'Haci Bayram',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppCommonSize.size16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Süresi Doluyor',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: AppCommonSize.size10,
                          ),
                        ),
                        Text(
                          '12/25',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppCommonSize.size16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
