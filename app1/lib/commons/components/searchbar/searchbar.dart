import 'package:flutter/material.dart';
import 'styles.dart';

/// 완전한 variant 시스템을 지원하는 SearchBar 컴포넌트
/// 
/// - variant: 'primary' | 'secondary' | 'tertiary'
/// - size: 'small' | 'medium' | 'large'  
/// - theme: 'light' | 'dark'
class SearchBar extends StatelessWidget {
  /// SearchBar 라벨
  final String? label;
  
  /// Placeholder 텍스트
  final String? placeholder;
  
  /// TextEditingController
  final TextEditingController? controller;
  
  /// SearchBar variant (primary, secondary, tertiary)
  final SearchBarVariant variant;
  
  /// SearchBar size (small, medium, large)
  final SearchBarSize size;
  
  /// SearchBar theme (light, dark)
  final SearchBarThemeType theme;
  
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

  const SearchBar({
    super.key,
    this.label,
    this.placeholder,
    this.controller,
    this.variant = SearchBarVariant.primary,
    this.size = SearchBarSize.medium,
    this.theme = SearchBarThemeType.light,
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
    final textStyle = SearchBarStyles.getTextStyle(size, colors);
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
        
        // SearchBar 필드
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
          decoration: SearchBarStyles.getDecoration(
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
  SearchBarColors _getColorsByVariant(SearchBarVariant variant, SearchBarThemeType theme) {
    switch (variant) {
      case SearchBarVariant.primary:
        return SearchBarStyles.getPrimaryColors(theme);
      case SearchBarVariant.secondary:
        return SearchBarStyles.getSecondaryColors(theme);
      case SearchBarVariant.tertiary:
        return SearchBarStyles.getTertiaryColors(theme);
    }
  }

  /// 라벨 스타일 반환
  TextStyle _getLabelStyle() {
    switch (size) {
      case SearchBarSize.small:
        return const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
          height: 1.5,
          color: Color(0xFF5F5F5F),
        );
      case SearchBarSize.medium:
        return const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
          height: 1.5,
          color: Color(0xFF5F5F5F),
        );
      case SearchBarSize.large:
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

/// 검색 전용 SearchBar 컴포넌트
/// 
/// Figma 디자인에 맞춘 검색 아이콘이 포함된 SearchBar
class SearchInputField extends StatelessWidget {
  /// Placeholder 텍스트
  final String? placeholder;
  
  /// TextEditingController
  final TextEditingController? controller;
  
  /// SearchBar size
  final SearchBarSize size;
  
  /// SearchBar theme
  final SearchBarThemeType theme;
  
  /// 검색 콜백
  final ValueChanged<String>? onSearch;
  
  /// 입력 변경 콜백
  final ValueChanged<String>? onChanged;
  
  /// 포커스 노드
  final FocusNode? focusNode;

  const SearchInputField({
    super.key,
    this.placeholder = '검색어를 입력해 주세요.',
    this.controller,
    this.size = SearchBarSize.medium,
    this.theme = SearchBarThemeType.light,
    this.onSearch,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      placeholder: placeholder,
      controller: controller,
      variant: SearchBarVariant.primary,
      size: size,
      theme: theme,
      focusNode: focusNode,
      onChanged: onChanged,
      onSubmitted: onSearch,
      prefixIcon: Icon(
        Icons.search,
        size: SearchBarStyles.getIconSize(size),
        color: _getIconColor(),
      ),
    );
  }

  /// 아이콘 색상 반환
  Color _getIconColor() {
    return theme == SearchBarThemeType.light
        ? const Color(0xFF919191) // ColorStyles.gray50
        : const Color(0xFFABABAB); // ColorStyles.gray40
  }
}
