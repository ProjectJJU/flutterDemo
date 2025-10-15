import 'package:flutter/material.dart';
import 'styles.dart';

/// 공통 버튼 컴포넌트
/// 
/// variant, size, theme에 따른 완전한 variant 시스템을 제공합니다.
/// - variant: 'primary' | 'secondary' | 'tertiary'
/// - size: 'small' | 'medium' | 'large'
/// - theme: 'light' | 'dark'
class Button extends StatefulWidget {
  /// 버튼 텍스트
  final String text;
  
  /// 버튼 클릭 콜백
  final VoidCallback? onPressed;
  
  /// 버튼 variant (primary, secondary, tertiary)
  final String variant;
  
  /// 버튼 크기 (small, medium, large)
  final String size;
  
  /// 버튼 테마 (light, dark)
  final String theme;
  
  /// 버튼 비활성화 여부
  final bool disabled;
  
  /// 버튼 너비 (null이면 자동 크기)
  final double? width;
  
  /// 버튼 아이콘 (선택사항)
  final IconData? icon;
  
  /// 아이콘 위치 (leading, trailing)
  final String iconPosition;
  
  /// 로딩 상태
  final bool isLoading;

  const Button({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonStyles.primary,
    this.size = ButtonStyles.medium,
    this.theme = ButtonStyles.light,
    this.disabled = false,
    this.width,
    this.icon,
    this.iconPosition = 'trailing',
    this.isLoading = false,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = widget.disabled || widget.onPressed == null || widget.isLoading;
    
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
        widget.onPressed?.call();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        width: widget.width,
        height: ButtonStyles.getButtonHeight(widget.size),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ButtonStyles.getButtonBorderRadius(widget.size),
          ),
          color: _getBackgroundColor(isDisabled),
          border: _getBorder(isDisabled),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ButtonStyles.getButtonPadding(widget.size),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: _buildButtonContent(isDisabled),
          ),
        ),
      ),
    );
  }

  /// 버튼 배경색 반환
  Color _getBackgroundColor(bool isDisabled) {
    switch (widget.variant) {
      case ButtonStyles.primary:
        return ButtonStyles.getPrimaryBackground(
          widget.theme,
          _isPressed,
          isDisabled,
        );
      case ButtonStyles.secondary:
        return ButtonStyles.getSecondaryBackground(
          widget.theme,
          _isPressed,
          isDisabled,
        );
      case ButtonStyles.tertiary:
        return ButtonStyles.getTertiaryBackground(
          widget.theme,
          _isPressed,
          isDisabled,
        );
      default:
        return ButtonStyles.getPrimaryBackground(
          widget.theme,
          _isPressed,
          isDisabled,
        );
    }
  }

  /// 버튼 테두리 반환
  Border? _getBorder(bool isDisabled) {
    if (widget.variant == ButtonStyles.secondary) {
      return Border.all(
        color: ButtonStyles.getSecondaryBorderColor(widget.theme, isDisabled),
        width: ButtonStyles.mediumBorderWidth,
      );
    }
    return null;
  }

  /// 버튼 내용 구성
  List<Widget> _buildButtonContent(bool isDisabled) {
    final List<Widget> children = [];
    
    // 로딩 상태일 때
    if (widget.isLoading) {
      children.add(
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              ButtonStyles.getButtonTextColor(
                widget.variant,
                widget.theme,
                isDisabled,
              ),
            ),
          ),
        ),
      );
      return children;
    }
    
    // 아이콘과 텍스트 구성
    final bool hasIcon = widget.icon != null;
    final bool isLeadingIcon = widget.iconPosition == 'leading';
    
    if (hasIcon && isLeadingIcon) {
      children.add(_buildIcon(isDisabled));
      if (widget.text.isNotEmpty) {
        children.add(const SizedBox(width: 8));
      }
    }
    
    if (widget.text.isNotEmpty) {
      children.add(_buildText(isDisabled));
    }
    
    if (hasIcon && !isLeadingIcon) {
      if (widget.text.isNotEmpty) {
        children.add(const SizedBox(width: 8));
      }
      children.add(_buildIcon(isDisabled));
    }
    
    return children;
  }

  /// 버튼 텍스트 위젯
  Widget _buildText(bool isDisabled) {
    return Text(
      widget.text,
      style: ButtonStyles.getButtonTextStyle(widget.size).copyWith(
        color: ButtonStyles.getButtonTextColor(
          widget.variant,
          widget.theme,
          isDisabled,
        ),
      ),
    );
  }

  /// 버튼 아이콘 위젯
  Widget _buildIcon(bool isDisabled) {
    return Icon(
      widget.icon,
      size: _getIconSize(),
      color: ButtonStyles.getButtonTextColor(
        widget.variant,
        widget.theme,
        isDisabled,
      ),
    );
  }

  /// 아이콘 크기 반환
  double _getIconSize() {
    switch (widget.size) {
      case ButtonStyles.small:
        return 16;
      case ButtonStyles.medium:
        return 20;
      case ButtonStyles.large:
        return 24;
      default:
        return 20;
    }
  }
}

/// 버튼 팩토리 클래스
/// 
/// 자주 사용되는 버튼 조합을 쉽게 생성할 수 있는 팩토리 메서드들을 제공합니다.
class ButtonFactory {
  // Private constructor to prevent instantiation
  ButtonFactory._();

  /// Primary 버튼 생성
  static Button primary({
    required String text,
    VoidCallback? onPressed,
    String size = ButtonStyles.medium,
    String theme = ButtonStyles.light,
    bool disabled = false,
    double? width,
    IconData? icon,
    String iconPosition = 'trailing',
    bool isLoading = false,
  }) {
    return Button(
      text: text,
      onPressed: onPressed,
      variant: ButtonStyles.primary,
      size: size,
      theme: theme,
      disabled: disabled,
      width: width,
      icon: icon,
      iconPosition: iconPosition,
      isLoading: isLoading,
    );
  }

  /// Secondary 버튼 생성
  static Button secondary({
    required String text,
    VoidCallback? onPressed,
    String size = ButtonStyles.medium,
    String theme = ButtonStyles.light,
    bool disabled = false,
    double? width,
    IconData? icon,
    String iconPosition = 'trailing',
    bool isLoading = false,
  }) {
    return Button(
      text: text,
      onPressed: onPressed,
      variant: ButtonStyles.secondary,
      size: size,
      theme: theme,
      disabled: disabled,
      width: width,
      icon: icon,
      iconPosition: iconPosition,
      isLoading: isLoading,
    );
  }

  /// Tertiary 버튼 생성
  static Button tertiary({
    required String text,
    VoidCallback? onPressed,
    String size = ButtonStyles.medium,
    String theme = ButtonStyles.light,
    bool disabled = false,
    double? width,
    IconData? icon,
    String iconPosition = 'trailing',
    bool isLoading = false,
  }) {
    return Button(
      text: text,
      onPressed: onPressed,
      variant: ButtonStyles.tertiary,
      size: size,
      theme: theme,
      disabled: disabled,
      width: width,
      icon: icon,
      iconPosition: iconPosition,
      isLoading: isLoading,
    );
  }

  /// Small 버튼 생성
  static Button small({
    required String text,
    VoidCallback? onPressed,
    String variant = ButtonStyles.primary,
    String theme = ButtonStyles.light,
    bool disabled = false,
    double? width,
    IconData? icon,
    String iconPosition = 'trailing',
    bool isLoading = false,
  }) {
    return Button(
      text: text,
      onPressed: onPressed,
      variant: variant,
      size: ButtonStyles.small,
      theme: theme,
      disabled: disabled,
      width: width,
      icon: icon,
      iconPosition: iconPosition,
      isLoading: isLoading,
    );
  }

  /// Large 버튼 생성
  static Button large({
    required String text,
    VoidCallback? onPressed,
    String variant = ButtonStyles.primary,
    String theme = ButtonStyles.light,
    bool disabled = false,
    double? width,
    IconData? icon,
    String iconPosition = 'trailing',
    bool isLoading = false,
  }) {
    return Button(
      text: text,
      onPressed: onPressed,
      variant: variant,
      size: ButtonStyles.large,
      theme: theme,
      disabled: disabled,
      width: width,
      icon: icon,
      iconPosition: iconPosition,
      isLoading: isLoading,
    );
  }
}
