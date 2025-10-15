import 'package:flutter/material.dart';
import 'styles.dart';
import '../../constants/color_styles.dart';
import '../../constants/text_styles.dart';

/// 공통 토글 컴포넌트
/// 
/// variant, size, theme에 따른 완전한 variant 시스템을 제공합니다.
/// - variant: 'primary' | 'secondary' | 'tertiary'
/// - size: 'small' | 'medium' | 'large'
/// - theme: 'light' | 'dark'
class Toggle extends StatefulWidget {
  /// 토글 상태
  final bool value;
  
  /// 토글 상태 변경 콜백
  final ValueChanged<bool>? onChanged;
  
  /// 토글 variant (primary, secondary, tertiary)
  final String variant;
  
  /// 토글 크기 (small, medium, large)
  final String size;
  
  /// 토글 테마 (light, dark)
  final String theme;
  
  /// 토글 비활성화 여부
  final bool disabled;
  
  /// 토글 라벨 텍스트 (선택사항)
  final String? label;
  
  /// 라벨 위치 (leading, trailing)
  final String labelPosition;
  
  /// 토글 너비 (null이면 자동 크기)
  final double? width;

  const Toggle({
    super.key,
    required this.value,
    this.onChanged,
    this.variant = ToggleStyles.primary,
    this.size = ToggleStyles.medium,
    this.theme = ToggleStyles.light,
    this.disabled = false,
    this.label,
    this.labelPosition = 'trailing',
    this.width,
  });

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _handleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: ToggleStyles.animationDuration,
      vsync: this,
    );
    _handleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: ToggleStyles.animationCurve,
    ));
    
    // 초기 상태 설정
    if (widget.value) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(Toggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = widget.disabled || widget.onChanged == null;
    
    return GestureDetector(
      onTapDown: isDisabled ? null : (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: isDisabled ? null : (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onChanged?.call(!widget.value);
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: _buildToggleContent(isDisabled),
    );
  }

  /// 토글 전체 내용 구성
  Widget _buildToggleContent(bool isDisabled) {
    final List<Widget> children = [];
    
    // 라벨이 있는 경우
    if (widget.label != null) {
      final bool isLeadingLabel = widget.labelPosition == 'leading';
      
      if (isLeadingLabel) {
        children.add(_buildLabel(isDisabled));
        children.add(const SizedBox(width: 12));
      }
      
      children.add(_buildToggle(isDisabled));
      
      if (!isLeadingLabel) {
        children.add(const SizedBox(width: 12));
        children.add(_buildLabel(isDisabled));
      }
      
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    }
    
    // 라벨이 없는 경우
    return _buildToggle(isDisabled);
  }

  /// 토글 위젯
  Widget _buildToggle(bool isDisabled) {
    return Container(
      width: widget.width ?? ToggleStyles.getToggleWidth(widget.size),
      height: ToggleStyles.getToggleHeight(widget.size),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ToggleStyles.getToggleBorderRadius(widget.size),
        ),
        color: ToggleStyles.getToggleBackground(
          widget.variant,
          widget.theme,
          widget.value,
          _isPressed,
          isDisabled,
        ),
      ),
      child: AnimatedBuilder(
        animation: _handleAnimation,
        builder: (context, child) {
          return Stack(
            children: [
              // 핸들
              Positioned(
                left: ToggleStyles.getHandleMargin(widget.size) + 
                      (_handleAnimation.value * 
                       (ToggleStyles.getToggleWidth(widget.size) - 
                        ToggleStyles.getHandleSize(widget.size) - 
                        (ToggleStyles.getHandleMargin(widget.size) * 2))),
                top: ToggleStyles.getHandleMargin(widget.size),
                child: Container(
                  width: ToggleStyles.getHandleSize(widget.size),
                  height: ToggleStyles.getHandleSize(widget.size),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  color: ToggleStyles.getHandleColor(
                    widget.variant,
                    widget.theme,
                    isDisabled,
                  ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// 라벨 위젯
  Widget _buildLabel(bool isDisabled) {
    return Text(
      widget.label!,
      style: _getLabelTextStyle().copyWith(
        color: isDisabled 
          ? (widget.theme == ToggleStyles.dark 
              ? ColorStyles.gray50 
              : ColorStyles.gray50)
          : (widget.theme == ToggleStyles.dark 
              ? ColorStyles.white 
              : ColorStyles.gray80),
      ),
    );
  }

  /// 라벨 텍스트 스타일 반환
  TextStyle _getLabelTextStyle() {
    switch (widget.size) {
      case ToggleStyles.small:
        return TextStyles.caption01;
      case ToggleStyles.medium:
        return TextStyles.body02Medium;
      case ToggleStyles.large:
        return TextStyles.body01;
      default:
        return TextStyles.body02Medium;
    }
  }

}

/// 토글 팩토리 클래스
/// 
/// 자주 사용되는 토글 조합을 쉽게 생성할 수 있는 팩토리 메서드들을 제공합니다.
class ToggleFactory {
  // Private constructor to prevent instantiation
  ToggleFactory._();

  /// Primary 토글 생성
  static Toggle primary({
    required bool value,
    ValueChanged<bool>? onChanged,
    String size = ToggleStyles.medium,
    String theme = ToggleStyles.light,
    bool disabled = false,
    String? label,
    String labelPosition = 'trailing',
    double? width,
  }) {
    return Toggle(
      value: value,
      onChanged: onChanged,
      variant: ToggleStyles.primary,
      size: size,
      theme: theme,
      disabled: disabled,
      label: label,
      labelPosition: labelPosition,
      width: width,
    );
  }

  /// Secondary 토글 생성
  static Toggle secondary({
    required bool value,
    ValueChanged<bool>? onChanged,
    String size = ToggleStyles.medium,
    String theme = ToggleStyles.light,
    bool disabled = false,
    String? label,
    String labelPosition = 'trailing',
    double? width,
  }) {
    return Toggle(
      value: value,
      onChanged: onChanged,
      variant: ToggleStyles.secondary,
      size: size,
      theme: theme,
      disabled: disabled,
      label: label,
      labelPosition: labelPosition,
      width: width,
    );
  }

  /// Tertiary 토글 생성
  static Toggle tertiary({
    required bool value,
    ValueChanged<bool>? onChanged,
    String size = ToggleStyles.medium,
    String theme = ToggleStyles.light,
    bool disabled = false,
    String? label,
    String labelPosition = 'trailing',
    double? width,
  }) {
    return Toggle(
      value: value,
      onChanged: onChanged,
      variant: ToggleStyles.tertiary,
      size: size,
      theme: theme,
      disabled: disabled,
      label: label,
      labelPosition: labelPosition,
      width: width,
    );
  }

  /// Small 토글 생성
  static Toggle small({
    required bool value,
    ValueChanged<bool>? onChanged,
    String variant = ToggleStyles.primary,
    String theme = ToggleStyles.light,
    bool disabled = false,
    String? label,
    String labelPosition = 'trailing',
    double? width,
  }) {
    return Toggle(
      value: value,
      onChanged: onChanged,
      variant: variant,
      size: ToggleStyles.small,
      theme: theme,
      disabled: disabled,
      label: label,
      labelPosition: labelPosition,
      width: width,
    );
  }

  /// Large 토글 생성
  static Toggle large({
    required bool value,
    ValueChanged<bool>? onChanged,
    String variant = ToggleStyles.primary,
    String theme = ToggleStyles.light,
    bool disabled = false,
    String? label,
    String labelPosition = 'trailing',
    double? width,
  }) {
    return Toggle(
      value: value,
      onChanged: onChanged,
      variant: variant,
      size: ToggleStyles.large,
      theme: theme,
      disabled: disabled,
      label: label,
      labelPosition: labelPosition,
      width: width,
    );
  }
}
