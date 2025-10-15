import 'package:flutter/material.dart';

/// Modal Provider
/// ��� ���� ������ ���� Provider Ŭ����
class ModalProvider extends ChangeNotifier {
  bool _isModalOpen = false;
  Widget? _modalContent;
  String? _modalTitle;

  /// ����� �����ִ��� Ȯ��
  bool get isModalOpen => _isModalOpen;

  /// ���� ��� ������
  Widget? get modalContent => _modalContent;

  /// ���� ��� ����
  String? get modalTitle => _modalTitle;

  /// ��� ����
  void openModal({
    required Widget content,
    String? title,
  }) {
    _modalContent = content;
    _modalTitle = title;
    _isModalOpen = true;
    notifyListeners();
  }

  /// ��� �ݱ�
  void closeModal() {
    _isModalOpen = false;
    _modalContent = null;
    _modalTitle = null;
    notifyListeners();
  }

  /// ��� ������ ������Ʈ
  void updateModalContent(Widget content) {
    _modalContent = content;
    notifyListeners();
  }

  /// ��� ���� ������Ʈ
  void updateModalTitle(String title) {
    _modalTitle = title;
    notifyListeners();
  }
}

/// Modal Portal Widget
/// ����� ȭ�鿡 ǥ���ϴ� ���� ����
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
/// ��� ��� �������̿� ��� �������� ǥ���ϴ� ����
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
            onTap: () {}, // ��� ������ Ŭ�� �� ������ �ʵ���
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
/// ��� ��� ���� (����� �ݱ� ��ư)
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
