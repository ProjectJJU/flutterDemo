import 'package:flutter/material.dart';

/// Modal Provider
/// 모달 상태 관리를 위한 Provider 클래스
class ModalProvider extends ChangeNotifier {
  bool _isModalOpen = false;
  Widget? _modalContent;
  String? _modalTitle;

  /// 모달이 열려있는지 확인
  bool get isModalOpen => _isModalOpen;

  /// 현재 모달 콘텐츠
  Widget? get modalContent => _modalContent;

  /// 현재 모달 제목
  String? get modalTitle => _modalTitle;

  /// 모달 열기
  void openModal({
    required Widget content,
    String? title,
  }) {
    _modalContent = content;
    _modalTitle = title;
    _isModalOpen = true;
    notifyListeners();
  }

  /// 모달 닫기
  void closeModal() {
    _isModalOpen = false;
    _modalContent = null;
    _modalTitle = null;
    notifyListeners();
  }

  /// 모달 콘텐츠 업데이트
  void updateModalContent(Widget content) {
    _modalContent = content;
    notifyListeners();
  }

  /// 모달 제목 업데이트
  void updateModalTitle(String title) {
    _modalTitle = title;
    notifyListeners();
  }
}

/// Modal Portal Widget
/// 모달을 화면에 표시하는 포털 위젯
class ModalPortal extends StatelessWidget {
  final Widget child;
  final ModalProvider modalProvider;

  const ModalPortal({
    super.key,
    required this.child,
    required this.modalProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (modalProvider.isModalOpen)
          _ModalOverlay(
            modalProvider: modalProvider,
          ),
      ],
    );
  }
}

/// Modal Overlay
/// 모달 배경 오버레이와 모달 콘텐츠를 표시하는 위젯
class _ModalOverlay extends StatelessWidget {
  final ModalProvider modalProvider;

  const _ModalOverlay({
    required this.modalProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: GestureDetector(
        onTap: () => modalProvider.closeModal(),
        child: Center(
          child: GestureDetector(
            onTap: () {}, // 모달 콘텐츠 클릭 시 닫히지 않도록
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400,
                maxHeight: 600,
              ),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (modalProvider.modalTitle != null)
                    _ModalHeader(
                      title: modalProvider.modalTitle!,
                      onClose: modalProvider.closeModal,
                    ),
                  Flexible(
                    child: modalProvider.modalContent ?? const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Modal Header
/// 모달 헤더 위젯 (제목과 닫기 버튼)
class _ModalHeader extends StatelessWidget {
  final String title;
  final VoidCallback onClose;

  const _ModalHeader({
    required this.title,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close),
            iconSize: 20,
          ),
        ],
      ),
    );
  }
}
