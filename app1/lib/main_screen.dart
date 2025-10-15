import 'package:flutter/material.dart';
import 'commons/providers/modal/modal.provider.dart';
import 'commons/providers/next-themes/next-themes.provider.dart';
import 'commons/providers/flutter-query/flutter-query.provider.dart';
import 'commons/constants/text_styles.dart';
import 'commons/components/button/button_export.dart';

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
                      ButtonFactory.primary(
                        text: '모달 열기',
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
                      ),
                      const SizedBox(height: 20),
                      ButtonFactory.secondary(
                        text: 'Flutter Query 테스트',
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
                      ),
                      const SizedBox(height: 20),
                      // 다양한 버튼 예제들
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonFactory.small(
                            text: 'Small',
                            onPressed: () {
                              _modalProvider.openModal(
                                title: 'Small 버튼',
                                content: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('Small 크기 버튼이 클릭되었습니다!', style: TextStyles.body01),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 12),
                          ButtonFactory.secondary(
                            text: 'Medium',
                            onPressed: () {
                              _modalProvider.openModal(
                                title: 'Medium 버튼',
                                content: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('Medium 크기 버튼이 클릭되었습니다!', style: TextStyles.body01),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 12),
                          ButtonFactory.large(
                            text: 'Large',
                            onPressed: () {
                              _modalProvider.openModal(
                                title: 'Large 버튼',
                                content: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('Large 크기 버튼이 클릭되었습니다!', style: TextStyles.body01),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // 아이콘이 있는 버튼들
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonFactory.primary(
                            text: '추가',
                            icon: Icons.add,
                            iconPosition: 'leading',
                            onPressed: () {
                              _modalProvider.openModal(
                                title: '추가 버튼',
                                content: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('아이콘이 있는 Primary 버튼이 클릭되었습니다!', style: TextStyles.body01),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 12),
                          ButtonFactory.secondary(
                            text: '저장',
                            icon: Icons.save,
                            iconPosition: 'trailing',
                            onPressed: () {
                              _modalProvider.openModal(
                                title: '저장 버튼',
                                content: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('아이콘이 있는 Secondary 버튼이 클릭되었습니다!', style: TextStyles.body01),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // 로딩 버튼 예제
                      ButtonFactory.primary(
                        text: '로딩 테스트',
                        isLoading: true,
                        onPressed: () {
                          // 로딩 중이므로 실행되지 않음
                        },
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