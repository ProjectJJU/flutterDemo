import 'package:flutter/material.dart';
import 'styles.dart';

/// 완전한 variant 시스템을 지원하는 Input 컴포넌트
/// 
/// - variant: 'primary' | 'secondary' | 'tertiary'
/// - size: 'small' | 'medium' | 'large'  
/// - theme: 'light' | 'dark'
class Input extends StatelessWidget {
  /// Input 라벨
  final String? label;
  
  /// Placeholder 텍스트
  final String? placeholder;
  
  /// TextEditingController
  final TextEditingController? controller;
  
  /// Input variant (primary, secondary, tertiary)
  final InputVariant variant;
  
  /// Input size (small, medium, large)
  final InputSize size;
  
  /// Input theme (light, dark)
  final InputThemeType theme;
  
  /// 에러 메시지
  final String? errorText;
  
  /// Prefix 아이콘
  final Widget? prefixIcon;
  
  /// Suffix 아이콘
  final Widget? suffixIcon;
  
  /// 비활성화 상태
  final bool enabled;
  
  /// 읽기 전용 상태
  final bool readOnly;
  
  /// 최대 라인 수
  final int? maxLines;
  
  /// 최대 길이
  final int? maxLength;
  
  /// 텍스트 입력 타입
  final TextInputType? keyboardType;
  
  /// 비밀번호 입력 여부
  final bool obscureText;
  
  /// 포커스 노드
  final FocusNode? focusNode;
  
  /// 입력 변경 콜백
  final ValueChanged<String>? onChanged;
  
  /// 제출 콜백
  final ValueChanged<String>? onSubmitted;
  
  /// 포커스 변경 콜백
  final ValueChanged<bool>? onFocusChanged;

  const Input({
    super.key,
    this.label,
    this.placeholder,
    this.controller,
    this.variant = InputVariant.primary,
    this.size = InputSize.medium,
    this.theme = InputThemeType.light,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.obscureText = false,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.onFocusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _getColorsByVariant(variant, theme);
    final textStyle = InputStyles.getTextStyle(size, colors);
    final isError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 라벨
        if (label != null) ...[
          Text(
            label!,
            style: _getLabelStyle(),
          ),
          const SizedBox(height: 8.0),
        ],
        
        // Input 필드
        TextField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: maxLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: textStyle,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onTap: () {
            if (onFocusChanged != null) {
              onFocusChanged!(true);
            }
          },
          decoration: InputStyles.getDecoration(
            variant: variant,
            size: size,
            theme: theme,
            hintText: placeholder,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            isError: isError,
          ),
        ),
        
        // 에러 메시지
        if (isError) ...[
          const SizedBox(height: 4.0),
          Text(
            errorText!,
            style: _getErrorStyle(),
          ),
        ],
      ],
    );
  }

  /// Variant에 따른 색상 반환
  InputColors _getColorsByVariant(InputVariant variant, InputThemeType theme) {
    switch (variant) {
      case InputVariant.primary:
        return InputStyles.getPrimaryColors(theme);
      case InputVariant.secondary:
        return InputStyles.getSecondaryColors(theme);
      case InputVariant.tertiary:
        return InputStyles.getTertiaryColors(theme);
    }
  }

  /// 라벨 스타일 반환
  TextStyle _getLabelStyle() {
    switch (size) {
      case InputSize.small:
        return const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
          height: 1.5,
          color: Color(0xFF5F5F5F),
        );
      case InputSize.medium:
        return const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
          height: 1.5,
          color: Color(0xFF5F5F5F),
        );
      case InputSize.large:
        return const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          height: 1.5,
          color: Color(0xFF5F5F5F),
        );
    }
  }

  /// 에러 스타일 반환
  TextStyle _getErrorStyle() {
    return const TextStyle(
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w500,
      fontSize: 12.0,
      height: 1.5,
      color: Color(0xFFF03851), // ColorStyles.red30
    );
  }
}

/// 기본 InputField 컴포넌트
/// 
/// 간단한 사용을 위한 기본 Input 컴포넌트
class InputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Input(
      label: label,
      placeholder: placeHolder,
      controller: controller,
      variant: InputVariant.primary,
      size: InputSize.medium,
      theme: InputThemeType.light,
    );
  }
}
