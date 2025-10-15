import 'package:flutter/material.dart';
import '../../constants/color_styles.dart';
import '../../constants/text_styles.dart';

// ============================================================================
// SearchBar 컴포넌트 Enum 정의
// ============================================================================

/// SearchBar variant 타입
enum SearchBarVariant {
  primary,
  secondary,
  tertiary,
}

/// SearchBar size 타입
enum SearchBarSize {
  small,
  medium,
  large,
}

/// SearchBar theme 타입
enum SearchBarTheme {
  light,
  dark,
}

/// SearchBar 컴포넌트의 모든 스타일을 관리하는 클래스
/// 
/// variant, size, theme에 따른 완전한 스타일 시스템을 제공합니다.
class SearchBarStyles {
  // Private constructor to prevent instantiation
  SearchBarStyles._();

  // ============================================================================
  // Size별 높이 정의
  // ============================================================================
  
  /// Size별 높이 반환
  static double getHeight(SearchBarSize size) {
    switch (size) {
      case SearchBarSize.small:
        return 40.0;
      case SearchBarSize.medium:
        return 48.0;
      case SearchBarSize.large:
        return 56.0;
    }
  }

  /// Size별 패딩 반환
  static EdgeInsets getPadding(SearchBarSize size) {
    switch (size) {
      case SearchBarSize.small:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
      case SearchBarSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
      case SearchBarSize.large:
        return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);
    }
  }

  /// Size별 폰트 크기 반환
  static double getFontSize(SearchBarSize size) {
    switch (size) {
      case SearchBarSize.small:
        return 14.0;
      case SearchBarSize.medium:
        return 16.0;
      case SearchBarSize.large:
        return 18.0;
    }
  }

  // ============================================================================
  // Variant별 색상 정의
  // ============================================================================
  
  /// Primary variant 색상
  static SearchBarColors getPrimaryColors(SearchBarTheme theme) {
    return theme == SearchBarTheme.light
        ? SearchBarColors(
            border: ColorStyles.gray30,
            focusedBorder: ColorStyles.blue50,
            background: ColorStyles.white,
            text: ColorStyles.gray80,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray50,
          )
        : SearchBarColors(
            border: ColorStyles.gray60,
            focusedBorder: ColorStyles.blue40,
            background: ColorStyles.gray90,
            text: ColorStyles.white,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray40,
          );
  }

  /// Secondary variant 색상
  static SearchBarColors getSecondaryColors(SearchBarTheme theme) {
    return theme == SearchBarTheme.light
        ? SearchBarColors(
            border: ColorStyles.gray20,
            focusedBorder: ColorStyles.blue30,
            background: ColorStyles.gray05,
            text: ColorStyles.gray70,
            hint: ColorStyles.gray50,
            icon: ColorStyles.gray40,
          )
        : SearchBarColors(
            border: ColorStyles.gray70,
            focusedBorder: ColorStyles.blue30,
            background: ColorStyles.gray80,
            text: ColorStyles.gray10,
            hint: ColorStyles.gray50,
            icon: ColorStyles.gray50,
          );
  }

  /// Tertiary variant 색상
  static SearchBarColors getTertiaryColors(SearchBarTheme theme) {
    return theme == SearchBarTheme.light
        ? SearchBarColors(
            border: ColorStyles.gray10,
            focusedBorder: ColorStyles.blue20,
            background: ColorStyles.coolGray01,
            text: ColorStyles.gray60,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray30,
          )
        : SearchBarColors(
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
    required SearchBarVariant variant,
    required SearchBarSize size,
    required SearchBarTheme theme,
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
  static SearchBarColors _getColorsByVariant(SearchBarVariant variant, SearchBarTheme theme) {
    switch (variant) {
      case SearchBarVariant.primary:
        return getPrimaryColors(theme);
      case SearchBarVariant.secondary:
        return getSecondaryColors(theme);
      case SearchBarVariant.tertiary:
        return getTertiaryColors(theme);
    }
  }

  /// Size에 따른 TextStyle 반환
  static TextStyle getTextStyle(SearchBarSize size, SearchBarColors colors) {
    final fontSize = getFontSize(size);
    return TextStyles.body01Regular.copyWith(
      color: colors.text,
      fontSize: fontSize,
    );
  }

  /// Size에 따른 아이콘 크기 반환
  static double getIconSize(SearchBarSize size) {
    switch (size) {
      case SearchBarSize.small:
        return 16.0;
      case SearchBarSize.medium:
        return 20.0;
      case SearchBarSize.large:
        return 24.0;
    }
  }
}

/// SearchBar 컴포넌트의 색상 정보를 담는 클래스
class SearchBarColors {
  final Color border;
  final Color focusedBorder;
  final Color background;
  final Color text;
  final Color hint;
  final Color icon;

  const SearchBarColors({
    required this.border,
    required this.focusedBorder,
    required this.background,
    required this.text,
    required this.hint,
    required this.icon,
  });
}
