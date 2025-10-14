import 'package:flutter/material.dart';

/// 프로젝트 전체에서 사용되는 색상 토큰 시스템
/// 다크모드를 포함하여 모든 테마에서 일관된 색상 사용을 보장합니다.
abstract class ColorStyles {
  // Private constructor to prevent instantiation
  ColorStyles._();

  // ============================================================================
  // Blue 색상 팔레트
  // ============================================================================
  
  /// Blue05 - 가장 연한 파란색 (#F0F7FF)
  static const Color blue05 = Color(0xFFF0F7FF);
  
  /// Blue10 - 연한 파란색 (#DBEEFF)
  static const Color blue10 = Color(0xFFDBEEFF);
  
  /// Blue20 - 밝은 파란색 (#BDDBFF)
  static const Color blue20 = Color(0xFFBDDBFF);
  
  /// Blue30 - 중간 밝기 파란색 (#93BEFF)
  static const Color blue30 = Color(0xFF93BEFF);
  
  /// Blue40 - 시스템 색상 (#6DA5FA)
  static const Color blue40 = Color(0xFF6DA5FA);
  
  /// Blue50 - 기본 파란색 (#497CFF)
  static const Color blue50 = Color(0xFF497CFF);
  
  /// Blue60 - 시스템 색상 (#3A5CF3)
  static const Color blue60 = Color(0xFF3A5CF3);
  
  /// Blue70 - 진한 파란색 (#274AE1)
  static const Color blue70 = Color(0xFF274AE1);
  
  /// Blue80 - 어두운 파란색 (#1530A6)
  static const Color blue80 = Color(0xFF1530A6);
  
  /// Blue90 - 가장 어두운 파란색 (#0B2184)
  static const Color blue90 = Color(0xFF0B2184);

  // ============================================================================
  // Gray 색상 팔레트
  // ============================================================================
  
  /// White - 순백색 (#FFFFFF)
  static const Color white = Color(0xFFFFFFFF);
  
  /// Gray05 - 가장 연한 회색 (#F2F2F2)
  static const Color gray05 = Color(0xFFF2F2F2);
  
  /// Gray10 - 연한 회색 (#E4E4E4)
  static const Color gray10 = Color(0xFFE4E4E4);
  
  /// Gray20 - 밝은 회색 (#D4D3D3)
  static const Color gray20 = Color(0xFFD4D3D3);
  
  /// Gray30 - 중간 밝기 회색 (#C7C7C7)
  static const Color gray30 = Color(0xFFC7C7C7);
  
  /// Gray40 - 중간 회색 (#ABABAB)
  static const Color gray40 = Color(0xFFABABAB);
  
  /// Gray50 - 중간 어두운 회색 (#919191)
  static const Color gray50 = Color(0xFF919191);
  
  /// Gray60 - 어두운 회색 (#777777)
  static const Color gray60 = Color(0xFF777777);
  
  /// Gray70 - 진한 회색 (#5F5F5F)
  static const Color gray70 = Color(0xFF5F5F5F);
  
  /// Gray80 - 매우 어두운 회색 (#333333)
  static const Color gray80 = Color(0xFF333333);
  
  /// Gray90 - 거의 검은색 (#1C1C1C)
  static const Color gray90 = Color(0xFF1C1C1C);
  
  /// Black - 순검정색 (#000000)
  static const Color black = Color(0xFF000000);

  // ============================================================================
  // Red 색상 팔레트 (에러 색상)
  // ============================================================================
  
  /// Red05 - 가장 연한 빨간색 (#FDD7DC)
  static const Color red05 = Color(0xFFFDD7DC);
  
  /// Red10 - 연한 빨간색 (#F797A4)
  static const Color red10 = Color(0xFFF797A4);
  
  /// Red20 - 밝은 빨간색 (#F4677A)
  static const Color red20 = Color(0xFFF4677A);
  
  /// Red30 - 에러 색상 (#F03851)
  static const Color red30 = Color(0xFFF03851);
  
  /// Red40 - 진한 빨간색 (#E4112E)
  static const Color red40 = Color(0xFFE4112E);
  
  /// Red50 - 어두운 빨간색 (#B40E24)
  static const Color red50 = Color(0xFFB40E24);
  
  /// Red60 - 가장 어두운 빨간색 (#850A1B)
  static const Color red60 = Color(0xFF850A1B);

  // ============================================================================
  // Green 색상 팔레트 (성공 색상)
  // ============================================================================
  
  /// Green05 - 가장 연한 초록색 (#D3F3E0)
  static const Color green05 = Color(0xFFD3F3E0);
  
  /// Green10 - 연한 초록색 (#92E6B9)
  static const Color green10 = Color(0xFF92E6B9);
  
  /// Green20 - 밝은 초록색 (#15D66F)
  static const Color green20 = Color(0xFF15D66F);
  
  /// Green30 - 성공 색상 (#12B75F)
  static const Color green30 = Color(0xFF12B75F);
  
  /// Green40 - 진한 초록색 (#109C51)
  static const Color green40 = Color(0xFF109C51);
  
  /// Green50 - 어두운 초록색 (#0E723C)
  static const Color green50 = Color(0xFF0E723C);
  
  /// Green60 - 가장 어두운 초록색 (#084424)
  static const Color green60 = Color(0xFF084424);

  // ============================================================================
  // Yellow 색상 팔레트 (경고 색상)
  // ============================================================================
  
  /// Yellow05 - 가장 연한 노란색 (#FFE499)
  static const Color yellow05 = Color(0xFFFFE499);
  
  /// Yellow10 - 연한 노란색 (#FFD666)
  static const Color yellow10 = Color(0xFFFFD666);
  
  /// Yellow20 - 밝은 노란색 (#FFC933)
  static const Color yellow20 = Color(0xFFFFC933);
  
  /// Yellow30 - 중간 노란색 (#FFB300)
  static const Color yellow30 = Color(0xFFFFB300);
  
  /// Yellow40 - 진한 노란색 (#EBA500)
  static const Color yellow40 = Color(0xFFEBA500);
  
  /// Yellow50 - 어두운 노란색 (#D69600)
  static const Color yellow50 = Color(0xFFD69600);
  
  /// Yellow60 - 가장 어두운 노란색 (#B27D00)
  static const Color yellow60 = Color(0xFFB27D00);

  // ============================================================================
  // Cool Gray 색상 팔레트
  // ============================================================================
  
  /// CoolGray01 - 가장 연한 쿨 그레이 (#F8F8FA)
  static const Color coolGray01 = Color(0xFFF8F8FA);
  
  /// CoolGray05 - 연한 쿨 그레이 (#F6F6F9)
  static const Color coolGray05 = Color(0xFFF6F6F9);
  
  /// CoolGray10 - 밝은 쿨 그레이 (#EDEEF2)
  static const Color coolGray10 = Color(0xFFEDEEF2);
  
  /// CoolGray20 - 중간 밝기 쿨 그레이 (#DDDFE5)
  static const Color coolGray20 = Color(0xFFDDDFE5);
  
  /// CoolGray30 - 중간 쿨 그레이 (#D2D4DD)
  static const Color coolGray30 = Color(0xFFD2D4DD);
  
  /// CoolGray40 - 중간 어두운 쿨 그레이 (#C7C9D5)
  static const Color coolGray40 = Color(0xFFC7C9D5);
  
  /// CoolGray50 - 어두운 쿨 그레이 (#BBBECD)
  static const Color coolGray50 = Color(0xFFBBBECD);
  
  /// CoolGray60 - 가장 어두운 쿨 그레이 (#B0B3C4)
  static const Color coolGray60 = Color(0xFFB0B3C4);


  // ============================================================================
  // 그라데이션
  // ============================================================================
  
  /// Primary Gradient - 주요 그라데이션
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [blue40, Color(0xFF92EAF5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  /// Skeleton Gradient - 스켈레톤 로딩용 그라데이션
  static const LinearGradient skeletonGradient = LinearGradient(
    colors: [
      Color(0x00FFFFFF), // 투명
      Color(0x99FFFFFF), // 반투명 흰색
      Color(0x00FFFFFF), // 투명
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

}
