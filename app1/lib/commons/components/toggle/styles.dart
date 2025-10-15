import 'package:flutter/material.dart';
import '../../constants/color_styles.dart';
import '../../constants/component_constants.dart';

/// 토글 컴포넌트의 스타일 시스템
/// 
/// variant, size, theme에 따른 완전한 variant 시스템을 제공합니다.
/// - variant: 'primary' | 'secondary' | 'tertiary'
/// - size: 'small' | 'medium' | 'large'
/// - theme: 'light' | 'dark'
class ToggleStyles {
  // Private constructor to prevent instantiation
  ToggleStyles._();

  // ============================================================================
  // 토글 상수 (ComponentConstants에서 상속)
  // ============================================================================
  
  /// Primary 토글 - 주요 토글용
  static const String primary = ComponentConstants.primary;
  
  /// Secondary 토글 - 보조 토글용
  static const String secondary = ComponentConstants.secondary;
  
  /// Tertiary 토글 - 텍스트 토글용
  static const String tertiary = ComponentConstants.tertiary;

  /// Small 토글 - 작은 크기
  static const String small = ComponentConstants.small;
  
  /// Medium 토글 - 중간 크기
  static const String medium = ComponentConstants.medium;
  
  /// Large 토글 - 큰 크기
  static const String large = ComponentConstants.large;

  /// Light 테마
  static const String light = ComponentConstants.light;
  
  /// Dark 테마
  static const String dark = ComponentConstants.dark;

  // ============================================================================
  // Primary 토글 스타일
  // ============================================================================
  
  /// Primary 토글 배경색 (켜짐 상태, Light 테마)
  static const Color primaryLightOnBackground = ColorStyles.blue50;
  static const Color primaryLightOnBackgroundPressed = ColorStyles.blue60;
  static const Color primaryLightOnBackgroundDisabled = ColorStyles.gray30;
  
  /// Primary 토글 배경색 (꺼짐 상태, Light 테마)
  static const Color primaryLightOffBackground = ColorStyles.gray10;
  static const Color primaryLightOffBackgroundPressed = ColorStyles.gray20;
  static const Color primaryLightOffBackgroundDisabled = ColorStyles.gray05;
  
  /// Primary 토글 배경색 (켜짐 상태, Dark 테마)
  static const Color primaryDarkOnBackground = ColorStyles.blue40;
  static const Color primaryDarkOnBackgroundPressed = ColorStyles.blue50;
  static const Color primaryDarkOnBackgroundDisabled = ColorStyles.gray70;
  
  /// Primary 토글 배경색 (꺼짐 상태, Dark 테마)
  static const Color primaryDarkOffBackground = ColorStyles.gray80;
  static const Color primaryDarkOffBackgroundPressed = ColorStyles.gray70;
  static const Color primaryDarkOffBackgroundDisabled = ColorStyles.gray90;
  
  /// Primary 토글 핸들 색상
  static const Color primaryHandleColor = ColorStyles.white;
  static const Color primaryHandleColorDisabled = ColorStyles.gray50;

  // ============================================================================
  // Secondary 토글 스타일
  // ============================================================================
  
  /// Secondary 토글 배경색 (켜짐 상태, Light 테마)
  static const Color secondaryLightOnBackground = ColorStyles.blue20;
  static const Color secondaryLightOnBackgroundPressed = ColorStyles.blue30;
  static const Color secondaryLightOnBackgroundDisabled = ColorStyles.gray20;
  
  /// Secondary 토글 배경색 (꺼짐 상태, Light 테마)
  static const Color secondaryLightOffBackground = ColorStyles.gray20;
  static const Color secondaryLightOffBackgroundPressed = ColorStyles.gray30;
  static const Color secondaryLightOffBackgroundDisabled = ColorStyles.gray10;
  
  /// Secondary 토글 배경색 (켜짐 상태, Dark 테마)
  static const Color secondaryDarkOnBackground = ColorStyles.blue80;
  static const Color secondaryDarkOnBackgroundPressed = ColorStyles.blue70;
  static const Color secondaryDarkOnBackgroundDisabled = ColorStyles.gray60;
  
  /// Secondary 토글 배경색 (꺼짐 상태, Dark 테마)
  static const Color secondaryDarkOffBackground = ColorStyles.gray60;
  static const Color secondaryDarkOffBackgroundPressed = ColorStyles.gray70;
  static const Color secondaryDarkOffBackgroundDisabled = ColorStyles.gray80;
  
  /// Secondary 토글 핸들 색상
  static const Color secondaryLightHandleColor = ColorStyles.blue50;
  static const Color secondaryDarkHandleColor = ColorStyles.blue40;
  static const Color secondaryHandleColorDisabled = ColorStyles.gray50;

  // ============================================================================
  // Tertiary 토글 스타일
  // ============================================================================
  
  /// Tertiary 토글 배경색 (켜짐 상태, Light 테마)
  static const Color tertiaryLightOnBackground = ColorStyles.coolGray20;
  static const Color tertiaryLightOnBackgroundPressed = ColorStyles.coolGray30;
  static const Color tertiaryLightOnBackgroundDisabled = ColorStyles.gray20;
  
  /// Tertiary 토글 배경색 (꺼짐 상태, Light 테마)
  static const Color tertiaryLightOffBackground = ColorStyles.coolGray10;
  static const Color tertiaryLightOffBackgroundPressed = ColorStyles.coolGray20;
  static const Color tertiaryLightOffBackgroundDisabled = ColorStyles.gray10;
  
  /// Tertiary 토글 배경색 (켜짐 상태, Dark 테마)
  static const Color tertiaryDarkOnBackground = ColorStyles.coolGray50;
  static const Color tertiaryDarkOnBackgroundPressed = ColorStyles.coolGray40;
  static const Color tertiaryDarkOnBackgroundDisabled = ColorStyles.gray60;
  
  /// Tertiary 토글 배경색 (꺼짐 상태, Dark 테마)
  static const Color tertiaryDarkOffBackground = ColorStyles.coolGray60;
  static const Color tertiaryDarkOffBackgroundPressed = ColorStyles.coolGray50;
  static const Color tertiaryDarkOffBackgroundDisabled = ColorStyles.gray80;
  
  /// Tertiary 토글 핸들 색상
  static const Color tertiaryLightHandleColor = ColorStyles.coolGray50;
  static const Color tertiaryDarkHandleColor = ColorStyles.coolGray40;
  static const Color tertiaryHandleColorDisabled = ColorStyles.gray50;

  // ============================================================================
  // 토글 크기별 스타일
  // ============================================================================
  
  /// Small 토글 스타일
  static const double smallWidth = 40.0;
  static const double smallHeight = 24.0;
  static const double smallHandleSize = 20.0;
  static const double smallHandleMargin = 2.0;
  static const double smallBorderRadius = 12.0;
  
  /// Medium 토글 스타일
  static const double mediumWidth = 58.0;
  static const double mediumHeight = 32.0;
  static const double mediumHandleSize = 24.0;
  static const double mediumHandleMargin = 4.0;
  static const double mediumBorderRadius = 16.0;
  
  /// Large 토글 스타일
  static const double largeWidth = 76.0;
  static const double largeHeight = 40.0;
  static const double largeHandleSize = 32.0;
  static const double largeHandleMargin = 4.0;
  static const double largeBorderRadius = 20.0;

  // ============================================================================
  // 토글 애니메이션 설정
  // ============================================================================
  
  /// 토글 애니메이션 지속시간
  static const Duration animationDuration = Duration(milliseconds: 200);
  
  /// 토글 애니메이션 커브
  static const Curve animationCurve = Curves.easeInOut;

  // ============================================================================
  // 스타일 헬퍼 메서드
  // ============================================================================
  
  /// 토글 너비 반환
  static double getToggleWidth(String size) {
    switch (size) {
      case small:
        return smallWidth;
      case medium:
        return mediumWidth;
      case large:
        return largeWidth;
      default:
        return mediumWidth;
    }
  }
  
  /// 토글 높이 반환
  static double getToggleHeight(String size) {
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
  
  /// 토글 핸들 크기 반환
  static double getHandleSize(String size) {
    switch (size) {
      case small:
        return smallHandleSize;
      case medium:
        return mediumHandleSize;
      case large:
        return largeHandleSize;
      default:
        return mediumHandleSize;
    }
  }
  
  /// 토글 핸들 여백 반환
  static double getHandleMargin(String size) {
    switch (size) {
      case small:
        return smallHandleMargin;
      case medium:
        return mediumHandleMargin;
      case large:
        return largeHandleMargin;
      default:
        return mediumHandleMargin;
    }
  }
  
  /// 토글 테두리 반지름 반환
  static double getToggleBorderRadius(String size) {
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
  
  /// Primary 토글 배경색 반환
  static Color getPrimaryBackground(String theme, bool isOn, bool isPressed, bool isDisabled) {
    if (isDisabled) {
      return isOn 
        ? (theme == dark ? primaryDarkOnBackgroundDisabled : primaryLightOnBackgroundDisabled)
        : (theme == dark ? primaryDarkOffBackgroundDisabled : primaryLightOffBackgroundDisabled);
    }
    
    if (isPressed) {
      return isOn 
        ? (theme == dark ? primaryDarkOnBackgroundPressed : primaryLightOnBackgroundPressed)
        : (theme == dark ? primaryDarkOffBackgroundPressed : primaryLightOffBackgroundPressed);
    }
    
    return isOn 
      ? (theme == dark ? primaryDarkOnBackground : primaryLightOnBackground)
      : (theme == dark ? primaryDarkOffBackground : primaryLightOffBackground);
  }
  
  /// Secondary 토글 배경색 반환
  static Color getSecondaryBackground(String theme, bool isOn, bool isPressed, bool isDisabled) {
    if (isDisabled) {
      return isOn 
        ? (theme == dark ? secondaryDarkOnBackgroundDisabled : secondaryLightOnBackgroundDisabled)
        : (theme == dark ? secondaryDarkOffBackgroundDisabled : secondaryLightOffBackgroundDisabled);
    }
    
    if (isPressed) {
      return isOn 
        ? (theme == dark ? secondaryDarkOnBackgroundPressed : secondaryLightOnBackgroundPressed)
        : (theme == dark ? secondaryDarkOffBackgroundPressed : secondaryLightOffBackgroundPressed);
    }
    
    return isOn 
      ? (theme == dark ? secondaryDarkOnBackground : secondaryLightOnBackground)
      : (theme == dark ? secondaryDarkOffBackground : secondaryLightOffBackground);
  }
  
  /// Tertiary 토글 배경색 반환
  static Color getTertiaryBackground(String theme, bool isOn, bool isPressed, bool isDisabled) {
    if (isDisabled) {
      return isOn 
        ? (theme == dark ? tertiaryDarkOnBackgroundDisabled : tertiaryLightOnBackgroundDisabled)
        : (theme == dark ? tertiaryDarkOffBackgroundDisabled : tertiaryLightOffBackgroundDisabled);
    }
    
    if (isPressed) {
      return isOn 
        ? (theme == dark ? tertiaryDarkOnBackgroundPressed : tertiaryLightOnBackgroundPressed)
        : (theme == dark ? tertiaryDarkOffBackgroundPressed : tertiaryLightOffBackgroundPressed);
    }
    
    return isOn 
      ? (theme == dark ? tertiaryDarkOnBackground : tertiaryLightOnBackground)
      : (theme == dark ? tertiaryDarkOffBackground : tertiaryLightOffBackground);
  }
  
  /// 토글 핸들 색상 반환
  static Color getHandleColor(String variant, String theme, bool isDisabled) {
    if (isDisabled) {
      return primaryHandleColorDisabled;
    }
    
    switch (variant) {
      case primary:
        return primaryHandleColor;
      case secondary:
        return theme == dark ? secondaryDarkHandleColor : secondaryLightHandleColor;
      case tertiary:
        return theme == dark ? tertiaryDarkHandleColor : tertiaryLightHandleColor;
      default:
        return primaryHandleColor;
    }
  }
  
  /// 토글 배경색 반환 (통합 메서드)
  static Color getToggleBackground(String variant, String theme, bool isOn, bool isPressed, bool isDisabled) {
    switch (variant) {
      case primary:
        return getPrimaryBackground(theme, isOn, isPressed, isDisabled);
      case secondary:
        return getSecondaryBackground(theme, isOn, isPressed, isDisabled);
      case tertiary:
        return getTertiaryBackground(theme, isOn, isPressed, isDisabled);
      default:
        return getPrimaryBackground(theme, isOn, isPressed, isDisabled);
    }
  }
}
