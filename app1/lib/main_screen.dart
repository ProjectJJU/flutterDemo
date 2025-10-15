import 'package:flutter/material.dart';
import 'commons/providers/modal/modal.provider.dart';
import 'commons/constants/text_styles.dart';

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
              title: Text('Main',
                                style: TextStyles.body01.copyWith(
                color: Colors.black,
              ),             
              ),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello World',
                    style: TextStyles.body01.copyWith(
                color: Colors.black,
              ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _modalProvider.openModal(
                        title: '테스트 모달',                        
                        content: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '모달 테스트',
                                style: TextStyles.body01.copyWith(
                color: Colors.black,
              ),
                              ),
                              SizedBox(height: 10),
                              Text('이것은 모달 콘텐츠입니다.',style: TextStyles.body01.copyWith(
                color: Colors.black,
              )),
                              SizedBox(height: 10),
                              Text('내용 크기에 맞게 표시됩니다.',style: TextStyles.body01.copyWith(
                color: Colors.black,
              )),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text('모달 열기',style: TextStyles.body01.copyWith(
                color: Colors.black,
              )),
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