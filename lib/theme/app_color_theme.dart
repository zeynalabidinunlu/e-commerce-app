import 'package:flutter/material.dart';

class AppColorTheme {
  // Ana Renkler (Primary Colors)
  static const Color primaryColor = Color(0xFF071A35); // Koyu lacivert
  static const Color primaryDark = Color(0xFF051221);
  static const Color primaryLight = Color(0xFF0A2244);
  static const MaterialColor primarySwatch = MaterialColor(0xFF071A35, {
    50: Color(0xFFE1E7F0),
    100: Color(0xFFB4C4DA),
    200: Color(0xFF839DC1),
    300: Color(0xFF5275A8),
    400: Color(0xFF2D5695),
    500: Color(0xFF071A35),
    600: Color(0xFF061630),
    700: Color(0xFF051221),
    800: Color(0xFF040E1A),
    900: Color(0xFF020710),
  });

  // İkincil Renkler (Secondary Colors)
  static const Color secondaryColor = Color(0xFFEC4899); // Pembe vurgu
  static const Color secondaryDark = Color(0xFFDB2777);
  static const Color secondaryLight = Color(0xFFF472B6);

  // Aksan Renkleri (Accent Colors)
  static const Color accentColor = Color(0xFFFBBF24); // Altın sarısı
  static const Color accentDark = Color(0xFFF59E0B);
  static const Color accentLight = Color(0xFFFDE68A);

  // Nötr Renkler (Neutral Colors)
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color dividerColor = Color(0xFFE5E7EB);

  // Metin Renkleri (Text Colors)
  static const Color textPrimary = Color(0xFFFFFFFF); 
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textInverse = Color(0xFF111827);

  // Başarı ve Hata Renkleri (Success & Error Colors)
  static const Color successColor = Color(0xFF10B981);
  static const Color successDark = Color(0xFF059669);
  static const Color successLight = Color(0xFF6EE7B7);

  static const Color errorColor = Color(0xFFEF4444);
  static const Color errorDark = Color(0xFFDC2626);
  static const Color errorLight = Color(0xFFFCA5A5);

  static const Color warningColor = Color(0xFFF59E0B);
  static const Color warningDark = Color(0xFFD97706);
  static const Color warningLight = Color(0xFFFDE68A);

  static const Color infoColor = Color(0xFF3B82F6);
  static const Color infoDark = Color(0xFF2563EB);
  static const Color infoLight = Color(0xFF93C5FD);

  // Gri Tonları (Gray Scale)
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

  // E-ticaret Özel Renkleri
  static const Color priceColor = Color(0xFFDC2626); // Fiyat için kırmızı
  static const Color discountColor = Color(0xFF059669); // İndirim için yeşil
  static const Color soldOutColor = Color(0xFF6B7280); // Tükenen ürün için gri
  static const Color newArrivalColor = Color(0xFFEC4899); // Yeni ürün için pembe

  // Kategori Renkleri
  static const Color categoryMen = Color(0xFF1E40AF);
  static const Color categoryWomen = Color(0xFFDB2777);
  static const Color categoryKids = Color(0xFF059669);
  static const Color categoryAccessories = Color(0xFFF59E0B);
  static const Color categoryShoes = Color(0xFF7C3AED);

  // Rating ve Favori Renkleri
  static const Color starColor = Color(0xFFFBBF24);
  static const Color favoriteColor = Color(0xFFEF4444);
  static const Color favoriteInactive = Color(0xFFD1D5DB);

  // Buton Renkleri
  static const Color buttonPrimary = Color(0xFF071A35);
  static const Color buttonSecondary = Color(0xFFEC4899);
  static const Color buttonDisabled = Color(0xFFD1D5DB);
  static const Color buttonText = Color(0xFFFFFFFF);
  static const Color buttonTextSecondary = Color(0xFF374151);

  // Gölge Renkleri (Shadow Colors)
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowDark = Color(0x4D000000);

  // Overlay Renkleri
  static const Color overlayLight = Color(0x80FFFFFF);
  static const Color overlayDark = Color(0x80000000);

  // Border Renkleri
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderMedium = Color(0xFFD1D5DB);
  static const Color borderDark = Color(0xFF9CA3AF);

  // İnput Field Renkleri
  static const Color inputBackground = Color(0xFFF9FAFB);
  static const Color inputBorder = Color(0xFFD1D5DB);
  static const Color inputFocused = Color(0xFF071A35);
  static const Color inputError = Color(0xFFEF4444);

  // Gradient Renkleri
  static const List<Color> primaryGradient = [
    Color(0xFF071A35),
    Color(0xFF051221),
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFFF472B6),
    Color(0xFFEC4899),
  ];

  static const List<Color> successGradient = [
    Color(0xFF6EE7B7),
    Color(0xFF10B981),
  ];

  // Özel E-ticaret Gradient'leri
  static const List<Color> saleGradient = [
    Color(0xFFFDE68A),
    Color(0xFFFBBF24),
  ];

  static const List<Color> premiumGradient = [
    Color(0xFFDDD6FE),
    Color(0xFF8B5CF6),
  ];

  // Koyu Tema Renkleri (Dark Theme Colors)
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkCard = Color(0xFF334155);
  static const Color darkTextPrimary = Color(0xFFE2E8F0);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  static const Color darkBorder = Color(0xFF475569);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      primarySwatch: primarySwatch,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        error: errorColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: primaryColor,
      primarySwatch: primarySwatch,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: darkSurface,
        error: errorColor,
      ),
    );
  }
}