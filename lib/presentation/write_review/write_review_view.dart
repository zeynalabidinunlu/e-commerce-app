import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:e_commerce_project/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class WriteReviewView extends StatefulWidget {
  const WriteReviewView({super.key});

  @override
  State<WriteReviewView> createState() => _WriteReviewViewState();
}

class _WriteReviewViewState extends State<WriteReviewView> {
  int _rating = 0;
  final _reviewController = TextEditingController();
  final _titleController = TextEditingController();
  List<String> _selectedImages = [];
  final images = [
    'assets/images/clothes_V1.png',
    'assets/images/clothes_V2.png',
    'assets/images/clothes_V3.png',
    'assets/images/clothes_V4.png',
  ];
  @override
  void dispose() {
    _reviewController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  String _getRatingText() {
    switch (_rating) {
      case 1:
        return 'Çok Kötü';
      case 2:
        return 'Kötü';
      case 3:
        return 'İyi';
      case 4:
        return 'Çok İyi';
      case 5:
        return 'Mükemmel';

      default:
        return 'Değerlendir';
    }
  }

  Widget _buildImagePreview(String image) {
    return Container(
      width: AppCommonSize.size96,
      height: AppCommonSize.size96,
      margin: EdgeInsets.only(right: AppCommonSize.size8),
      decoration: BoxDecoration(
        color: AppColorTheme.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppCommonSize.size12),
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/clothes_V1.png',
              height: AppCommonSize.size52,
              width: AppCommonSize.size52,
            ),
          ),
          Positioned(
            top: AppCommonSize.size4,
            right: AppCommonSize.size4,
            child: IconButton(
              onPressed: () {
                setState(() {
                  _selectedImages.remove(image);
                });
              },
              icon: Icon(
                Icons.close,
                color: AppColorTheme.errorColor,
                size: AppCommonSize.size20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidelineItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppCommonSize.size4),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: AppColorTheme.primaryColor,
            size: AppCommonSize.size16,
          ),
          SizedBox(width: AppCommonSize.size8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: AppColorTheme.textInverse),
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
                centerTitle: true,
                title: Text(
                  'Yorum Yaz',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppCommonSize.size16),
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
                    child: Row(
                      children: [
                        Container(
                          height: AppCommonSize.size80,
                          width: AppCommonSize.size80,
                          decoration: BoxDecoration(
                            color: AppColorTheme.primaryColor.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppCommonSize.size12,
                            ),
                          ),
                          child: Center(
                            child: Image.asset('assets/images/clothes_V1.png'),
                          ),
                        ),
                        SizedBox(width: AppCommonSize.size16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nike Eşofman Takımı',
                                style: TextStyle(
                                  fontSize: AppCommonSize.size16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColorTheme.textInverse,
                                ),
                              ),
                              SizedBox(height: AppCommonSize.size4),
                              Text(
                                'Beden: M | Renk: Siyah',
                                style: TextStyle(
                                  color: AppColorTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppCommonSize.size24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ürünü Puanla',
                        style: TextStyle(
                          fontSize: AppCommonSize.size18,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.textInverse,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = index + 1;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: AppCommonSize.size8,
                              ),
                              child: Icon(
                                index < _rating
                                    ? Icons.star
                                    : Icons.star_border,
                                color: AppColorTheme.warningColor,
                                size: AppCommonSize.size40,
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: AppCommonSize.size8),
                      Center(
                        child: Text(
                          _getRatingText(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColorTheme.primaryDark,
                            fontSize: AppCommonSize.size20,
                          ),
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yorumunu Yaz',
                            style: TextStyle(
                              fontSize: AppCommonSize.size18,
                              fontWeight: FontWeight.bold,
                              color: AppColorTheme.textInverse,
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size16),
                          TextField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              hintText: 'Başlık girin',
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppCommonSize.size12,
                                ),
                                borderSide: BorderSide(
                                  color: AppColorTheme.textSecondary.withValues(
                                    alpha: 0.2,
                                  ),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppCommonSize.size12,
                                ),
                                borderSide: BorderSide(
                                  color: AppColorTheme.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size8),
                          TextField(
                            controller: _reviewController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'Ürünle ilgili deneyimini paylaş',
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppCommonSize.size12,
                                ),
                                borderSide: BorderSide(
                                  color: AppColorTheme.textSecondary.withValues(
                                    alpha: 0.2,
                                  ),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppCommonSize.size12,
                                ),
                                borderSide: BorderSide(
                                  color: AppColorTheme.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fotoğraf Ekle',
                                style: TextStyle(
                                  fontSize: AppCommonSize.size18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColorTheme.textInverse,
                                ),
                              ),
                              SizedBox(height: AppCommonSize.size8),
                              Text(
                                'Satın almayı düşünenler için fotoğraf paylaş',
                                style: TextStyle(
                                  color: AppColorTheme.textSecondary,
                                ),
                              ),
                              SizedBox(height: AppCommonSize.size16),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      height: AppCommonSize.size96,
                                      width: AppCommonSize.size96,
                                      margin: EdgeInsets.only(
                                        right: AppCommonSize.size8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          AppCommonSize.size12,
                                        ),
                                        border: Border.all(
                                          color: AppColorTheme.textSecondary
                                              .withValues(alpha: 0.2),
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          // iMagae picker logic eklenebilir
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons
                                                  .add_photo_alternate_outlined,
                                              color: AppColorTheme.primaryColor,
                                              size: AppCommonSize.size32,
                                            ),
                                            SizedBox(
                                              height: AppCommonSize.size8,
                                            ),
                                            Text(
                                              "Fotoğraf Ekle",
                                              style: TextStyle(
                                                color:
                                                    AppColorTheme.primaryColor,
                                                fontSize: AppCommonSize.size12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    ..._selectedImages.map(
                                      (image) => _buildImagePreview(image),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppCommonSize.size24),
                          Container(
                            padding: EdgeInsets.all(AppCommonSize.size24),
                            decoration: BoxDecoration(
                              color: AppColorTheme.primaryColor.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(
                                AppCommonSize.size12,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: AppColorTheme.primaryColor,
                                    ),
                                    SizedBox(width: AppCommonSize.size8),
                                    Text(
                                      'Yorum Kuralları',
                                      style: TextStyle(
                                        fontSize: AppCommonSize.size16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColorTheme.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppCommonSize.size12),
                                _buildGuidelineItem(
                                  'Yorumunuz 20-500 karakter arasında olmalıdır.',
                                ),
                                _buildGuidelineItem(
                                  'Yorumunuzda reklam veya spam içeren bağlantılar olmamalıdır.',
                                ),
                                _buildGuidelineItem(
                                  'Yorumunuzda başka kullanıcıları hedef alan saldırgan veya hakaret içeren ifadeler olmamalıdır.',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppCommonSize.size96),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: SafeArea(
          child: GradientButton(text: 'Gönder', onPressed: () {}),
        ),
      ),
    );
  }
}
