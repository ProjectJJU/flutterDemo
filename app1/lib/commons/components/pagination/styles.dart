import 'package:flutter/material.dart';
import '../../constants/color_styles.dart';
import '../../constants/text_styles.dart';
import '../../constants/component_constants.dart';

/// Pagination 컴포넌트 스타일 시스템
/// 
/// variant, size, theme에 따른 완전한 variant 시스템을 제공합니다.
/// - variant: 'primary' | 'secondary' | 'tertiary'
/// - size: 'small' | 'medium' | 'large'
/// - theme: 'light' | 'dark'
abstract class PaginationStyles {
  // Private constructor to prevent instantiation
  PaginationStyles._();

  // ============================================================================
  // Pagination 상수 (ComponentConstants에서 상속)
  // ============================================================================
  
  /// Primary variant
  static const String primary = ComponentConstants.primary;
  
  /// Secondary variant
  static const String secondary = ComponentConstants.secondary;
  
  /// Tertiary variant
  static const String tertiary = ComponentConstants.tertiary;

  /// Small size
  static const String small = ComponentConstants.small;
  
  /// Medium size
  static const String medium = ComponentConstants.medium;
  
  /// Large size
  static const String large = ComponentConstants.large;

  /// Light theme
  static const String light = ComponentConstants.light;
  
  /// Dark theme
  static const String dark = ComponentConstants.dark;

  // ============================================================================
  // Size별 크기 설정
  // ============================================================================
  
  /// 페이지 번호 버튼 크기 반환
  static double getPageButtonSize(String size) {
    switch (size) {
      case small:
        return 24.0;
      case medium:
        return 32.0;
      case large:
        return 40.0;
      default:
        return 32.0;
    }
  }

  /// 페이지 번호 버튼 패딩 반환
  static EdgeInsets getPageButtonPadding(String size) {
    switch (size) {
      case small:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case medium:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
      case large:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
      default:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
    }
  }

  /// 페이지 번호 버튼 간격 반환
  static double getPageButtonSpacing(String size) {
    switch (size) {
      case small:
        return 4.0;
      case medium:
        return 8.0;
      case large:
        return 12.0;
      default:
        return 8.0;
    }
  }

  /// 화살표 버튼 크기 반환
  static double getArrowButtonSize(String size) {
    switch (size) {
      case small:
        return 20.0;
      case medium:
        return 24.0;
      case large:
        return 28.0;
      default:
        return 24.0;
    }
  }

  /// 페이지 번호 버튼 테두리 반지름 반환
  static double getPageButtonBorderRadius(String size) {
    switch (size) {
      case small:
        return 4.0;
      case medium:
        return 8.0;
      case large:
        return 12.0;
      default:
        return 8.0;
    }
  }

  // ============================================================================
  // Primary Variant 색상
  // ============================================================================
  
  /// Primary 활성 페이지 배경색
  static Color getPrimaryActiveBackground(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.gray05; // #F2F2F2
      case dark:
        return ColorStyles.gray80; // #333333
      default:
        return ColorStyles.gray05;
    }
  }

  /// Primary 비활성 페이지 배경색
  static Color getPrimaryInactiveBackground(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.white; // #FFFFFF
      case dark:
        return ColorStyles.gray90; // #1C1C1C
      default:
        return ColorStyles.white;
    }
  }

  /// Primary 활성 페이지 텍스트 색상
  static Color getPrimaryActiveTextColor(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.black; // #000000
      case dark:
        return ColorStyles.white; // #FFFFFF
      default:
        return ColorStyles.black;
    }
  }

  /// Primary 비활성 페이지 텍스트 색상
  static Color getPrimaryInactiveTextColor(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.gray60; // #777777
      case dark:
        return ColorStyles.gray40; // #ABABAB
      default:
        return ColorStyles.gray60;
    }
  }

  /// Primary 화살표 색상
  static Color getPrimaryArrowColor(String theme, bool isDisabled) {
    if (isDisabled) {
      switch (theme) {
        case light:
          return ColorStyles.gray30; // #C7C7C7
        case dark:
          return ColorStyles.gray70; // #5F5F5F
        default:
          return ColorStyles.gray30;
      }
    }
    
    switch (theme) {
      case light:
        return ColorStyles.gray70; // #5F5F5F
      case dark:
        return ColorStyles.gray30; // #C7C7C7
      default:
        return ColorStyles.gray70;
    }
  }

  // ============================================================================
  // Secondary Variant 색상
  // ============================================================================
  
  /// Secondary 활성 페이지 배경색
  static Color getSecondaryActiveBackground(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.blue50; // #497CFF
      case dark:
        return ColorStyles.blue40; // #6DA5FA
      default:
        return ColorStyles.blue50;
    }
  }

  /// Secondary 비활성 페이지 배경색
  static Color getSecondaryInactiveBackground(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.white; // #FFFFFF
      case dark:
        return ColorStyles.gray90; // #1C1C1C
      default:
        return ColorStyles.white;
    }
  }

  /// Secondary 활성 페이지 텍스트 색상
  static Color getSecondaryActiveTextColor(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.white; // #FFFFFF
      case dark:
        return ColorStyles.white; // #FFFFFF
      default:
        return ColorStyles.white;
    }
  }

  /// Secondary 비활성 페이지 텍스트 색상
  static Color getSecondaryInactiveTextColor(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.gray60; // #777777
      case dark:
        return ColorStyles.gray40; // #ABABAB
      default:
        return ColorStyles.gray60;
    }
  }

  /// Secondary 화살표 색상
  static Color getSecondaryArrowColor(String theme, bool isDisabled) {
    if (isDisabled) {
      switch (theme) {
        case light:
          return ColorStyles.gray30; // #C7C7C7
        case dark:
          return ColorStyles.gray70; // #5F5F5F
        default:
          return ColorStyles.gray30;
      }
    }
    
    switch (theme) {
      case light:
        return ColorStyles.blue50; // #497CFF
      case dark:
        return ColorStyles.blue40; // #6DA5FA
      default:
        return ColorStyles.blue50;
    }
  }

  // ============================================================================
  // Tertiary Variant 색상
  // ============================================================================
  
  /// Tertiary 활성 페이지 배경색
  static Color getTertiaryActiveBackground(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.gray80; // #333333
      case dark:
        return ColorStyles.gray20; // #D4D3D3
      default:
        return ColorStyles.gray80;
    }
  }

  /// Tertiary 비활성 페이지 배경색
  static Color getTertiaryInactiveBackground(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.white; // #FFFFFF
      case dark:
        return ColorStyles.gray90; // #1C1C1C
      default:
        return ColorStyles.white;
    }
  }

  /// Tertiary 활성 페이지 텍스트 색상
  static Color getTertiaryActiveTextColor(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.white; // #FFFFFF
      case dark:
        return ColorStyles.black; // #000000
      default:
        return ColorStyles.white;
    }
  }

  /// Tertiary 비활성 페이지 텍스트 색상
  static Color getTertiaryInactiveTextColor(String theme) {
    switch (theme) {
      case light:
        return ColorStyles.gray60; // #777777
      case dark:
        return ColorStyles.gray40; // #ABABAB
      default:
        return ColorStyles.gray60;
    }
  }

  /// Tertiary 화살표 색상
  static Color getTertiaryArrowColor(String theme, bool isDisabled) {
    if (isDisabled) {
      switch (theme) {
        case light:
          return ColorStyles.gray30; // #C7C7C7
        case dark:
          return ColorStyles.gray70; // #5F5F5F
        default:
          return ColorStyles.gray30;
      }
    }
    
    switch (theme) {
      case light:
        return ColorStyles.gray80; // #333333
      case dark:
        return ColorStyles.gray20; // #D4D3D3
      default:
        return ColorStyles.gray80;
    }
  }

  // ============================================================================
  // 통합 색상 메서드
  // ============================================================================
  
  /// 활성 페이지 배경색 반환
  static Color getActiveBackground(String variant, String theme) {
    switch (variant) {
      case primary:
        return getPrimaryActiveBackground(theme);
      case secondary:
        return getSecondaryActiveBackground(theme);
      case tertiary:
        return getTertiaryActiveBackground(theme);
      default:
        return getPrimaryActiveBackground(theme);
    }
  }

  /// 비활성 페이지 배경색 반환
  static Color getInactiveBackground(String variant, String theme) {
    switch (variant) {
      case primary:
        return getPrimaryInactiveBackground(theme);
      case secondary:
        return getSecondaryInactiveBackground(theme);
      case tertiary:
        return getTertiaryInactiveBackground(theme);
      default:
        return getPrimaryInactiveBackground(theme);
    }
  }

  /// 활성 페이지 텍스트 색상 반환
  static Color getActiveTextColor(String variant, String theme) {
    switch (variant) {
      case primary:
        return getPrimaryActiveTextColor(theme);
      case secondary:
        return getSecondaryActiveTextColor(theme);
      case tertiary:
        return getTertiaryActiveTextColor(theme);
      default:
        return getPrimaryActiveTextColor(theme);
    }
  }

  /// 비활성 페이지 텍스트 색상 반환
  static Color getInactiveTextColor(String variant, String theme) {
    switch (variant) {
      case primary:
        return getPrimaryInactiveTextColor(theme);
      case secondary:
        return getSecondaryInactiveTextColor(theme);
      case tertiary:
        return getTertiaryInactiveTextColor(theme);
      default:
        return getPrimaryInactiveTextColor(theme);
    }
  }

  /// 화살표 색상 반환
  static Color getArrowColor(String variant, String theme, bool isDisabled) {
    switch (variant) {
      case primary:
        return getPrimaryArrowColor(theme, isDisabled);
      case secondary:
        return getSecondaryArrowColor(theme, isDisabled);
      case tertiary:
        return getTertiaryArrowColor(theme, isDisabled);
      default:
        return getPrimaryArrowColor(theme, isDisabled);
    }
  }

  // ============================================================================
  // 텍스트 스타일
  // ============================================================================
  
  /// 페이지 번호 텍스트 스타일 반환
  static TextStyle getPageNumberTextStyle(String size) {
    switch (size) {
      case small:
        return TextStyles.body03.copyWith(
          fontWeight: FontWeight.w500, // Medium
        );
      case medium:
        return TextStyles.body01.copyWith(
          fontWeight: FontWeight.w500, // Medium
        );
      case large:
        return TextStyles.title02.copyWith(
          fontWeight: FontWeight.w500, // Medium
        );
      default:
        return TextStyles.body01.copyWith(
          fontWeight: FontWeight.w500, // Medium
        );
    }
  }

  /// 활성 페이지 텍스트 스타일 반환
  static TextStyle getActivePageTextStyle(String size) {
    switch (size) {
      case small:
        return TextStyles.body03.copyWith(
          fontWeight: FontWeight.w500, // Medium
        );
      case medium:
        return TextStyles.body01.copyWith(
          fontWeight: FontWeight.w500, // Medium
        );
      case large:
        return TextStyles.title02.copyWith(
          fontWeight: FontWeight.w500, // Medium
        );
      default:
        return TextStyles.body01.copyWith(
          fontWeight: FontWeight.w500, // Medium
        );
    }
  }

  /// 비활성 페이지 텍스트 스타일 반환
  static TextStyle getInactivePageTextStyle(String size) {
    switch (size) {
      case small:
        return TextStyles.body03.copyWith(
          fontWeight: FontWeight.w400, // Regular
        );
      case medium:
        return TextStyles.body01.copyWith(
          fontWeight: FontWeight.w400, // Regular
        );
      case large:
        return TextStyles.title02.copyWith(
          fontWeight: FontWeight.w400, // Regular
        );
      default:
        return TextStyles.body01.copyWith(
          fontWeight: FontWeight.w400, // Regular
        );
    }
  }
}
