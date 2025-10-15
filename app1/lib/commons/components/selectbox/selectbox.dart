import 'package:flutter/material.dart';
import '../../constants/color_styles.dart';
import 'selectbox_export.dart';

/// SelectBox 컴포넌트
/// 
/// variant, size, theme에 따른 완전한 variant 시스템을 제공하는 드롭다운 선택 컴포넌트입니다.
/// 
/// 사용 예시:
/// ```dart
/// SelectBox<String>(
///   value: selectedValue,
///   onChanged: (value) => setState(() => selectedValue = value),
///   items: ['옵션1', '옵션2', '옵션3'],
///   variant: SelectBoxVariant.primary,
///   size: SelectBoxSize.medium,
///   theme: SelectBoxTheme.light,
/// )
/// ```
class SelectBox<T> extends StatefulWidget {
  /// 현재 선택된 값
  final T? value;
  
  /// 값이 변경될 때 호출되는 콜백
  final ValueChanged<T?>? onChanged;
  
  /// 선택 가능한 옵션 목록
  final List<SelectBoxItem<T>> items;
  
  /// 플레이스홀더 텍스트
  final String? hintText;
  
  /// 컴포넌트 variant
  final SelectBoxVariant variant;
  
  /// 컴포넌트 크기
  final SelectBoxSize size;
  
  /// 컴포넌트 테마
  final SelectBoxTheme theme;
  
  /// 비활성화 상태
  final bool isDisabled;
  
  /// 에러 상태
  final bool isError;
  
  /// 에러 메시지
  final String? errorText;
  
  /// 라벨 텍스트
  final String? label;
  
  /// 필수 입력 여부
  final bool isRequired;
  
  /// 커스텀 아이템 빌더
  final Widget Function(BuildContext context, SelectBoxItem<T> item, bool isSelected)? itemBuilder;
  
  /// 커스텀 선택된 아이템 빌더
  final Widget Function(BuildContext context, SelectBoxItem<T> item)? selectedItemBuilder;

  const SelectBox({
    super.key,
    this.value,
    this.onChanged,
    required this.items,
    this.hintText,
    this.variant = SelectBoxVariant.primary,
    this.size = SelectBoxSize.medium,
    this.theme = SelectBoxTheme.light,
    this.isDisabled = false,
    this.isError = false,
    this.errorText,
    this.label,
    this.isRequired = false,
    this.itemBuilder,
    this.selectedItemBuilder,
  });

  @override
  State<SelectBox<T>> createState() => _SelectBoxState<T>();
}

class _SelectBoxState<T> extends State<SelectBox<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  /// 현재 선택된 아이템 찾기
  SelectBoxItem<T>? get _selectedItem {
    if (widget.value == null) return null;
    try {
      return widget.items.firstWhere(
        (item) => item.value == widget.value,
      );
    } catch (e) {
      return null;
    }
  }

  /// 드롭다운 열기
  void _openDropdown() {
    if (widget.isDisabled || _isOpen) return;

    setState(() {
      _isOpen = true;
    });

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  /// 드롭다운 닫기
  void _closeDropdown() {
    if (!_isOpen) return;

    setState(() {
      _isOpen = false;
    });

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  /// 아이템 선택 처리
  void _selectItem(SelectBoxItem<T> item) {
    widget.onChanged?.call(item.value);
    _closeDropdown();
  }

  /// 오버레이 엔트리 생성
  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _closeDropdown,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            // 배경 오버레이
            Positioned.fill(
              child: Container(
                color: Colors.transparent,
              ),
            ),
            // 드롭다운 메뉴
            Positioned(
              left: position.dx,
              top: position.dy + size.height + 4,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 4),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(8),
                  child: _buildDropdownMenu(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 드롭다운 메뉴 빌드
  Widget _buildDropdownMenu() {
    final style = SelectBoxStyles.getStyle(
      variant: widget.variant.name,
      size: widget.size.name,
      theme: widget.theme.name,
      isError: widget.isError,
      isDisabled: widget.isDisabled,
    );

    return Container(
      width: SelectBoxStyles.getDropdownWidth(
        context.findRenderObject()?.paintBounds.width ?? 0,
      ),
      constraints: BoxConstraints(
        maxHeight: SelectBoxStyles.getDropdownMaxHeight(
          widget.items.length,
          widget.size.name,
        ),
      ),
      decoration: BoxDecoration(
        color: style.colors.dropdownBackground,
        borderRadius: BorderRadius.circular(style.borderRadius),
        border: Border.all(
          color: style.colors.dropdownBorder,
          width: style.borderWidth,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(style.borderRadius),
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            final item = widget.items[index];
            final isSelected = item.value == widget.value;
            
            return _buildDropdownItem(item, isSelected, style);
          },
        ),
      ),
    );
  }

  /// 드롭다운 아이템 빌드
  Widget _buildDropdownItem(
    SelectBoxItem<T> item,
    bool isSelected,
    SelectBoxStyle style,
  ) {
    return Material(
      color: isSelected 
          ? style.colors.selectedItemBackground 
          : style.colors.itemBackground,
      child: InkWell(
        onTap: () => _selectItem(item),
        hoverColor: style.colors.itemHoverBackground,
        child: Container(
          padding: style.padding,
          child: Row(
            children: [
              Expanded(
                child: widget.itemBuilder?.call(context, item, isSelected) ??
                    Text(
                      item.label,
                      style: isSelected
                          ? SelectBoxStyles.getSelectedItemTextStyle(
                              widget.size.name,
                              style.colors,
                            )
                          : SelectBoxStyles.getItemTextStyle(
                              widget.size.name,
                              style.colors,
                            ),
                    ),
              ),
              if (isSelected)
                Icon(
                  Icons.check,
                  size: style.iconSize,
                  color: style.colors.selectedItemIcon,
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = SelectBoxStyles.getStyle(
      variant: widget.variant.name,
      size: widget.size.name,
      theme: widget.theme.name,
      hintText: widget.hintText,
      isError: widget.isError,
      isDisabled: widget.isDisabled,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 라벨
        if (widget.label != null) ...[
          Row(
            children: [
              Text(
                widget.label!,
                style: SelectBoxStyles.getTextStyle(widget.size.name, style.colors),
              ),
              if (widget.isRequired)
                Text(
                  ' *',
                  style: SelectBoxStyles.getTextStyle(widget.size.name, style.colors)
                      .copyWith(color: ColorStyles.red30),
                ),
            ],
          ),
          const SizedBox(height: 8),
        ],
        
        // SelectBox 트리거
        CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: _isOpen ? _closeDropdown : _openDropdown,
            child: Container(
              height: SelectBoxStyles.getHeight(widget.size.name),
              padding: style.padding,
              decoration: BoxDecoration(
                color: widget.isDisabled 
                    ? style.colors.background.withOpacity(0.5)
                    : style.colors.background,
                borderRadius: BorderRadius.circular(style.borderRadius),
                border: Border.all(
                  color: widget.isError 
                      ? ColorStyles.red30
                      : _isOpen 
                          ? style.colors.focusedBorder
                          : style.colors.border,
                  width: _isOpen ? style.focusedBorderWidth : style.borderWidth,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: widget.selectedItemBuilder?.call(context, _selectedItem!) ??
                        Text(
                          _selectedItem?.label ?? widget.hintText ?? '',
                          style: _selectedItem != null
                              ? SelectBoxStyles.getTextStyle(widget.size.name, style.colors)
                              : SelectBoxStyles.getHintTextStyle(widget.size.name, style.colors),
                        ),
                  ),
                  Icon(
                    _isOpen ? Icons.keyboard_arrow_up : Icons.arrow_drop_down,
                    size: style.iconSize,
                    color: widget.isDisabled 
                        ? style.colors.icon.withOpacity(0.5)
                        : style.colors.icon,
                  ),
                ],
              ),
            ),
          ),
        ),
        
        // 에러 메시지
        if (widget.isError && widget.errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.errorText!,
            style: SelectBoxStyles.getTextStyle(widget.size.name, style.colors)
                .copyWith(color: ColorStyles.red30, fontSize: 12),
          ),
        ],
      ],
    );
  }
}

/// SelectBox 아이템 클래스
class SelectBoxItem<T> {
  /// 아이템의 값
  final T value;
  
  /// 화면에 표시될 라벨
  final String label;
  
  /// 아이템이 비활성화 상태인지 여부
  final bool isDisabled;
  
  /// 추가 데이터
  final Map<String, dynamic>? data;

  const SelectBoxItem({
    required this.value,
    required this.label,
    this.isDisabled = false,
    this.data,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SelectBoxItem<T> &&
        other.value == value &&
        other.label == label &&
        other.isDisabled == isDisabled;
  }

  @override
  int get hashCode {
    return value.hashCode ^ label.hashCode ^ isDisabled.hashCode;
  }
}

/// SelectBox Variant 열거형
enum SelectBoxVariant {
  primary,
  secondary,
  tertiary,
}

/// SelectBox Size 열거형
enum SelectBoxSize {
  small,
  medium,
  large,
}

/// SelectBox Theme 열거형
enum SelectBoxTheme {
  light,
  dark,
}
