import 'package:flutter/material.dart';

class AppCommonSize {
  // ==============================================================================
  // TEMEL BOYUT SİSTEMİ (BASE SYSTEM)
  // ==============================================================================

  // Base unit (4px tabanlı sistem)
  static const double baseUnit = 4.0;

  // Temel boyut çarpanları
  static const double xxs = baseUnit * 0.5; // 2
  static const double xs = baseUnit * 1; // 4
  static const double sm = baseUnit * 2; // 8
  static const double md = baseUnit * 4; // 16
  static const double lg = baseUnit * 6; // 24
  static const double xl = baseUnit * 8; // 32
  static const double xxl = baseUnit * 12; // 48
  static const double xxxl = baseUnit * 16; // 64
  static const double xxxxl = baseUnit * 20; // 80

  // Eski sisteminizle uyumluluk için alias'lar
  static const double zero = 0.0;
  static const double tiny = xxs; // 2
  static const double xxxs = xs; // 4
  static const double small = sm * 1.5; // 12
  static const double medium = md; // 16
  static const double large = lg; // 24

  // Negatif değerler
  static const double negativeXs = -xs; // -4
  static const double negativeSm = -sm; // -8
  static const double negativeMd = -md; // -16
  static const double negativeLg = -lg; // -24
  static const double negativeXl = -xl; // -32
  static const double negativeXxl = -xxl; // -48
  static const double negativeXxxl = -xxxl; // -64

  // Genişletilmiş boyutlar (4'ün katları)
  static const double size2 = 2.0;
  static const double size4 = 4.0;
  static const double size6 = 6.0;
  static const double size8 = 8.0;
  static const double size10 = 10.0;
  static const double size12 = 12.0;
  static const double size14 = 14.0;
  static const double size16 = 16.0;
  static const double size18 = 18.0;
  static const double size20 = 20.0;
  static const double size24 = 24.0;
  static const double size28 = 28.0;
  static const double size32 = 32.0;
  static const double size36 = 36.0;
  static const double size40 = 40.0;
  static const double size44 = 44.0;
  static const double size48 = 48.0;
  static const double size52 = 52.0;
  static const double size56 = 56.0;
  static const double size60 = 60.0;
  static const double size64 = 64.0;
  static const double size72 = 72.0;
  static const double size80 = 80.0;
  static const double size96 = 96.0;
  static const double size112 = 112.0;
  static const double size128 = 128.0;
  static const double size160 = 160.0;
  static const double size192 = 192.0;
  static const double size256 = 256.0;
  static const double size320 = 320.0;
  static const double size384 = 384.0;

  // ==============================================================================
  // SPACING & PADDING
  // ==============================================================================

  // Padding boyutları
  static const double paddingXs = xs; // 4
  static const double paddingSm = sm; // 8
  static const double paddingMd = md; // 16
  static const double paddingLg = lg; // 24
  static const double paddingXl = xl; // 32
  static const double paddingXxl = xxl; // 48
  static const double paddingXxxl = xxxl; // 64

  // Eski sistem uyumluluğu
  static const double paddingTiny = xxs; // 2
  static const double paddingSmall = sm * 1.5; // 12
  static const double paddingMedium = md; // 16
  static const double paddingLarge = lg; // 24

  // Margin boyutları
  static const double marginXs = xs; // 4
  static const double marginSm = sm; // 8
  static const double marginMd = md; // 16
  static const double marginLg = lg; // 24
  static const double marginXl = xl; // 32
  static const double marginXxl = xxl; // 48
  static const double marginXxxl = xxxl; // 64

  // Eski sistem uyumluluğu
  static const double marginTiny = xxs; // 2
  static const double marginSmall = sm * 1.5; // 12
  static const double marginMedium = md; // 16
  static const double marginLarge = lg; // 24

  // Negatif margin değerleri
  static const double marginNegativeXs = -xs; // -4
  static const double marginNegativeSm = -sm; // -8
  static const double marginNegativeMd = -md; // -16
  static const double marginNegativeLg = -lg; // -24
  static const double marginNegativeXl = -xl; // -32

  // Gap boyutları
  static const double gapXs = xs; // 4
  static const double gapSm = sm; // 8
  static const double gapMd = md; // 16
  static const double gapLg = lg; // 24
  static const double gapXl = xl; // 32
  static const double gapXxl = xxl; // 48

  // Özel gap tanımları
  static const double extraSmallGap = gapXs; // 4
  static const double smallGap = gapSm; // 8
  static const double defaultGap = gapMd; // 16
  static const double allGap = defaultGap; // 16
  static const double horizontalGap = defaultGap; // 16
  static const double verticalGap = defaultGap; // 16
  static const double mediumGap = gapLg; // 24
  static const double largeGap = gapXl; // 32
  static const double extraLargeGap = gapXxl; // 48

  // Grid ve liste aralıkları
  static const double gridSpacingTiny = xs; // 4
  static const double gridSpacingSmall = sm; // 8
  static const double gridSpacingMedium = md; // 16
  static const double gridSpacingLarge = lg; // 24
  static const double gridSpacingXl = xl; // 32

  // ==============================================================================
  // BORDER RADIUS
  // ==============================================================================

  static const double radiusNone = 0.0;
  static const double radiusXs = xs; // 4
  static const double radiusSm = sm; // 8
  static const double radiusMd = md; // 16
  static const double radiusLg = lg; // 24
  static const double radiusXl = xl; // 32
  static const double radiusXxl = xxl; // 48
  static const double radiusXxxl = xxxl; // 64

  // Eski sistem uyumluluğu
  static const double radiusTiny = xxs; // 2
  static const double radiusSmall = 6.0; // 6
  static const double radiusMedium = sm; // 8
  static const double radiusLarge = 12.0; // 12
  static const double radiusRound = xl; // 32
  static const double radiusFull = 9999.0; // Tam yuvarlak

  // Özel border radius tanımları
  static const double defaultBorderRadius = radiusSm; // 8
  static const double smallBorderRadius = radiusXs; // 4
  static const double cardBorderRadius = radiusSm; // 8
  static const double buttonBorderRadius = radiusSm; // 8
  static const double elevatedButtonBorderRadius = 56; // Özel değer
  static const double inputBorderRadius = radiusSm; // 8
  static const double dialogBorderRadius = radiusMd; // 16
  static const double modalBorderRadius = radiusLg; // 24
  static const double modalRadiusTop = radiusMd; // 16
  static const double circularBorderRadius = 1000; // Tam yuvarlak

  // ==============================================================================
  // HEIGHTS & WIDTHS
  // ==============================================================================

  // Yükseklik boyutları
  static const double heightXs = baseUnit * 6; // 24
  static const double heightSm = baseUnit * 8; // 32
  static const double heightMd = baseUnit * 10; // 40
  static const double heightLg = baseUnit * 12; // 48
  static const double heightXl = baseUnit * 14; // 56
  static const double heightXxl = baseUnit * 16; // 64
  static const double heightXxxl = baseUnit * 20; // 80

  // Genişlik boyutları
  static const double widthXs = baseUnit * 6; // 24
  static const double widthSm = baseUnit * 8; // 32
  static const double widthMd = baseUnit * 10; // 40
  static const double widthLg = baseUnit * 12; // 48
  static const double widthXl = baseUnit * 14; // 56
  static const double widthXxl = baseUnit * 16; // 64
  static const double widthXxxl = baseUnit * 20; // 80

  // Buton boyutları
  static const double buttonHeightSmall = heightSm; // 32
  static const double buttonHeightMedium = heightMd; // 40
  static const double buttonHeightLarge = heightLg; // 48
  static const double buttonHeightXl = heightXl; // 56

  static const double buttonWidthSmall = baseUnit * 20; // 80
  static const double buttonWidthMedium = baseUnit * 30; // 120
  static const double buttonWidthLarge = baseUnit * 40; // 160
  static const double buttonWidthFull = double.infinity;
  static const double buttonMinWidth = baseUnit * 16; // 64

  // Input field boyutları
  static const double inputHeightSmall = baseUnit * 9; // 36
  static const double inputHeightMedium = baseUnit * 11; // 44
  static const double inputHeightLarge = baseUnit * 13; // 52
  static const double inputHeight = heightMd; // 40

  // UI component boyutları
  static const double appBarHeight = heightXl; // 56
  static const double tabBarHeight = heightLg; // 48
  static const double bottomNavHeight = heightXl; // 56
  static const double toolbarHeight = heightXl; // 56
  static const double listItemHeight = heightXl; // 56
  static const double chipHeight = heightSm; // 32
  static const double fabWidth = heightXl; // 56
  static const double switchHeight = heightXs; // 24
  static const double switchWidth = heightLg; // 48
  static const double sliderHeight = heightMd; // 40
  static const double progressBarHeight = baseUnit; // 4

  // ==============================================================================
  // ICON SIZES
  // ==============================================================================

  static const double iconXs = baseUnit * 3; // 12
  static const double iconSm = baseUnit * 4; // 16
  static const double iconMd = baseUnit * 5; // 20
  static const double iconLg = baseUnit * 6; // 24
  static const double iconXl = baseUnit * 7; // 28
  static const double iconXxl = baseUnit * 8; // 32
  static const double iconXxxl = baseUnit * 10; // 40
  static const double iconHuge = baseUnit * 12; // 48
  static const double iconGiant = baseUnit * 16; // 64

  // Eski sistem uyumluluğu
  static const double iconTiny = iconXs; // 12
  static const double iconSmall = iconSm; // 16
  static const double iconMedium = iconMd; // 20
  static const double iconLarge = iconLg; // 24

  // Özel icon tanımları
  static const double defaultIconSize = iconLg; // 24
  static const double smallIconSize = iconMd; // 20
  static const double largeIconSize = iconXxl; // 32
  static const double appBarIconSize = iconLg; // 24
  static const double buttonIconSize = iconMd; // 20
  static const double fabIconSize = iconLg; // 24
  static const double listIconSize = iconLg; // 24
  static const double chipIconSize = iconMd; // 20
  static const double tabIconSize = iconLg; // 24
  static const double drawerIconSize = iconLg; // 24
  static const double navigationIconSize = iconLg; // 24
  static const double avatarIconSize = iconXxl; // 32

  // ==============================================================================
  // AVATAR & PROFILE SIZES
  // ==============================================================================

  static const double avatarTiny = iconLg; // 24
  static const double avatarSmall = iconXxl; // 32
  static const double avatarMedium = iconXxxl; // 40
  static const double avatarLarge = iconHuge; // 48
  static const double avatarXl = iconGiant; // 64
  static const double avatarXxl = baseUnit * 20; // 80
  static const double avatarHuge = baseUnit * 24; // 96

  // ==============================================================================
  // PRODUCT & E-COMMERCE SIZES
  // ==============================================================================

  // Ürün kartı boyutları
  static const double productCardSmall = baseUnit * 30; // 120
  static const double productCardMedium = baseUnit * 40; // 160
  static const double productCardLarge = baseUnit * 50; // 200
  static const double productCardXl = baseUnit * 60; // 240

  // Ürün resmi boyutları
  static const double productImageSmall = baseUnit * 20; // 80
  static const double productImageMedium = baseUnit * 30; // 120
  static const double productImageLarge = baseUnit * 40; // 160
  static const double productImageXl = baseUnit * 50; // 200
  static const double productImageXxl = baseUnit * 60; // 240
  static const double productImageHero = baseUnit * 80; // 320

  // E-ticaret özel boyutları
  static const double cartIconBadge = baseUnit * 4.5; // 18
  static const double favoriteIconSize = iconLg; // 24
  static const double ratingStarSize = iconSm; // 16
  static const double searchBarHeight = baseUnit * 11; // 44
  static const double filterChipHeight = heightSm; // 32
  static const double categoryCardHeight = baseUnit * 30; // 120
  static const double bannerHeight = baseUnit * 45; // 180
  static const double productTileHeight = baseUnit * 70; // 280

  // Badge boyutları
  static const double badgeSmall = iconSm; // 16
  static const double badgeMedium = iconMd; // 20
  static const double badgeLarge = iconLg; // 24

  // Loading boyutları
  static const double loadingSmall = iconSm; // 16
  static const double loadingMedium = iconLg; // 24
  static const double loadingLarge = iconXxl; // 32

  // Progress boyutları
  static const double progressThin = xxs; // 2
  static const double progressMedium = xs; // 4
  static const double progressThick = 6.0; // 6

  // ==============================================================================
  // ELEVATION & SHADOWS
  // ==============================================================================

  static const double elevation0 = 0;
  static const double elevation1 = 1;
  static const double elevation2 = 2;
  static const double elevation3 = 3;
  static const double elevation4 = 4;
  static const double elevation6 = 6;
  static const double elevation8 = 8;
  static const double elevation12 = 12;
  static const double elevation16 = 16;
  static const double elevation24 = 24;

  // Eski sistem uyumluluğu
  static const double shadowNone = elevation0;
  static const double shadowXs = elevation1;
  static const double shadowSmall = elevation2;
  static const double shadowMedium = elevation4;
  static const double shadowLarge = elevation8;
  static const double shadowXl = elevation12;
  static const double shadowXxl = elevation16;
  static const double shadowXxxl = elevation24;

  // Card elevation boyutları
  static const double cardElevationLow = elevation2;
  static const double cardElevationMedium = elevation4;
  static const double cardElevationHigh = elevation8;
  static const double cardElevationMax = elevation16;

  // Özel elevation tanımları
  static const double cardElevation = elevation1;
  static const double buttonElevation = elevation2;
  static const double dialogElevation = elevation24;
  static const double modalElevation = elevation16;
  static const double appBarElevation = elevation4;
  static const double drawerElevation = elevation16;
  static const double snackBarElevation = elevation6;
  static const double fabElevation = elevation6;
  static const double menuElevation = elevation8;

  // ==============================================================================
  // DIVIDERS & BORDERS
  // ==============================================================================

  static const double dividerThin = 0.5;
  static const double dividerMedium = 1.0;
  static const double dividerThick = 2.0;
  static const double dividerExtraThick = 4.0;
  static const double dividerHeight = dividerMedium;

  static const double borderThin = 1.0;
  static const double borderMedium = 2.0;
  static const double borderThick = 3.0;
  static const double borderExtraThick = 4.0;

  // ==============================================================================
  // DIALOG & MODAL SIZES
  // ==============================================================================

  static const double dialogRadius = radiusSm * 1.5; // 12
  static const double dialogMaxWidth = baseUnit * 80; // 320
  static const double dialogMinWidth = baseUnit * 70; // 280

  // ==============================================================================
  // RESPONSIVE BREAKPOINTS
  // ==============================================================================

  static const double mobileBreakpoint = 480;
  static const double tabletBreakpoint = 768;
  static const double desktopBreakpoint = 1024;
  static const double largeDesktopBreakpoint = 1440;

  // Eski sistem uyumluluğu
  static const double mobileMax = tabletBreakpoint;
  static const double tabletMax = desktopBreakpoint;
  static const double desktopMin = desktopBreakpoint + 1;

  static const double mobileMaxWidth = baseUnit * 100; // 400
  static const double tabletMaxWidth = baseUnit * 192; // 768
  static const double desktopMaxWidth = baseUnit * 320; // 1280

  // ==============================================================================
  // ACCESSIBILITY
  // ==============================================================================

  static const double minTouchTarget = baseUnit * 11; // 44
  static const double recommendedTouchTarget = baseUnit * 12; // 48

  // ==============================================================================
  // ANIMATION & TIMING
  // ==============================================================================

  static const int animationFast = 150;
  static const int animationNormal = 300;
  static const int animationMedium = animationNormal;
  static const int animationSlow = 500;
  static const int animationVerySlow = 800;

  // ==============================================================================
  // OPACITY VALUES
  // ==============================================================================

  static const double opacityDisabled = 0.38;
  static const double opacityInactive = 0.54;
  static const double opacitySecondary = 0.74;
  static const double opacityPrimary = 0.87;
  static const double opacityFull = 1.0;

  // ==============================================================================
  // UTILITY METHODS
  // ==============================================================================

  // Responsive boyut hesaplama
  static double getResponsiveSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < tabletBreakpoint) {
      return mobile;
    } else if (screenWidth < desktopBreakpoint) {
      return tablet;
    } else {
      return desktop;
    }
  }

  // Dinamik gap hesaplama
  static double getDynamicGap(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < mobileBreakpoint) {
      return gapSm;
    } else if (screenWidth < tabletBreakpoint) {
      return gapMd;
    } else if (screenWidth < desktopBreakpoint) {
      return gapLg;
    } else {
      return gapXl;
    }
  }

  // Dinamik padding hesaplama
  static double getDynamicPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < mobileBreakpoint) {
      return paddingSm;
    } else if (screenWidth < tabletBreakpoint) {
      return paddingMd;
    } else if (screenWidth < desktopBreakpoint) {
      return paddingLg;
    } else {
      return paddingXl;
    }
  }

  // Dinamik border radius hesaplama
  static double getDynamicBorderRadius(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < mobileBreakpoint) {
      return radiusXs;
    } else if (screenWidth < tabletBreakpoint) {
      return radiusSm;
    } else {
      return radiusMd;
    }
  }

  // Cihaz tipi kontrolü
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < tabletBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= tabletBreakpoint && width < desktopBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  // Safe area padding
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  // Keyboard height
  static double getKeyboardHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  // ==============================================================================
  // COMMON PADDING PRESETS
  // ==============================================================================

  static const EdgeInsets paddingAllXs = EdgeInsets.all(paddingXs);
  static const EdgeInsets paddingAllSm = EdgeInsets.all(paddingSm);
  static const EdgeInsets paddingAllMd = EdgeInsets.all(paddingMd);
  static const EdgeInsets paddingAllLg = EdgeInsets.all(paddingLg);
  static const EdgeInsets paddingAllXl = EdgeInsets.all(paddingXl);

  static const EdgeInsets paddingHorizontalXs = EdgeInsets.symmetric(
    horizontal: paddingXs,
  );
  static const EdgeInsets paddingHorizontalSm = EdgeInsets.symmetric(
    horizontal: paddingSm,
  );
  static const EdgeInsets paddingHorizontalMd = EdgeInsets.symmetric(
    horizontal: paddingMd,
  );
  static const EdgeInsets paddingHorizontalLg = EdgeInsets.symmetric(
    horizontal: paddingLg,
  );
  static const EdgeInsets paddingHorizontalXl = EdgeInsets.symmetric(
    horizontal: paddingXl,
  );

  static const EdgeInsets paddingVerticalXs = EdgeInsets.symmetric(
    vertical: paddingXs,
  );
  static const EdgeInsets paddingVerticalSm = EdgeInsets.symmetric(
    vertical: paddingSm,
  );
  static const EdgeInsets paddingVerticalMd = EdgeInsets.symmetric(
    vertical: paddingMd,
  );
  static const EdgeInsets paddingVerticalLg = EdgeInsets.symmetric(
    vertical: paddingLg,
  );
  static const EdgeInsets paddingVerticalXl = EdgeInsets.symmetric(
    vertical: paddingXl,
  );

  // ==============================================================================
  // COMMON MARGIN PRESETS
  // ==============================================================================

  static const EdgeInsets marginAllXs = EdgeInsets.all(marginXs);
  static const EdgeInsets marginAllSm = EdgeInsets.all(marginSm);
  static const EdgeInsets marginAllMd = EdgeInsets.all(marginMd);
  static const EdgeInsets marginAllLg = EdgeInsets.all(marginLg);
  static const EdgeInsets marginAllXl = EdgeInsets.all(marginXl);

  static const EdgeInsets marginHorizontalXs = EdgeInsets.symmetric(
    horizontal: marginXs,
  );
  static const EdgeInsets marginHorizontalSm = EdgeInsets.symmetric(
    horizontal: marginSm,
  );
  static const EdgeInsets marginHorizontalMd = EdgeInsets.symmetric(
    horizontal: marginMd,
  );
  static const EdgeInsets marginHorizontalLg = EdgeInsets.symmetric(
    horizontal: marginLg,
  );
  static const EdgeInsets marginHorizontalXl = EdgeInsets.symmetric(
    horizontal: marginXl,
  );

  static const EdgeInsets marginVerticalXs = EdgeInsets.symmetric(
    vertical: marginXs,
  );
  static const EdgeInsets marginVerticalSm = EdgeInsets.symmetric(
    vertical: marginSm,
  );
  static const EdgeInsets marginVerticalMd = EdgeInsets.symmetric(
    vertical: marginMd,
  );
  static const EdgeInsets marginVerticalLg = EdgeInsets.symmetric(
    vertical: marginLg,
  );
  static const EdgeInsets marginVerticalXl = EdgeInsets.symmetric(
    vertical: marginXl,
  );

  // ==============================================================================
  // COMMON BORDER RADIUS PRESETS
  // ==============================================================================

  static const BorderRadius borderRadiusAllXs = BorderRadius.all(
    Radius.circular(radiusXs),
  );
  static const BorderRadius borderRadiusAllSm = BorderRadius.all(
    Radius.circular(radiusSm),
  );
  static const BorderRadius borderRadiusAllMd = BorderRadius.all(
    Radius.circular(radiusMd),
  );
  static const BorderRadius borderRadiusAllLg = BorderRadius.all(
    Radius.circular(radiusLg),
  );
  static const BorderRadius borderRadiusAllXl = BorderRadius.all(
    Radius.circular(radiusXl),
  );

  static const BorderRadius borderRadiusTopXs = BorderRadius.only(
    topLeft: Radius.circular(radiusXs),
    topRight: Radius.circular(radiusXs),
  );
  static const BorderRadius borderRadiusTopSm = BorderRadius.only(
    topLeft: Radius.circular(radiusSm),
    topRight: Radius.circular(radiusSm),
  );
  static const BorderRadius borderRadiusTopMd = BorderRadius.only(
    topLeft: Radius.circular(radiusMd),
    topRight: Radius.circular(radiusMd),
  );

  static const BorderRadius borderRadiusBottomXs = BorderRadius.only(
    bottomLeft: Radius.circular(radiusXs),
    bottomRight: Radius.circular(radiusXs),
  );
  static const BorderRadius borderRadiusBottomSm = BorderRadius.only(
    bottomLeft: Radius.circular(radiusSm),
    bottomRight: Radius.circular(radiusSm),
  );
  static const BorderRadius borderRadiusBottomMd = BorderRadius.only(
    bottomLeft: Radius.circular(radiusMd),
    bottomRight: Radius.circular(radiusMd),
  );

  // ==============================================================================
  // SIZED BOXES (Boşluk widget'ları)
  // ==============================================================================

  static const SizedBox gapXsVertical = SizedBox(height: gapXs);
  static const SizedBox gapSmVertical = SizedBox(height: gapSm);
  static const SizedBox gapMdVertical = SizedBox(height: gapMd);
  static const SizedBox gapLgVertical = SizedBox(height: gapLg);
  static const SizedBox gapXlVertical = SizedBox(height: gapXl);
  static const SizedBox gapXxlVertical = SizedBox(height: gapXxl);

  static const SizedBox gapXsHorizontal = SizedBox(width: gapXs);
  static const SizedBox gapSmHorizontal = SizedBox(width: gapSm);
  static const SizedBox gapMdHorizontal = SizedBox(width: gapMd);
  static const SizedBox gapLgHorizontal = SizedBox(width: gapLg);
  static const SizedBox gapXlHorizontal = SizedBox(width: gapXl);
  static const SizedBox gapXxlHorizontal = SizedBox(width: gapXxl);
}

// ==============================================================================
// EXTENSIONS
// ==============================================================================

extension ContextSizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isMobile => AppCommonSize.isMobile(this);
  bool get isTablet => AppCommonSize.isTablet(this);
  bool get isDesktop => AppCommonSize.isDesktop(this);

  double get dynamicGap => AppCommonSize.getDynamicGap(this);
  double get dynamicPadding => AppCommonSize.getDynamicPadding(this);
  double get dynamicBorderRadius => AppCommonSize.getDynamicBorderRadius(this);

  EdgeInsets get safeAreaPadding => AppCommonSize.getSafeAreaPadding(this);
  double get keyboardHeight => AppCommonSize.getKeyboardHeight(this);
}

extension DoubleExtension on double {
  SizedBox get verticalSpace => SizedBox(height: this);
  SizedBox get horizontalSpace => SizedBox(width: this);

  EdgeInsets get paddingAll => EdgeInsets.all(this);
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get marginAll => EdgeInsets.all(this);
  EdgeInsets get marginHorizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get marginVertical => EdgeInsets.symmetric(vertical: this);

  BorderRadius get borderRadiusAll => BorderRadius.all(Radius.circular(this));
  Radius get radius => Radius.circular(this);
}
