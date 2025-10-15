import 'package:flutter/material.dart';
import '../../constants/color_styles.dart';
import '../../constants/text_styles.dart';
import '../../constants/component_constants.dart';

/// SelectBox 컴포넌트의 스타일 시스템
/// 
/// variant, size, theme에 따른 완전한 variant 시스템을 제공합니다.
/// - variant: 'primary' | 'secondary' | 'tertiary'
/// - size: 'small' | 'medium' | 'large'
/// - theme: 'light' | 'dark'
class SelectBoxStyles {
  // Private constructor to prevent instantiation
  SelectBoxStyles._();

  // ============================================================================
  // SelectBox 상수 (ComponentConstants에서 상속)
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
  static double getHeight(String size) {
    switch (size) {
      case small:
        return 40.0;
      case medium:
        return 48.0;
      case large:
        return 56.0;
      default:
        return 48.0;
    }
  }

  /// Size별 패딩 반환
  static EdgeInsets getPadding(String size) {
    switch (size) {
      case small:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
      case medium:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
      case large:
        return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);
      default:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
    }
  }

  /// Size별 폰트 크기 반환
  static double getFontSize(String size) {
    switch (size) {
      case small:
        return 14.0;
      case medium:
        return 16.0;
      case large:
        return 18.0;
      default:
        return 16.0;
    }
  }

  /// Size별 아이콘 크기 반환
  static double getIconSize(String size) {
    switch (size) {
      case small:
        return 16.0;
      case medium:
        return 20.0;
      case large:
        return 24.0;
      default:
        return 20.0;
    }
  }

  // ============================================================================
  // Variant별 색상 정의
  // ============================================================================
  
  /// Primary variant 색상
  static SelectBoxColors getPrimaryColors(String theme) {
    return theme == dark
        ? SelectBoxColors(
            border: ColorStyles.gray60,
            focusedBorder: ColorStyles.blue40,
            background: ColorStyles.gray90,
            text: ColorStyles.white,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray40,
            dropdownBackground: ColorStyles.gray90,
            dropdownBorder: ColorStyles.gray60,
            itemBackground: ColorStyles.gray90,
            itemText: ColorStyles.white,
            itemHoverBackground: ColorStyles.gray80,
            selectedItemBackground: ColorStyles.green05,
            selectedItemText: ColorStyles.green30,
            selectedItemIcon: ColorStyles.green30,
          )
        : SelectBoxColors(
            border: ColorStyles.gray30,
            focusedBorder: ColorStyles.blue50,
            background: ColorStyles.white,
            text: ColorStyles.gray80,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray50,
            dropdownBackground: ColorStyles.white,
            dropdownBorder: ColorStyles.gray30,
            itemBackground: ColorStyles.white,
            itemText: ColorStyles.gray70,
            itemHoverBackground: ColorStyles.coolGray05,
            selectedItemBackground: ColorStyles.green05,
            selectedItemText: ColorStyles.green30,
            selectedItemIcon: ColorStyles.green30,
          );
  }

  /// Secondary variant 색상
  static SelectBoxColors getSecondaryColors(String theme) {
    return theme == dark
        ? SelectBoxColors(
            border: ColorStyles.gray70,
            focusedBorder: ColorStyles.blue30,
            background: ColorStyles.gray80,
            text: ColorStyles.gray10,
            hint: ColorStyles.gray50,
            icon: ColorStyles.gray50,
            dropdownBackground: ColorStyles.gray80,
            dropdownBorder: ColorStyles.gray70,
            itemBackground: ColorStyles.gray80,
            itemText: ColorStyles.gray20,
            itemHoverBackground: ColorStyles.gray70,
            selectedItemBackground: ColorStyles.green05,
            selectedItemText: ColorStyles.green30,
            selectedItemIcon: ColorStyles.green30,
          )
        : SelectBoxColors(
            border: ColorStyles.gray20,
            focusedBorder: ColorStyles.blue30,
            background: ColorStyles.gray05,
            text: ColorStyles.gray70,
            hint: ColorStyles.gray50,
            icon: ColorStyles.gray40,
            dropdownBackground: ColorStyles.gray05,
            dropdownBorder: ColorStyles.gray20,
            itemBackground: ColorStyles.gray05,
            itemText: ColorStyles.gray60,
            itemHoverBackground: ColorStyles.coolGray10,
            selectedItemBackground: ColorStyles.green05,
            selectedItemText: ColorStyles.green30,
            selectedItemIcon: ColorStyles.green30,
          );
  }

  /// Tertiary variant 색상
  static SelectBoxColors getTertiaryColors(String theme) {
    return theme == dark
        ? SelectBoxColors(
            border: ColorStyles.gray80,
            focusedBorder: ColorStyles.blue20,
            background: ColorStyles.gray70,
            text: ColorStyles.gray20,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray30,
            dropdownBackground: ColorStyles.gray70,
            dropdownBorder: ColorStyles.gray80,
            itemBackground: ColorStyles.gray70,
            itemText: ColorStyles.gray30,
            itemHoverBackground: ColorStyles.gray60,
            selectedItemBackground: ColorStyles.green05,
            selectedItemText: ColorStyles.green30,
            selectedItemIcon: ColorStyles.green30,
          )
        : SelectBoxColors(
            border: ColorStyles.gray10,
            focusedBorder: ColorStyles.blue20,
            background: ColorStyles.coolGray01,
            text: ColorStyles.gray60,
            hint: ColorStyles.gray40,
            icon: ColorStyles.gray30,
            dropdownBackground: ColorStyles.coolGray01,
            dropdownBorder: ColorStyles.gray10,
            itemBackground: ColorStyles.coolGray01,
            itemText: ColorStyles.gray50,
            itemHoverBackground: ColorStyles.coolGray05,
            selectedItemBackground: ColorStyles.green05,
            selectedItemText: ColorStyles.green30,
            selectedItemIcon: ColorStyles.green30,
          );
  }

  // ============================================================================
  // 통합 스타일 메서드
  // ============================================================================
  
  /// Variant, Size, Theme에 따른 완전한 SelectBox 스타일 반환
  static SelectBoxStyle getStyle({
    required String variant,
    required String size,
    required String theme,
    String? hintText,
    bool isError = false,
    bool isDisabled = false,
  }) {
    final colors = _getColorsByVariant(variant, theme);
    final padding = getPadding(size);
    final fontSize = getFontSize(size);
    final iconSize = getIconSize(size);
    
    return SelectBoxStyle(
      colors: colors,
      padding: padding,
      fontSize: fontSize,
      iconSize: iconSize,
      borderRadius: 8.0,
      borderWidth: 1.0,
      focusedBorderWidth: 2.0,
      hintText: hintText,
      isError: isError,
      isDisabled: isDisabled,
    );
  }

  /// Variant에 따른 색상 반환
  static SelectBoxColors _getColorsByVariant(String variant, String theme) {
    switch (variant) {
      case primary:
        return getPrimaryColors(theme);
      case secondary:
        return getSecondaryColors(theme);
      case tertiary:
        return getTertiaryColors(theme);
      default:
        return getPrimaryColors(theme);
    }
  }

  /// Size에 따른 TextStyle 반환
  static TextStyle getTextStyle(String size, SelectBoxColors colors) {
    final fontSize = getFontSize(size);
    return TextStyles.body01Regular.copyWith(
      color: colors.text,
      fontSize: fontSize,
    );
  }

  /// Size에 따른 HintTextStyle 반환
  static TextStyle getHintTextStyle(String size, SelectBoxColors colors) {
    final fontSize = getFontSize(size);
    return TextStyles.body01Regular.copyWith(
      color: colors.hint,
      fontSize: fontSize,
    );
  }

  /// Size에 따른 ItemTextStyle 반환
  static TextStyle getItemTextStyle(String size, SelectBoxColors colors) {
    final fontSize = getFontSize(size);
    return TextStyles.body01Regular.copyWith(
      color: colors.itemText,
      fontSize: fontSize,
    );
  }

  /// Size에 따른 SelectedItemTextStyle 반환
  static TextStyle getSelectedItemTextStyle(String size, SelectBoxColors colors) {
    final fontSize = getFontSize(size);
    return TextStyles.body01.copyWith(
      color: colors.selectedItemText,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }

  /// Dropdown 메뉴의 최대 높이 반환 (스크롤 없이 모든 메뉴가 보이도록)
  static double getDropdownMaxHeight(int itemCount, String size) {
    final itemHeight = getHeight(size);
    final maxItems = 6; // 최대 6개 아이템까지 스크롤 없이 표시
    return (itemCount > maxItems ? maxItems : itemCount) * itemHeight;
  }

  /// Dropdown 메뉴의 너비 반환
  static double getDropdownWidth(double triggerWidth) {
    return triggerWidth;
  }
}

/// SelectBox 컴포넌트의 색상 정보를 담는 클래스
class SelectBoxColors {
  final Color border;
  final Color focusedBorder;
  final Color background;
  final Color text;
  final Color hint;
  final Color icon;
  final Color dropdownBackground;
  final Color dropdownBorder;
  final Color itemBackground;
  final Color itemText;
  final Color itemHoverBackground;
  final Color selectedItemBackground;
  final Color selectedItemText;
  final Color selectedItemIcon;

  const SelectBoxColors({
    required this.border,
    required this.focusedBorder,
    required this.background,
    required this.text,
    required this.hint,
    required this.icon,
    required this.dropdownBackground,
    required this.dropdownBorder,
    required this.itemBackground,
    required this.itemText,
    required this.itemHoverBackground,
    required this.selectedItemBackground,
    required this.selectedItemText,
    required this.selectedItemIcon,
  });
}

/// SelectBox 컴포넌트의 전체 스타일 정보를 담는 클래스
class SelectBoxStyle {
  final SelectBoxColors colors;
  final EdgeInsets padding;
  final double fontSize;
  final double iconSize;
  final double borderRadius;
  final double borderWidth;
  final double focusedBorderWidth;
  final String? hintText;
  final bool isError;
  final bool isDisabled;

  const SelectBoxStyle({
    required this.colors,
    required this.padding,
    required this.fontSize,
    required this.iconSize,
    required this.borderRadius,
    required this.borderWidth,
    required this.focusedBorderWidth,
    this.hintText,
    this.isError = false,
    this.isDisabled = false,
  });
}
