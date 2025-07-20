import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  // Font Family
  static const String primaryFont = 'Inter';
  static const String secondaryFont = 'Roboto';
  static const String displayFont = 'Poppins';

  // Başlık Stilleri (Heading Styles)
  static const TextStyle h1 = TextStyle(
    
    fontFamily: displayFont,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColorTheme.textPrimary,
  );
static const TextStyle h11 = TextStyle(
    
    fontFamily: displayFont,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColorTheme.primaryColor,
  );
  static const TextStyle h2 = TextStyle(
    
    fontFamily: displayFont,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: -0.3,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: displayFont,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.2,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.5,
    color: AppColorTheme.textPrimary,
  );
    static const TextStyle h66 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.5,
    color: AppColorTheme.textSecondary,
  );

  // Gövde Metni (Body Text)
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 0.15,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.25,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.4,
    color: AppColorTheme.textSecondary,
  );

  // Etiket ve Buton Stilleri (Label & Button Styles)
  static const TextStyle labelLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.1,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.5,
    color: AppColorTheme.textSecondary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.5,
    color: AppColorTheme.textTertiary,
  );

  // Buton Stilleri (Button Styles)
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColorTheme.buttonText,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColorTheme.buttonText,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColorTheme.buttonText,
  );

  // E-ticaret Özel Stiller (E-commerce Specific Styles)
  
  // Ürün Adı Stilleri
  static const TextStyle productTitleLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle productTitleMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle productTitleSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
    color: AppColorTheme.textPrimary,
  );

  // Fiyat Stilleri
  static const TextStyle priceLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0,
    color: AppColorTheme.priceColor,
  );

  static const TextStyle priceMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0,
    color: AppColorTheme.priceColor,
  );

  static const TextStyle priceSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
    color: AppColorTheme.priceColor,
  );

  // İndirimli Fiyat Stilleri
  static const TextStyle originalPrice = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
    color: AppColorTheme.textTertiary,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColorTheme.textTertiary,
  );

  static const TextStyle discountPrice = TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0,
    color: AppColorTheme.discountColor,
  );

  // İndirim Etiketi
  static const TextStyle discountBadge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0.5,
    color: Colors.white,
  );

  // Kategori Stilleri
  static const TextStyle categoryTitle = TextStyle(
    fontFamily: displayFont,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.1,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle categorySubtitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.25,
    color: AppColorTheme.textSecondary,
  );

  // Rating ve Yorum Stilleri
  static const TextStyle ratingText = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.1,
    color: AppColorTheme.textSecondary,
  );

  static const TextStyle reviewCount = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.4,
    color: AppColorTheme.textTertiary,
  );

  // Form ve Input Stilleri
  static const TextStyle inputLabel = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.1,
    color: AppColorTheme.textSecondary,
  );

  static const TextStyle inputText = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.15,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle inputHint = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.15,
    color: AppColorTheme.textTertiary,
  );

  static const TextStyle inputError = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.4,
    color: AppColorTheme.errorColor,
  );

  // Navigasyon ve Tab Stilleri
  static const TextStyle tabLabel = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColorTheme.textSecondary,
  );

  static const TextStyle tabLabelActive = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColorTheme.primaryColor,
  );

  static const TextStyle navLabel = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColorTheme.textTertiary,
  );

  static const TextStyle navLabelActive = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColorTheme.primaryColor,
  );

  // Bildirim ve Badge Stilleri
  static const TextStyle notificationTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
    color: AppColorTheme.textPrimary,
  );

  static const TextStyle notificationBody = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.25,
    color: AppColorTheme.textSecondary,
  );

  static const TextStyle badgeText = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0.5,
    color: Colors.white,
  );

  // Özel Durumlar (Special Cases)
  static const TextStyle soldOut = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.1,
    color: AppColorTheme.soldOutColor,
  );

  static const TextStyle newArrival = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColorTheme.newArrivalColor,
  );

  static const TextStyle freeShipping = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.5,
    color: AppColorTheme.successColor,
  );

  // Koyu Tema Stilleri (Dark Theme Variants)
  static TextStyle h1Dark = h1.copyWith(color: AppColorTheme.darkTextPrimary);
  static TextStyle h2Dark = h2.copyWith(color: AppColorTheme.darkTextPrimary);
  static TextStyle h3Dark = h3.copyWith(color: AppColorTheme.darkTextPrimary);
  static TextStyle bodyLargeDark = bodyLarge.copyWith(color: AppColorTheme.darkTextPrimary);
  static TextStyle bodyMediumDark = bodyMedium.copyWith(color: AppColorTheme.darkTextSecondary);
  static TextStyle labelMediumDark = labelMedium.copyWith(color: AppColorTheme.darkTextSecondary);
}