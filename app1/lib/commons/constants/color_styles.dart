import 'package:flutter/material.dart';

/// ������Ʈ ��ü���� ���Ǵ� ���� ��ū �ý���
/// ��ũ��带 �����Ͽ� ��� �׸����� �ϰ��� ���� ����� �����մϴ�.
abstract class ColorStyles {
  // Private constructor to prevent instantiation
  ColorStyles._();

  // ============================================================================
  // Blue ���� �ȷ�Ʈ
  // ============================================================================
  
  /// Blue05 - ���� ���� �Ķ��� (#F0F7FF)
  static const Color blue05 = Color(0xFFF0F7FF);
  
  /// Blue10 - ���� �Ķ��� (#DBEEFF)
  static const Color blue10 = Color(0xFFDBEEFF);
  
  /// Blue20 - ���� �Ķ��� (#BDDBFF)
  static const Color blue20 = Color(0xFFBDDBFF);
  
  /// Blue30 - �߰� ��� �Ķ��� (#93BEFF)
  static const Color blue30 = Color(0xFF93BEFF);
  
  /// Blue40 - �ý��� ���� (#6DA5FA)
  static const Color blue40 = Color(0xFF6DA5FA);
  
  /// Blue50 - �⺻ �Ķ��� (#497CFF)
  static const Color blue50 = Color(0xFF497CFF);
  
  /// Blue60 - �ý��� ���� (#3A5CF3)
  static const Color blue60 = Color(0xFF3A5CF3);
  
  /// Blue70 - ���� �Ķ��� (#274AE1)
  static const Color blue70 = Color(0xFF274AE1);
  
  /// Blue80 - ��ο� �Ķ��� (#1530A6)
  static const Color blue80 = Color(0xFF1530A6);
  
  /// Blue90 - ���� ��ο� �Ķ��� (#0B2184)
  static const Color blue90 = Color(0xFF0B2184);

  // ============================================================================
  // Gray ���� �ȷ�Ʈ
  // ============================================================================
  
  /// White - ����� (#FFFFFF)
  static const Color white = Color(0xFFFFFFFF);
  
  /// Gray05 - ���� ���� ȸ�� (#F2F2F2)
  static const Color gray05 = Color(0xFFF2F2F2);
  
  /// Gray10 - ���� ȸ�� (#E4E4E4)
  static const Color gray10 = Color(0xFFE4E4E4);
  
  /// Gray20 - ���� ȸ�� (#D4D3D3)
  static const Color gray20 = Color(0xFFD4D3D3);
  
  /// Gray30 - �߰� ��� ȸ�� (#C7C7C7)
  static const Color gray30 = Color(0xFFC7C7C7);
  
  /// Gray40 - �߰� ȸ�� (#ABABAB)
  static const Color gray40 = Color(0xFFABABAB);
  
  /// Gray50 - �߰� ��ο� ȸ�� (#919191)
  static const Color gray50 = Color(0xFF919191);
  
  /// Gray60 - ��ο� ȸ�� (#777777)
  static const Color gray60 = Color(0xFF777777);
  
  /// Gray70 - ���� ȸ�� (#5F5F5F)
  static const Color gray70 = Color(0xFF5F5F5F);
  
  /// Gray80 - �ſ� ��ο� ȸ�� (#333333)
  static const Color gray80 = Color(0xFF333333);
  
  /// Gray90 - ���� ������ (#1C1C1C)
  static const Color gray90 = Color(0xFF1C1C1C);
  
  /// Black - �������� (#000000)
  static const Color black = Color(0xFF000000);

  // ============================================================================
  // Red ���� �ȷ�Ʈ (���� ����)
  // ============================================================================
  
  /// Red05 - ���� ���� ������ (#FDD7DC)
  static const Color red05 = Color(0xFFFDD7DC);
  
  /// Red10 - ���� ������ (#F797A4)
  static const Color red10 = Color(0xFFF797A4);
  
  /// Red20 - ���� ������ (#F4677A)
  static const Color red20 = Color(0xFFF4677A);
  
  /// Red30 - ���� ���� (#F03851)
  static const Color red30 = Color(0xFFF03851);
  
  /// Red40 - ���� ������ (#E4112E)
  static const Color red40 = Color(0xFFE4112E);
  
  /// Red50 - ��ο� ������ (#B40E24)
  static const Color red50 = Color(0xFFB40E24);
  
  /// Red60 - ���� ��ο� ������ (#850A1B)
  static const Color red60 = Color(0xFF850A1B);

  // ============================================================================
  // Green ���� �ȷ�Ʈ (���� ����)
  // ============================================================================
  
  /// Green05 - ���� ���� �ʷϻ� (#D3F3E0)
  static const Color green05 = Color(0xFFD3F3E0);
  
  /// Green10 - ���� �ʷϻ� (#92E6B9)
  static const Color green10 = Color(0xFF92E6B9);
  
  /// Green20 - ���� �ʷϻ� (#15D66F)
  static const Color green20 = Color(0xFF15D66F);
  
  /// Green30 - ���� ���� (#12B75F)
  static const Color green30 = Color(0xFF12B75F);
  
  /// Green40 - ���� �ʷϻ� (#109C51)
  static const Color green40 = Color(0xFF109C51);
  
  /// Green50 - ��ο� �ʷϻ� (#0E723C)
  static const Color green50 = Color(0xFF0E723C);
  
  /// Green60 - ���� ��ο� �ʷϻ� (#084424)
  static const Color green60 = Color(0xFF084424);

  // ============================================================================
  // Yellow ���� �ȷ�Ʈ (��� ����)
  // ============================================================================
  
  /// Yellow05 - ���� ���� ����� (#FFE499)
  static const Color yellow05 = Color(0xFFFFE499);
  
  /// Yellow10 - ���� ����� (#FFD666)
  static const Color yellow10 = Color(0xFFFFD666);
  
  /// Yellow20 - ���� ����� (#FFC933)
  static const Color yellow20 = Color(0xFFFFC933);
  
  /// Yellow30 - �߰� ����� (#FFB300)
  static const Color yellow30 = Color(0xFFFFB300);
  
  /// Yellow40 - ���� ����� (#EBA500)
  static const Color yellow40 = Color(0xFFEBA500);
  
  /// Yellow50 - ��ο� ����� (#D69600)
  static const Color yellow50 = Color(0xFFD69600);
  
  /// Yellow60 - ���� ��ο� ����� (#B27D00)
  static const Color yellow60 = Color(0xFFB27D00);

  // ============================================================================
  // Cool Gray ���� �ȷ�Ʈ
  // ============================================================================
  
  /// CoolGray01 - ���� ���� �� �׷��� (#F8F8FA)
  static const Color coolGray01 = Color(0xFFF8F8FA);
  
  /// CoolGray05 - ���� �� �׷��� (#F6F6F9)
  static const Color coolGray05 = Color(0xFFF6F6F9);
  
  /// CoolGray10 - ���� �� �׷��� (#EDEEF2)
  static const Color coolGray10 = Color(0xFFEDEEF2);
  
  /// CoolGray20 - �߰� ��� �� �׷��� (#DDDFE5)
  static const Color coolGray20 = Color(0xFFDDDFE5);
  
  /// CoolGray30 - �߰� �� �׷��� (#D2D4DD)
  static const Color coolGray30 = Color(0xFFD2D4DD);
  
  /// CoolGray40 - �߰� ��ο� �� �׷��� (#C7C9D5)
  static const Color coolGray40 = Color(0xFFC7C9D5);
  
  /// CoolGray50 - ��ο� �� �׷��� (#BBBECD)
  static const Color coolGray50 = Color(0xFFBBBECD);
  
  /// CoolGray60 - ���� ��ο� �� �׷��� (#B0B3C4)
  static const Color coolGray60 = Color(0xFFB0B3C4);


  // ============================================================================
  // �׶��̼�
  // ============================================================================
  
  /// Primary Gradient - �ֿ� �׶��̼�
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [blue40, Color(0xFF92EAF5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  /// Skeleton Gradient - ���̷��� �ε��� �׶��̼�
  static const LinearGradient skeletonGradient = LinearGradient(
    colors: [
      Color(0x00FFFFFF), // ����
      Color(0x99FFFFFF), // ������ ���
      Color(0x00FFFFFF), // ����
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

}
