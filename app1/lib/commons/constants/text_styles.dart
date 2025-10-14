import 'package:flutter/material.dart';

/// 피그마 파운데이션 기반 전역 텍스트 스타일 체계
/// 
/// 피그마 원본 텍스트 스타일만으로 구성된 abstract class
/// 모바일/데스크톱 분기 및 다국어 지원을 위한 구조
abstract class TextStyles {
  // ============================================================================
  // Web Headline (웹 헤드라인) - 데스크톱용 대형 헤드라인
  // ============================================================================
  
  /// 웹 헤드라인01 - Pretendard SemiBold, 48px, line-height 60px
  static const TextStyle webHeadline01 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 48.0,
    height: 1.25, // 60/48
    letterSpacing: 0.0,
  );

  /// 웹 헤드라인02 - Pretendard SemiBold, 36px, line-height 48px
  static const TextStyle webHeadline02 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 36.0,
    height: 1.33, // 48/36
    letterSpacing: 0.0,
  );

  /// 웹 헤드라인03 - Pretendard SemiBold, 28px, line-height 36px
  static const TextStyle webHeadline03 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 28.0,
    height: 1.29, // 36/28
    letterSpacing: 0.0,
  );

  // ============================================================================
  // Headline (헤드라인) - 모바일용 헤드라인
  // ============================================================================
  
  /// 헤드라인01 - Pretendard Bold, 24px, line-height 32px
  static const TextStyle headline01 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700, // Bold
    fontSize: 24.0,
    height: 1.33, // 32/24
    letterSpacing: 0.0,
  );

  /// 헤드라인02 - Pretendard ExtraBold, 22px, line-height 30px
  static const TextStyle headline02 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 22.0,
    height: 1.36, // 30/22
    letterSpacing: 0.0,
  );

  /// 헤드라인03 - Pretendard Bold, 20px, line-height 28px
  static const TextStyle headline03 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700, // Bold
    fontSize: 20.0,
    height: 1.4, // 28/20
    letterSpacing: 0.0,
  );

  // ============================================================================
  // Title (타이틀) - 섹션 제목
  // ============================================================================
  
  /// 타이틀01 - Pretendard Bold, 18px, line-height 24px
  static const TextStyle title01 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700, // Bold
    fontSize: 18.0,
    height: 1.33, // 24/18
    letterSpacing: 0.0,
  );

  /// 타이틀02 - Pretendard Bold, 16px, line-height 22px
  static const TextStyle title02 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700, // Bold
    fontSize: 16.0,
    height: 1.38, // 22/16
    letterSpacing: 0.0,
  );

  /// 타이틀03 - Pretendard Bold, 14px, line-height 20px
  static const TextStyle title03 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700, // Bold
    fontSize: 14.0,
    height: 1.43, // 20/14
    letterSpacing: 0.0,
  );

  /// 서브 타이틀01 - Pretendard SemiBold, 14px, line-height 22px
  static const TextStyle subtitle01 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 14.0,
    height: 1.57, // 22/14
    letterSpacing: 0.0,
  );

  /// 서브 타이틀02 - Pretendard SemiBold, 12px, line-height 18px
  static const TextStyle subtitle02 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 12.0,
    height: 1.5, // 18/12
    letterSpacing: 0.0,
  );

  // ============================================================================
  // Body (본문) - 일반 텍스트
  // ============================================================================
  
  /// 본문01 - Pretendard Medium, 16px, line-height 24px
  static const TextStyle body01 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w500, // Medium
    fontSize: 16.0,
    height: 1.5, // 24/16
    letterSpacing: 0.0,
  );

  /// 본문02_m - Pretendard Medium, 14px, line-height 22px
  static const TextStyle body02Medium = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w500, // Medium
    fontSize: 14.0,
    height: 1.57, // 22/14
    letterSpacing: 0.0,
  );

  /// 본문03 - Pretendard Medium, 12px, line-height 18px
  static const TextStyle body03 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w500, // Medium
    fontSize: 12.0,
    height: 1.5, // 18/12
    letterSpacing: 0.0,
  );

  /// 본문01 (미정) - Pretendard Regular, 16px, line-height 24px
  static const TextStyle body01Regular = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400, // Regular
    fontSize: 16.0,
    height: 1.5, // 24/16
    letterSpacing: 0.0,
  );

  /// 본문02_s - Pretendard Regular, 14px, line-height 20px
  static const TextStyle body02Small = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400, // Regular
    fontSize: 14.0,
    height: 1.43, // 20/14
    letterSpacing: 0.0,
  );

  /// 본문03 (미정) - Pretendard Regular, 12px, line-height 18px
  static const TextStyle body03Regular = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400, // Regular
    fontSize: 12.0,
    height: 1.5, // 18/12
    letterSpacing: 0.0,
  );

  // ============================================================================
  // Caption (캡션) - 작은 텍스트, 라벨
  // ============================================================================
  
  /// 캡션01 - Pretendard SemiBold, 12px, line-height 14px
  static const TextStyle caption01 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 12.0,
    height: 1.17, // 14/12
    letterSpacing: 0.0,
  );

  /// 캡션02_m - Pretendard SemiBold, 10px, line-height 12px
  static const TextStyle caption02Medium = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 10.0,
    height: 1.2, // 12/10
    letterSpacing: 0.0,
  );

  /// 캡션02_s - Pretendard Medium, 10px, line-height 12px
  static const TextStyle caption02Small = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w500, // Medium
    fontSize: 10.0,
    height: 1.2, // 12/10
    letterSpacing: 0.0,
  );

  /// 캡션03 - Pretendard SemiBold, 8px, line-height 12px
  static const TextStyle caption03 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 8.0,
    height: 1.5, // 12/8
    letterSpacing: 0.0,
  );

  // ============================================================================
  // 플랫폼별 분기 메서드 (향후 확장용)
  // ============================================================================
  
  /// 모바일/데스크톱 분기를 위한 헬퍼 메서드
  /// 현재는 기본 스타일을 반환하지만, 향후 플랫폼별 다른 스타일 적용 가능
  static TextStyle getWebHeadline01({bool isDesktop = false}) {
    return isDesktop ? webHeadline01 : webHeadline01;
  }

  static TextStyle getHeadline01({bool isDesktop = false}) {
    return isDesktop ? headline01 : headline01;
  }

  static TextStyle getTitle01({bool isDesktop = false}) {
    return isDesktop ? title01 : title01;
  }

  static TextStyle getBody01({bool isDesktop = false}) {
    return isDesktop ? body01 : body01;
  }

  static TextStyle getCaption01({bool isDesktop = false}) {
    return isDesktop ? caption01 : caption01;
  }

  // ============================================================================
  // 다국어 지원을 위한 헬퍼 메서드 (향후 확장용)
  // ============================================================================
  
  /// 언어별 폰트 패밀리 설정 (향후 영문 typography 지원용)
  static String getFontFamily({String language = 'ko'}) {
    switch (language) {
      case 'ko':
        return 'Pretendard';
      case 'en':
        return 'Pretendard'; // 향후 영문 전용 폰트로 변경 가능
      default:
        return 'Pretendard';
    }
  }

  /// 언어별 스타일 적용 헬퍼
  static TextStyle applyLanguageStyle(TextStyle baseStyle, {String language = 'ko'}) {
    return baseStyle.copyWith(
      fontFamily: getFontFamily(language: language),
    );
  }
}
