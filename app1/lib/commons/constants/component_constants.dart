/// 공통 컴포넌트 상수 정의
/// 
/// 모든 컴포넌트에서 공통으로 사용되는 variant, size, theme 상수들을 관리합니다.
/// 중복을 제거하고 일관된 상수 시스템을 제공합니다.

/// 컴포넌트 Variant 타입
enum ComponentVariant {
  /// Primary - 주요 액션용
  primary,
  
  /// Secondary - 보조 액션용  
  secondary,
  
  /// Tertiary - 텍스트 액션용
  tertiary,
}

/// 컴포넌트 Size 타입
enum ComponentSize {
  /// Small - 작은 크기
  small,
  
  /// Medium - 중간 크기
  medium,
  
  /// Large - 큰 크기
  large,
}

/// 컴포넌트 Theme 타입
enum ComponentTheme {
  /// Light 테마
  light,
  
  /// Dark 테마
  dark,
}

/// 컴포넌트 상수 헬퍼 클래스
/// 
/// enum을 문자열로 변환하거나 문자열을 enum으로 변환하는 유틸리티를 제공합니다.
class ComponentConstants {
  // Private constructor to prevent instantiation
  ComponentConstants._();

  // ============================================================================
  // Variant 상수
  // ============================================================================
  
  /// Primary variant 문자열
  static const String primary = 'primary';
  
  /// Secondary variant 문자열
  static const String secondary = 'secondary';
  
  /// Tertiary variant 문자열
  static const String tertiary = 'tertiary';

  // ============================================================================
  // Size 상수
  // ============================================================================
  
  /// Small size 문자열
  static const String small = 'small';
  
  /// Medium size 문자열
  static const String medium = 'medium';
  
  /// Large size 문자열
  static const String large = 'large';

  // ============================================================================
  // Theme 상수
  // ============================================================================
  
  /// Light theme 문자열
  static const String light = 'light';
  
  /// Dark theme 문자열
  static const String dark = 'dark';

  // ============================================================================
  // Variant 변환 메서드
  // ============================================================================
  
  /// Variant enum을 문자열로 변환
  static String variantToString(ComponentVariant variant) {
    switch (variant) {
      case ComponentVariant.primary:
        return primary;
      case ComponentVariant.secondary:
        return secondary;
      case ComponentVariant.tertiary:
        return tertiary;
    }
  }
  
  /// 문자열을 Variant enum으로 변환
  static ComponentVariant stringToVariant(String variant) {
    switch (variant) {
      case primary:
        return ComponentVariant.primary;
      case secondary:
        return ComponentVariant.secondary;
      case tertiary:
        return ComponentVariant.tertiary;
      default:
        return ComponentVariant.primary;
    }
  }

  // ============================================================================
  // Size 변환 메서드
  // ============================================================================
  
  /// Size enum을 문자열로 변환
  static String sizeToString(ComponentSize size) {
    switch (size) {
      case ComponentSize.small:
        return small;
      case ComponentSize.medium:
        return medium;
      case ComponentSize.large:
        return large;
    }
  }
  
  /// 문자열을 Size enum으로 변환
  static ComponentSize stringToSize(String size) {
    switch (size) {
      case small:
        return ComponentSize.small;
      case medium:
        return ComponentSize.medium;
      case large:
        return ComponentSize.large;
      default:
        return ComponentSize.medium;
    }
  }

  // ============================================================================
  // Theme 변환 메서드
  // ============================================================================
  
  /// Theme enum을 문자열로 변환
  static String themeToString(ComponentTheme theme) {
    switch (theme) {
      case ComponentTheme.light:
        return light;
      case ComponentTheme.dark:
        return dark;
    }
  }
  
  /// 문자열을 Theme enum으로 변환
  static ComponentTheme stringToTheme(String theme) {
    switch (theme) {
      case light:
        return ComponentTheme.light;
      case dark:
        return ComponentTheme.dark;
      default:
        return ComponentTheme.light;
    }
  }

  // ============================================================================
  // 유효성 검사 메서드
  // ============================================================================
  
  /// Variant 문자열이 유효한지 검사
  static bool isValidVariant(String variant) {
    return variant == primary || variant == secondary || variant == tertiary;
  }
  
  /// Size 문자열이 유효한지 검사
  static bool isValidSize(String size) {
    return size == small || size == medium || size == large;
  }
  
  /// Theme 문자열이 유효한지 검사
  static bool isValidTheme(String theme) {
    return theme == light || theme == dark;
  }

  // ============================================================================
  // 기본값 반환 메서드
  // ============================================================================
  
  /// 기본 Variant 반환
  static String getDefaultVariant() => primary;
  
  /// 기본 Size 반환
  static String getDefaultSize() => medium;
  
  /// 기본 Theme 반환
  static String getDefaultTheme() => light;
}
