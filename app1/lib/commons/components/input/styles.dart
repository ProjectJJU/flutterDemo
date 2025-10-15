import 'package:flutter/material.dart';
import '../../constants/color_styles.dart';
import '../../constants/text_styles.dart';
import '../../constants/component_constants.dart';

// ============================================================================
// Input 컴포넌트 Enum 정의
// ============================================================================

/// Input variant 타입 (ComponentConstants 기반)
enum InputVariant {
  primary,
  secondary,
  tertiary,
}

/// Input size 타입 (ComponentConstants 기반)
enum InputSize {
  small,
  medium,
  large,
}

/// Input theme 타입 (ComponentConstants 기반)
enum InputThemeType {
  light,
  dark,
}

/// Input 컴포넌트의 모든 스타일을 관리하는 클래스
/// 
/// variant, size, theme에 따른 완전한 스타일 시스템을 제공합니다.
class InputStyles {
  // Private constructor to prevent instantiation
  InputStyles._();

  // ============================================================================
  // Input 상수 (ComponentConstants에서 상속)
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
  // Size별 높이 정의
  // ============================================================================
  
  /// Size별 높이 반환
  static double getHeight(InputSize size) {
    switch (size) {
      case InputSize.small:
        return 40.0;
      case InputSize.medium:
        return 48.0;
      case InputSize.large:
        return 56.0;
    }
  }

  /// Size별 패딩 반환
  static EdgeInsets getPadding(InputSize size) {
    switch (size) {
      case InputSize.small:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
      case InputSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
      case InputSize.large:
        return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);
    }
  }

  /// Size별 폰트 크기 반환
  static double getFontSize(InputSize size) {
    switch (size) {
      case InputSize.small:
        return 14.0;
      case InputSize.medium:
        return 16.0;
      case InputSize.large:
        return 18.0;
    }
  }

  // ============================================================================
  // Variant별 색상 정의
  // ============================================================================
  
  /// Primary variant 색상
  static InputColors getPrimaryColors(InputThemeType theme) {
    return theme == InputThemeType.light
        ? InputColors(
            border: ColorStyles.gray30,
            focusedBorder: ColorStyles.blue50,
            background: ColorStyles.white,
            text: ColorStyles.gray80,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray50,
          )
        : InputColors(
            border: ColorStyles.gray60,
            focusedBorder: ColorStyles.blue40,
            background: ColorStyles.gray90,
            text: ColorStyles.white,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray40,
          );
  }

  /// Secondary variant 색상
  static InputColors getSecondaryColors(InputThemeType theme) {
    return theme == InputThemeType.light
        ? InputColors(
            border: ColorStyles.gray20,
            focusedBorder: ColorStyles.blue30,
            background: ColorStyles.gray05,
            text: ColorStyles.gray70,
            hint: ColorStyles.gray50,
            icon: ColorStyles.gray40,
          )
        : InputColors(
            border: ColorStyles.gray70,
            focusedBorder: ColorStyles.blue30,
            background: ColorStyles.gray80,
            text: ColorStyles.gray10,
            hint: ColorStyles.gray50,
            icon: ColorStyles.gray50,
          );
  }

  /// Tertiary variant 색상
  static InputColors getTertiaryColors(InputThemeType theme) {
    return theme == InputThemeType.light
        ? InputColors(
            border: ColorStyles.gray10,
            focusedBorder: ColorStyles.blue20,
            background: ColorStyles.coolGray01,
            text: ColorStyles.gray60,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray30,
          )
        : InputColors(
            border: ColorStyles.gray80,
            focusedBorder: ColorStyles.blue20,
            background: ColorStyles.gray70,
            text: ColorStyles.gray20,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray30,
          );
  }

  // ============================================================================
  // 통합 스타일 메서드
  // ============================================================================
  
  /// Variant, Size, Theme에 따른 완전한 InputDecoration 반환
  static InputDecoration getDecoration({
    required InputVariant variant,
    required InputSize size,
    required InputThemeType theme,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isError = false,
  }) {
    final colors = _getColorsByVariant(variant, theme);
    final padding = getPadding(size);
    final fontSize = getFontSize(size);
    
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyles.body01Regular.copyWith(
        color: colors.hint,
        fontSize: fontSize,
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: colors.background,
      contentPadding: padding,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: isError ? ColorStyles.red30 : colors.border,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: isError ? ColorStyles.red30 : colors.border,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: isError ? ColorStyles.red30 : colors.focusedBorder,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: ColorStyles.red30,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: ColorStyles.red30,
          width: 2.0,
        ),
      ),
    );
  }

  /// Variant에 따른 색상 반환
  static InputColors _getColorsByVariant(InputVariant variant, InputThemeType theme) {
    switch (variant) {
      case InputVariant.primary:
        return getPrimaryColors(theme);
      case InputVariant.secondary:
        return getSecondaryColors(theme);
      case InputVariant.tertiary:
        return getTertiaryColors(theme);
    }
  }

  /// Size에 따른 TextStyle 반환
  static TextStyle getTextStyle(InputSize size, InputColors colors) {
    final fontSize = getFontSize(size);
    return TextStyles.body01Regular.copyWith(
      color: colors.text,
      fontSize: fontSize,
    );
  }

  /// Size에 따른 아이콘 크기 반환
  static double getIconSize(InputSize size) {
    switch (size) {
      case InputSize.small:
        return 16.0;
      case InputSize.medium:
        return 20.0;
      case InputSize.large:
        return 24.0;
    }
  }
}

/// Input 컴포넌트의 색상 정보를 담는 클래스
class InputColors {
  final Color border;
  final Color focusedBorder;
  final Color background;
  final Color text;
  final Color hint;
  final Color icon;

  const InputColors({
    required this.border,
    required this.focusedBorder,
    required this.background,
    required this.text,
    required this.hint,
    required this.icon,
  });
}
