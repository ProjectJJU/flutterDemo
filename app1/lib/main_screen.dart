import 'package:flutter/material.dart';
import 'commons/providers/modal/modal.provider.dart';
import 'commons/providers/next-themes/next-themes.provider.dart';
import 'commons/providers/flutter-query/flutter-query.provider.dart';
import 'commons/constants/text_styles.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with FlutterQueryMixin {
  final ModalProvider _modalProvider = ModalProvider();
  final NextThemesProvider _themeProvider = NextThemesProvider();
  final FlutterQueryProvider _queryProvider = FlutterQueryProvider();

  @override
  Widget build(BuildContext context) {
    return FlutterQueryWrapper(
      queryProvider: _queryProvider,
      child: NextThemesWrapper(
        themeProvider: _themeProvider,
        child: ListenableBuilder(
          listenable: _modalProvider,
          builder: (context, child) {
            return ModalPortal(
              modalProvider: _modalProvider,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Main'),
                  actions: [
                    IconButton(
                      icon: Icon(_themeProvider.isDarkModeInContext(context) 
                        ? Icons.light_mode 
                        : Icons.dark_mode),
                      onPressed: () {
                        _themeProvider.toggleTheme();
                      },
                    ),
                  ],
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello World',
                        style: TextStyles.body01,
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
                                    style: TextStyles.body01,
                                  ),
                                  SizedBox(height: 10),
                                  Text('이것은 모달 콘텐츠입니다.', style: TextStyles.body01),
                                  SizedBox(height: 10),
                                  Text('내용 크기에 맞게 표시됩니다.', style: TextStyles.body01),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Text('모달 열기', style: TextStyles.body01),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            final result = await useQuery<String>(
                              queryKey: 'test-query',
                              queryFn: () async {
                                await Future.delayed(Duration(seconds: 2));
                                return '캐시된 데이터: ${DateTime.now().toString()}';
                              },
                              staleTime: Duration(minutes: 5),
                              cacheTime: Duration(minutes: 10),
                            );
                            
                            _modalProvider.openModal(
                              title: 'Flutter Query 테스트',
                              content: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '쿼리 결과',
                                      style: TextStyles.body01,
                                    ),
                                    SizedBox(height: 10),
                                    Text(result, style: TextStyles.body01),
                                    SizedBox(height: 10),
                                    Text('캐시 크기: ${_queryProvider.cacheSize}', style: TextStyles.body01),
                                    Text('활성 쿼리: ${_queryProvider.activeQueriesCount}', style: TextStyles.body01),
                                  ],
                                ),
                              ),
                            );
                          } catch (e) {
                            _modalProvider.openModal(
                              title: '에러',
                              content: Padding(
                                padding: EdgeInsets.all(16),
                                child: Text('쿼리 실행 중 에러: $e', style: TextStyles.body01),
                              ),
                            );
                          }
                        },
                        child: Text('Flutter Query 테스트', style: TextStyles.body01),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}