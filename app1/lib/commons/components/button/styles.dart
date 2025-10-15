import 'package:flutter/material.dart';
import '../../constants/color_styles.dart';
import '../../constants/text_styles.dart';

/// 버튼 컴포넌트의 스타일 시스템
/// 
/// variant, size, theme에 따른 완전한 variant 시스템을 제공합니다.
/// - variant: 'primary' | 'secondary' | 'tertiary'
/// - size: 'small' | 'medium' | 'large'
/// - theme: 'light' | 'dark'
class ButtonStyles {
  // Private constructor to prevent instantiation
  ButtonStyles._();

  // ============================================================================
  // 버튼 Variant 정의
  // ============================================================================
  
  /// Primary 버튼 - 주요 액션용
  static const String primary = 'primary';
  
  /// Secondary 버튼 - 보조 액션용
  static const String secondary = 'secondary';
  
  /// Tertiary 버튼 - 텍스트 버튼용
  static const String tertiary = 'tertiary';

  // ============================================================================
  // 버튼 Size 정의
  // ============================================================================
  
  /// Small 버튼 - 작은 크기
  static const String small = 'small';
  
  /// Medium 버튼 - 중간 크기
  static const String medium = 'medium';
  
  /// Large 버튼 - 큰 크기
  static const String large = 'large';

  // ============================================================================
  // 버튼 Theme 정의
  // ============================================================================
  
  /// Light 테마
  static const String light = 'light';
  
  /// Dark 테마
  static const String dark = 'dark';

  // ============================================================================
  // Primary 버튼 스타일
  // ============================================================================
  
  /// Primary 버튼 배경색 (Light 테마)
  static const Color primaryLightBackground = ColorStyles.blue50;
  static const Color primaryLightBackgroundPressed = ColorStyles.blue60;
  static const Color primaryLightBackgroundDisabled = ColorStyles.gray30;
  
  /// Primary 버튼 배경색 (Dark 테마)
  static const Color primaryDarkBackground = ColorStyles.blue40;
  static const Color primaryDarkBackgroundPressed = ColorStyles.blue50;
  static const Color primaryDarkBackgroundDisabled = ColorStyles.gray70;
  
  /// Primary 버튼 텍스트 색상
  static const Color primaryTextColor = ColorStyles.white;
  static const Color primaryTextColorDisabled = ColorStyles.gray50;

  // ============================================================================
  // Secondary 버튼 스타일
  // ============================================================================
  
  /// Secondary 버튼 배경색 (Light 테마)
  static const Color secondaryLightBackground = ColorStyles.white;
  static const Color secondaryLightBackgroundPressed = ColorStyles.coolGray05;
  static const Color secondaryLightBackgroundDisabled = ColorStyles.gray05;
  
  /// Secondary 버튼 배경색 (Dark 테마)
  static const Color secondaryDarkBackground = ColorStyles.gray80;
  static const Color secondaryDarkBackgroundPressed = ColorStyles.gray70;
  static const Color secondaryDarkBackgroundDisabled = ColorStyles.gray90;
  
  /// Secondary 버튼 테두리 색상
  static const Color secondaryLightBorder = ColorStyles.blue50;
  static const Color secondaryDarkBorder = ColorStyles.blue40;
  static const Color secondaryBorderDisabled = ColorStyles.gray30;
  
  /// Secondary 버튼 텍스트 색상
  static const Color secondaryLightTextColor = ColorStyles.blue50;
  static const Color secondaryDarkTextColor = ColorStyles.blue40;
  static const Color secondaryTextColorDisabled = ColorStyles.gray50;

  // ============================================================================
  // Tertiary 버튼 스타일
  // ============================================================================
  
  /// Tertiary 버튼 배경색 (Light 테마)
  static const Color tertiaryLightBackground = Colors.transparent;
  static const Color tertiaryLightBackgroundPressed = ColorStyles.coolGray05;
  static const Color tertiaryLightBackgroundDisabled = Colors.transparent;
  
  /// Tertiary 버튼 배경색 (Dark 테마)
  static const Color tertiaryDarkBackground = Colors.transparent;
  static const Color tertiaryDarkBackgroundPressed = ColorStyles.gray80;
  static const Color tertiaryDarkBackgroundDisabled = Colors.transparent;
  
  /// Tertiary 버튼 텍스트 색상
  static const Color tertiaryLightTextColor = ColorStyles.blue50;
  static const Color tertiaryDarkTextColor = ColorStyles.blue40;
  static const Color tertiaryTextColorDisabled = ColorStyles.gray50;

  // ============================================================================
  // 버튼 크기별 스타일
  // ============================================================================
  
  /// Small 버튼 스타일
  static const double smallHeight = 32.0;
  static const double smallPaddingHorizontal = 12.0;
  static const double smallBorderRadius = 6.0;
  static const double smallBorderWidth = 1.0;
  static const TextStyle smallTextStyle = TextStyles.caption01;
  
  /// Medium 버튼 스타일
  static const double mediumHeight = 40.0;
  static const double mediumPaddingHorizontal = 16.0;
  static const double mediumBorderRadius = 8.0;
  static const double mediumBorderWidth = 1.0;
  static const TextStyle mediumTextStyle = TextStyles.body02Medium;
  
  /// Large 버튼 스타일
  static const double largeHeight = 48.0;
  static const double largePaddingHorizontal = 20.0;
  static const double largeBorderRadius = 8.0;
  static const double largeBorderWidth = 1.0;
  static const TextStyle largeTextStyle = TextStyles.body01;

  // ============================================================================
  // 스타일 헬퍼 메서드
  // ============================================================================
  
  /// 버튼 높이 반환
  static double getButtonHeight(String size) {
    switch (size) {
      case small:
        return smallHeight;
      case medium:
        return mediumHeight;
      case large:
        return largeHeight;
      default:
        return mediumHeight;
    }
  }
  
  /// 버튼 패딩 반환
  static double getButtonPadding(String size) {
    switch (size) {
      case small:
        return smallPaddingHorizontal;
      case medium:
        return mediumPaddingHorizontal;
      case large:
        return largePaddingHorizontal;
      default:
        return mediumPaddingHorizontal;
    }
  }
  
  /// 버튼 테두리 반지름 반환
  static double getButtonBorderRadius(String size) {
    switch (size) {
      case small:
        return smallBorderRadius;
      case medium:
        return mediumBorderRadius;
      case large:
        return largeBorderRadius;
      default:
        return mediumBorderRadius;
    }
  }
  
  /// 버튼 텍스트 스타일 반환
  static TextStyle getButtonTextStyle(String size) {
    switch (size) {
      case small:
        return smallTextStyle;
      case medium:
        return mediumTextStyle;
      case large:
        return largeTextStyle;
      default:
        return mediumTextStyle;
    }
  }
  
  /// Primary 버튼 배경색 반환
  static Color getPrimaryBackground(String theme, bool isPressed, bool isDisabled) {
    if (isDisabled) {
      return theme == dark ? primaryDarkBackgroundDisabled : primaryLightBackgroundDisabled;
    }
    
    if (isPressed) {
      return theme == dark ? primaryDarkBackgroundPressed : primaryLightBackgroundPressed;
    }
    
    return theme == dark ? primaryDarkBackground : primaryLightBackground;
  }
  
  /// Secondary 버튼 배경색 반환
  static Color getSecondaryBackground(String theme, bool isPressed, bool isDisabled) {
    if (isDisabled) {
      return theme == dark ? secondaryDarkBackgroundDisabled : secondaryLightBackgroundDisabled;
    }
    
    if (isPressed) {
      return theme == dark ? secondaryDarkBackgroundPressed : secondaryLightBackgroundPressed;
    }
    
    return theme == dark ? secondaryDarkBackground : secondaryLightBackground;
  }
  
  /// Tertiary 버튼 배경색 반환
  static Color getTertiaryBackground(String theme, bool isPressed, bool isDisabled) {
    if (isDisabled) {
      return tertiaryLightBackgroundDisabled;
    }
    
    if (isPressed) {
      return theme == dark ? tertiaryDarkBackgroundPressed : tertiaryLightBackgroundPressed;
    }
    
    return theme == dark ? tertiaryDarkBackground : tertiaryLightBackground;
  }
  
  /// Secondary 버튼 테두리 색상 반환
  static Color getSecondaryBorderColor(String theme, bool isDisabled) {
    if (isDisabled) {
      return secondaryBorderDisabled;
    }
    
    return theme == dark ? secondaryDarkBorder : secondaryLightBorder;
  }
  
  /// 버튼 텍스트 색상 반환
  static Color getButtonTextColor(String variant, String theme, bool isDisabled) {
    if (isDisabled) {
      switch (variant) {
        case primary:
          return primaryTextColorDisabled;
        case secondary:
          return secondaryTextColorDisabled;
        case tertiary:
          return tertiaryTextColorDisabled;
        default:
          return primaryTextColorDisabled;
      }
    }
    
    switch (variant) {
      case primary:
        return primaryTextColor;
      case secondary:
        return theme == dark ? secondaryDarkTextColor : secondaryLightTextColor;
      case tertiary:
        return theme == dark ? tertiaryDarkTextColor : tertiaryLightTextColor;
      default:
        return primaryTextColor;
    }
  }
}
