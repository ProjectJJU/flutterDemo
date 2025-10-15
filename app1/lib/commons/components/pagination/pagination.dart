import 'package:flutter/material.dart';
import 'styles.dart';

/// 공통 페이지네이션 컴포넌트
/// 
/// variant, size, theme에 따른 완전한 variant 시스템을 제공합니다.
/// - variant: 'primary' | 'secondary' | 'tertiary'
/// - size: 'small' | 'medium' | 'large'
/// - theme: 'light' | 'dark'
class Pagination extends StatefulWidget {
  /// 현재 페이지 번호 (1부터 시작)
  final int currentPage;
  
  /// 전체 페이지 수
  final int totalPages;
  
  /// 페이지 변경 콜백
  final Function(int page)? onPageChanged;
  
  /// 페이지네이션 variant (primary, secondary, tertiary)
  final String variant;
  
  /// 페이지네이션 크기 (small, medium, large)
  final String size;
  
  /// 페이지네이션 테마 (light, dark)
  final String theme;
  
  /// 이전/다음 버튼 비활성화 여부
  final bool disabled;
  
  /// 표시할 최대 페이지 번호 수 (기본값: 5)
  final int maxVisiblePages;
  
  /// 이전 버튼 텍스트 (기본값: null, 아이콘 사용)
  final String? previousText;
  
  /// 다음 버튼 텍스트 (기본값: null, 아이콘 사용)
  final String? nextText;
  
  /// 이전 버튼 아이콘 (기본값: Icons.chevron_left)
  final IconData? previousIcon;
  
  /// 다음 버튼 아이콘 (기본값: Icons.chevron_right)
  final IconData? nextIcon;

  const Pagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.onPageChanged,
    this.variant = PaginationStyles.primary,
    this.size = PaginationStyles.medium,
    this.theme = PaginationStyles.light,
    this.disabled = false,
    this.maxVisiblePages = 5,
    this.previousText,
    this.nextText,
    this.previousIcon,
    this.nextIcon,
  }) : assert(currentPage >= 1 && currentPage <= totalPages),
       assert(totalPages > 0),
       assert(maxVisiblePages > 0);

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.currentPage;
  }

  @override
  void didUpdateWidget(Pagination oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentPage != oldWidget.currentPage) {
      _currentPage = widget.currentPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.totalPages <= 1) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildPreviousButton(),
        SizedBox(width: PaginationStyles.getPageButtonSpacing(widget.size)),
        _buildPageNumbers(),
        SizedBox(width: PaginationStyles.getPageButtonSpacing(widget.size)),
        _buildNextButton(),
      ],
    );
  }

  /// 이전 버튼 구성
  Widget _buildPreviousButton() {
    final bool isDisabled = widget.disabled || _currentPage <= 1;
    
    return _buildArrowButton(
      icon: widget.previousIcon ?? Icons.chevron_left,
      text: widget.previousText,
      isDisabled: isDisabled,
      onPressed: isDisabled ? null : () => _goToPage(_currentPage - 1),
    );
  }

  /// 다음 버튼 구성
  Widget _buildNextButton() {
    final bool isDisabled = widget.disabled || _currentPage >= widget.totalPages;
    
    return _buildArrowButton(
      icon: widget.nextIcon ?? Icons.chevron_right,
      text: widget.nextText,
      isDisabled: isDisabled,
      onPressed: isDisabled ? null : () => _goToPage(_currentPage + 1),
    );
  }

  /// 화살표 버튼 구성
  Widget _buildArrowButton({
    required IconData icon,
    String? text,
    required bool isDisabled,
    VoidCallback? onPressed,
  }) {
    final double arrowSize = PaginationStyles.getArrowButtonSize(widget.size);
    final Color arrowColor = PaginationStyles.getArrowColor(
      widget.variant,
      widget.theme,
      isDisabled,
    );

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: arrowSize,
        height: arrowSize,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: text != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: arrowSize * 0.8, color: arrowColor),
                  const SizedBox(width: 4),
                  Text(
                    text,
                    style: PaginationStyles.getPageNumberTextStyle(widget.size).copyWith(
                      color: arrowColor,
                    ),
                  ),
                ],
              )
            : Icon(icon, size: arrowSize * 0.8, color: arrowColor),
      ),
    );
  }

  /// 페이지 번호들 구성
  Widget _buildPageNumbers() {
    final List<int> visiblePages = _getVisiblePages();
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: visiblePages.map((page) {
        final bool isCurrentPage = page == _currentPage;
        final bool isDisabled = widget.disabled;
        
        return Padding(
          padding: EdgeInsets.only(
            right: page < visiblePages.last 
                ? PaginationStyles.getPageButtonSpacing(widget.size) 
                : 0,
          ),
          child: _buildPageButton(
            page: page,
            isCurrentPage: isCurrentPage,
            isDisabled: isDisabled,
          ),
        );
      }).toList(),
    );
  }

  /// 페이지 버튼 구성
  Widget _buildPageButton({
    required int page,
    required bool isCurrentPage,
    required bool isDisabled,
  }) {
    final Color backgroundColor = isCurrentPage
        ? PaginationStyles.getActiveBackground(widget.variant, widget.theme)
        : PaginationStyles.getInactiveBackground(widget.variant, widget.theme);
    
    final Color textColor = isCurrentPage
        ? PaginationStyles.getActiveTextColor(widget.variant, widget.theme)
        : PaginationStyles.getInactiveTextColor(widget.variant, widget.theme);
    
    final TextStyle textStyle = isCurrentPage
        ? PaginationStyles.getActivePageTextStyle(widget.size)
        : PaginationStyles.getInactivePageTextStyle(widget.size);

    return GestureDetector(
      onTap: isDisabled ? null : () => _goToPage(page),
      child: Container(
        width: PaginationStyles.getPageButtonSize(widget.size),
        height: PaginationStyles.getPageButtonSize(widget.size),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            PaginationStyles.getPageButtonBorderRadius(widget.size),
          ),
        ),
        child: Center(
          child: Text(
            page.toString(),
            style: textStyle.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }

  /// 표시할 페이지 번호들 계산
  List<int> _getVisiblePages() {
    final int totalPages = widget.totalPages;
    final int maxVisible = widget.maxVisiblePages;
    final int current = _currentPage;
    
    if (totalPages <= maxVisible) {
      return List.generate(totalPages, (index) => index + 1);
    }
    
    final int halfVisible = maxVisible ~/ 2;
    int start = (current - halfVisible).clamp(1, totalPages - maxVisible + 1);
    int end = (start + maxVisible - 1).clamp(maxVisible, totalPages);
    
    // 끝에서 시작점 조정
    if (end == totalPages) {
      start = (totalPages - maxVisible + 1).clamp(1, totalPages);
    }
    
    return List.generate(end - start + 1, (index) => start + index);
  }

  /// 페이지 이동
  void _goToPage(int page) {
    if (page >= 1 && page <= widget.totalPages && page != _currentPage) {
      setState(() {
        _currentPage = page;
      });
      widget.onPageChanged?.call(page);
    }
  }
}

/// 페이지네이션 팩토리 클래스
/// 
/// 자주 사용되는 페이지네이션 조합을 쉽게 생성할 수 있는 팩토리 메서드들을 제공합니다.
class PaginationFactory {
  // Private constructor to prevent instantiation
  PaginationFactory._();

  /// Primary 페이지네이션 생성
  static Pagination primary({
    required int currentPage,
    required int totalPages,
    Function(int page)? onPageChanged,
    String size = PaginationStyles.medium,
    String theme = PaginationStyles.light,
    bool disabled = false,
    int maxVisiblePages = 5,
    String? previousText,
    String? nextText,
    IconData? previousIcon,
    IconData? nextIcon,
  }) {
    return Pagination(
      currentPage: currentPage,
      totalPages: totalPages,
      onPageChanged: onPageChanged,
      variant: PaginationStyles.primary,
      size: size,
      theme: theme,
      disabled: disabled,
      maxVisiblePages: maxVisiblePages,
      previousText: previousText,
      nextText: nextText,
      previousIcon: previousIcon,
      nextIcon: nextIcon,
    );
  }

  /// Secondary 페이지네이션 생성
  static Pagination secondary({
    required int currentPage,
    required int totalPages,
    Function(int page)? onPageChanged,
    String size = PaginationStyles.medium,
    String theme = PaginationStyles.light,
    bool disabled = false,
    int maxVisiblePages = 5,
    String? previousText,
    String? nextText,
    IconData? previousIcon,
    IconData? nextIcon,
  }) {
    return Pagination(
      currentPage: currentPage,
      totalPages: totalPages,
      onPageChanged: onPageChanged,
      variant: PaginationStyles.secondary,
      size: size,
      theme: theme,
      disabled: disabled,
      maxVisiblePages: maxVisiblePages,
      previousText: previousText,
      nextText: nextText,
      previousIcon: previousIcon,
      nextIcon: nextIcon,
    );
  }

  /// Tertiary 페이지네이션 생성
  static Pagination tertiary({
    required int currentPage,
    required int totalPages,
    Function(int page)? onPageChanged,
    String size = PaginationStyles.medium,
    String theme = PaginationStyles.light,
    bool disabled = false,
    int maxVisiblePages = 5,
    String? previousText,
    String? nextText,
    IconData? previousIcon,
    IconData? nextIcon,
  }) {
    return Pagination(
      currentPage: currentPage,
      totalPages: totalPages,
      onPageChanged: onPageChanged,
      variant: PaginationStyles.tertiary,
      size: size,
      theme: theme,
      disabled: disabled,
      maxVisiblePages: maxVisiblePages,
      previousText: previousText,
      nextText: nextText,
      previousIcon: previousIcon,
      nextIcon: nextIcon,
    );
  }

  /// Small 페이지네이션 생성
  static Pagination small({
    required int currentPage,
    required int totalPages,
    Function(int page)? onPageChanged,
    String variant = PaginationStyles.primary,
    String theme = PaginationStyles.light,
    bool disabled = false,
    int maxVisiblePages = 5,
    String? previousText,
    String? nextText,
    IconData? previousIcon,
    IconData? nextIcon,
  }) {
    return Pagination(
      currentPage: currentPage,
      totalPages: totalPages,
      onPageChanged: onPageChanged,
      variant: variant,
      size: PaginationStyles.small,
      theme: theme,
      disabled: disabled,
      maxVisiblePages: maxVisiblePages,
      previousText: previousText,
      nextText: nextText,
      previousIcon: previousIcon,
      nextIcon: nextIcon,
    );
  }

  /// Large 페이지네이션 생성
  static Pagination large({
    required int currentPage,
    required int totalPages,
    Function(int page)? onPageChanged,
    String variant = PaginationStyles.primary,
    String theme = PaginationStyles.light,
    bool disabled = false,
    int maxVisiblePages = 5,
    String? previousText,
    String? nextText,
    IconData? previousIcon,
    IconData? nextIcon,
  }) {
    return Pagination(
      currentPage: currentPage,
      totalPages: totalPages,
      onPageChanged: onPageChanged,
      variant: variant,
      size: PaginationStyles.large,
      theme: theme,
      disabled: disabled,
      maxVisiblePages: maxVisiblePages,
      previousText: previousText,
      nextText: nextText,
      previousIcon: previousIcon,
      nextIcon: nextIcon,
    );
  }
}
