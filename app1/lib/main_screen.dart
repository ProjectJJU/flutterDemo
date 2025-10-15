import 'package:flutter/material.dart';
import 'commons/providers/modal/modal.provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ModalProvider _modalProvider = ModalProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _modalProvider,
      builder: (context, child) {
        return ModalPortal(
          modalProvider: _modalProvider,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Main Screen'),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hello World',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _modalProvider.openModal(
                        title: '테스트 모달',
                        content: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '모달 테스트',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('이것은 모달 콘텐츠입니다.'),
                              SizedBox(height: 10),
                              Text('내용 크기에 맞게 표시됩니다.'),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const Text('모달 열기'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
