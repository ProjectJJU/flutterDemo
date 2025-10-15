import 'package:flutter/material.dart';
import '../../constants/color_styles.dart';
import '../../constants/text_styles.dart';

/// Next.js의 next-themes와 유사한 테마 관리 Provider
/// 라이트/다크 모드 전환과 시스템 테마 감지를 지원합니다.
class NextThemesProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  
  /// 현재 테마 모드
  ThemeMode get themeMode => _themeMode;
  
  /// 현재 테마가 다크 모드인지 확인
  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      // 시스템 테마를 감지하려면 MediaQuery를 사용해야 하지만,
      // Provider에서는 직접 접근할 수 없으므로 별도 메서드로 처리
      return false; // 기본값
    }
    return _themeMode == ThemeMode.dark;
  }
  
  /// 테마 모드 설정
  void setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }
  
  /// 라이트 모드로 설정
  void setLightMode() {
    setThemeMode(ThemeMode.light);
  }
  
  /// 다크 모드로 설정
  void setDarkMode() {
    setThemeMode(ThemeMode.dark);
  }
  
  /// 시스템 테마로 설정
  void setSystemMode() {
    setThemeMode(ThemeMode.system);
  }
  
  /// 테마 토글 (라이트 ↔ 다크)
  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      setDarkMode();
    } else {
      setLightMode();
    }
  }
  
  /// 라이트 테마 데이터
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: ColorStyles.blue50,
        secondary: ColorStyles.blue40,
        surface: ColorStyles.gray05,
        error: ColorStyles.red30,
        onPrimary: ColorStyles.white,
        onSecondary: ColorStyles.white,
        onSurface: ColorStyles.gray80,
        onError: ColorStyles.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorStyles.blue50,
        foregroundColor: ColorStyles.white,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorStyles.blue50,
          foregroundColor: ColorStyles.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyles.webHeadline01,
        displayMedium: TextStyles.webHeadline02,
        displaySmall: TextStyles.webHeadline03,
        headlineLarge: TextStyles.headline01,
        headlineMedium: TextStyles.headline02,
        headlineSmall: TextStyles.headline03,
        titleLarge: TextStyles.title01,
        titleMedium: TextStyles.title02,
        titleSmall: TextStyles.title03,
        bodyLarge: TextStyles.body01,
        bodyMedium: TextStyles.body02Medium,
        bodySmall: TextStyles.body03,
        labelLarge: TextStyles.caption01,
        labelMedium: TextStyles.caption02Medium,
        labelSmall: TextStyles.caption03,
      ),
    );
  }
  
  /// 다크 테마 데이터
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: ColorStyles.blue40,
        secondary: ColorStyles.blue30,
        surface: ColorStyles.gray90,
        error: ColorStyles.red20,
        onPrimary: ColorStyles.white,
        onSecondary: ColorStyles.white,
        onSurface: ColorStyles.gray10,
        onError: ColorStyles.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorStyles.gray80,
        foregroundColor: ColorStyles.gray10,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorStyles.blue40,
          foregroundColor: ColorStyles.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyles.webHeadline01.copyWith(color: ColorStyles.gray10),
        displayMedium: TextStyles.webHeadline02.copyWith(color: ColorStyles.gray10),
        displaySmall: TextStyles.webHeadline03.copyWith(color: ColorStyles.gray10),
        headlineLarge: TextStyles.headline01.copyWith(color: ColorStyles.gray10),
        headlineMedium: TextStyles.headline02.copyWith(color: ColorStyles.gray10),
        headlineSmall: TextStyles.headline03.copyWith(color: ColorStyles.gray10),
        titleLarge: TextStyles.title01.copyWith(color: ColorStyles.gray10),
        titleMedium: TextStyles.title02.copyWith(color: ColorStyles.gray10),
        titleSmall: TextStyles.title03.copyWith(color: ColorStyles.gray10),
        bodyLarge: TextStyles.body01.copyWith(color: ColorStyles.gray10),
        bodyMedium: TextStyles.body02Medium.copyWith(color: ColorStyles.gray10),
        bodySmall: TextStyles.body03.copyWith(color: ColorStyles.gray10),
        labelLarge: TextStyles.caption01.copyWith(color: ColorStyles.gray10),
        labelMedium: TextStyles.caption02Medium.copyWith(color: ColorStyles.gray10),
        labelSmall: TextStyles.caption03.copyWith(color: ColorStyles.gray10),
      ),
    );
  }
  
  /// 시스템 테마를 고려한 현재 테마 반환
  ThemeData getCurrentTheme(BuildContext context) {
    switch (_themeMode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        final brightness = MediaQuery.of(context).platformBrightness;
        return brightness == Brightness.dark ? darkTheme : lightTheme;
    }
  }
  
  /// 시스템 테마를 고려한 현재 다크 모드 상태 반환
  bool isDarkModeInContext(BuildContext context) {
    switch (_themeMode) {
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
      case ThemeMode.system:
        return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
  }
}

/// NextThemesProvider를 사용하여 테마를 관리하는 위젯
class NextThemesWrapper extends StatelessWidget {
  final Widget child;
  final NextThemesProvider? themeProvider;
  
  const NextThemesWrapper({
    super.key,
    required this.child,
    this.themeProvider,
  });
  
  @override
  Widget build(BuildContext context) {
    final provider = themeProvider ?? NextThemesProvider();
    
    return ListenableBuilder(
      listenable: provider,
      builder: (context, _) {
        return Theme(
          data: provider.getCurrentTheme(context),
          child: child,
        );
      },
    );
  }
}
