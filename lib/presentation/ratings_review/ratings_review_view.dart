import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class RatingsReviewView extends StatefulWidget {
  const RatingsReviewView({super.key});

  @override
  State<RatingsReviewView> createState() => _RatingsReviewViewState();
}

class _RatingsReviewViewState extends State<RatingsReviewView> {
  String _selectedFilter = "Tümü";
  final filters = ["Tümü", "5 ☆", "4 ☆", "3 ☆", "2 ☆", "1 ☆", "Fotoğraflı"];
  Widget _buildRatingBar(int rating) {
    final percentage =
        {5: 0.65, 4: 0.55, 3: 0.45, 2: 0.35, 1: 0.25}[rating] ?? 0.0;
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: AppCommonSize.size2),
      child: Row(
        children: [
          Text(
            rating.toString(),
            style: TextStyle(
              fontSize: AppCommonSize.size12,
              color: AppColorTheme.textSecondary,
            ),
          ),
          SizedBox(width: AppCommonSize.size8),
          Icon(
            Icons.star,
            color: AppColorTheme.warningColor,
            size: AppCommonSize.size14,
          ),
          SizedBox(width: AppCommonSize.size8),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: AppCommonSize.size4,
                  decoration: BoxDecoration(
                    color: AppColorTheme.textSecondary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(AppCommonSize.size2),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: percentage,
                  child: Container(
                    height: AppCommonSize.size4,
                    decoration: BoxDecoration(
                      color: AppColorTheme.warningColor,
                      borderRadius: BorderRadius.circular(AppCommonSize.size2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppCommonSize.size8),
          Text(
            "${(percentage * 100).toInt()}%",
            style: TextStyle(
              fontSize: AppCommonSize.size12,
              color: AppColorTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReactionButton(IconData icon, String count) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(AppCommonSize.size20),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppCommonSize.size12,
          vertical: AppCommonSize.size6,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColorTheme.textSecondary.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(AppCommonSize.size20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: AppCommonSize.size16,
              color: AppColorTheme.textSecondary,
            ),
            SizedBox(width: AppCommonSize.size4),
            Text(
              count,
              style: TextStyle(
                fontSize: AppCommonSize.size12,
                color: AppColorTheme.textSecondary,
              ),
            ),
          ],
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
                  'Yorumlar & \nDeğerlendirmeler',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
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
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                    color: AppColorTheme.textInverse,
                                    fontSize: AppCommonSize.size48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      index < 4 ? Icons.star : Icons.star_half,
                                      color: AppColorTheme.warningColor,
                                      size: AppCommonSize.size24,
                                    );
                                  }),
                                ),
                                SizedBox(height: AppCommonSize.size8),
                                Text(
                                  '123 Kişi değerlendirdi',
                                  style: TextStyle(
                                    color: AppColorTheme.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: List.generate(
                                5,
                                (index) => _buildRatingBar(5 - index),
                              ).reversed.toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppCommonSize.size16,
                  ),
                  child: Row(
                    children: filters.map((filter) {
                      final isSelected = _selectedFilter == filter;
                      return Padding(
                        padding: EdgeInsets.only(right: AppCommonSize.size8),
                        child: FilterChip(
                          selected: isSelected,
                          label: Text(
                            filter,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : AppColorTheme.textSecondary,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          onSelected: (selected) {
                            setState(() {
                              _selectedFilter = filter;
                            });
                          },
                          selectedColor: AppColorTheme.primaryColor,
                          checkmarkColor: Colors.white,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(AppCommonSize.size16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 5, (
                context,
                index,
              ) {
                return Container(
                  margin: EdgeInsets.only(bottom: AppCommonSize.size16),
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
                        children: [
                          CircleAvatar(
                            radius: AppCommonSize.size20,
                            backgroundColor: AppColorTheme.primaryColor,
                            child: Text(
                              'HB',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: AppCommonSize.size12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Haci Bayram',
                                  style: TextStyle(
                                    color: AppColorTheme.textInverse,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      Icons.star,
                                      size: AppCommonSize.size16,
                                      color: AppColorTheme.warningColor,
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '2 gün önce',
                                style: TextStyle(
                                  color: AppColorTheme.textSecondary,
                                ),
                              ),
                              Text(
                                'Onaylanmış',
                                style: TextStyle(
                                  color: AppColorTheme.successColor,
                                  fontSize: AppCommonSize.size12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: AppCommonSize.size12),
                      Text(
                        'Belkediğim gibi geldi , tercih edebilirsiniz.',
                        style: TextStyle(
                          color: AppColorTheme.textInverse,
                          fontWeight: FontWeight.bold,
                          fontSize: AppCommonSize.size16,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size8),
                      Text(
                        'Takım güzeldi çok uzun sürede gelmedi , beden standartları normaldı.',
                        style: TextStyle(
                          color: AppColorTheme.textSecondary,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size16),
                      SizedBox(
                        height: AppCommonSize.size80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                              width: AppCommonSize.size80,
                              margin: EdgeInsets.only(
                                right: AppCommonSize.size8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColorTheme.primaryColor.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppCommonSize.size8,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/clothes_V1.png',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: AppCommonSize.size16),
                      Row(
                        children: [
                          _buildReactionButton(
                            Icons.thumb_up_alt_outlined,
                            "24",
                          ),
                          SizedBox(width: AppCommonSize.size16),
                          _buildReactionButton(Icons.thumb_down_outlined, "4"),
                          Spacer(),
                          TextButton.icon(
                            icon: Icon(
                              Icons.flag_outlined,
                              color: AppColorTheme.errorColor,
                            ),
                            onPressed: () {},
                            label: Text('Raporla'),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColorTheme.errorColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Yorum Yap'),
        icon: Icon(Icons.rate_review_outlined),
      ),
    );
  }
}
