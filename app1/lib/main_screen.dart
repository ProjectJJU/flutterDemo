import 'package:flutter/material.dart';
import 'commons/providers/modal/modal.provider.dart';
import 'commons/providers/next-themes/next-themes.provider.dart';
import 'commons/providers/flutter-query/flutter-query.provider.dart';
import 'commons/constants/text_styles.dart';
import 'commons/components/pagination/pagination_export.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with FlutterQueryMixin {
  final ModalProvider _modalProvider = ModalProvider();
  final NextThemesProvider _themeProvider = NextThemesProvider();
  final FlutterQueryProvider _queryProvider = FlutterQueryProvider();
  
  // Pagination 상태
  int _currentPage = 1;
  final int _totalPages = 10;

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
                backgroundColor: const Color(0xFFFFFFFF), // #FFFFFF
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
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pagination 컴포넌트 데모',
                        style: TextStyles.headline01,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        '현재 페이지: $_currentPage / $_totalPages',
                        style: TextStyles.body01,
                      ),
                      const SizedBox(height: 32),
                      
                      // Primary Pagination
                      Text(
                        'Primary Pagination',
                        style: TextStyles.title02,
                      ),
                      const SizedBox(height: 16),
                      Pagination(
                        currentPage: _currentPage,
                        totalPages: _totalPages,
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        variant: PaginationStyles.primary,
                        size: PaginationStyles.medium,
                        theme: _themeProvider.isDarkModeInContext(context) 
                            ? PaginationStyles.dark 
                            : PaginationStyles.light,
                      ),
                      const SizedBox(height: 32),
                      
                      // Secondary Pagination
                      Text(
                        'Secondary Pagination',
                        style: TextStyles.title02,
                      ),
                      const SizedBox(height: 16),
                      Pagination(
                        currentPage: _currentPage,
                        totalPages: _totalPages,
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        variant: PaginationStyles.secondary,
                        size: PaginationStyles.medium,
                        theme: _themeProvider.isDarkModeInContext(context) 
                            ? PaginationStyles.dark 
                            : PaginationStyles.light,
                      ),
                      const SizedBox(height: 32),
                      
                      // Tertiary Pagination
                      Text(
                        'Tertiary Pagination',
                        style: TextStyles.title02,
                      ),
                      const SizedBox(height: 16),
                      Pagination(
                        currentPage: _currentPage,
                        totalPages: _totalPages,
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        variant: PaginationStyles.tertiary,
                        size: PaginationStyles.medium,
                        theme: _themeProvider.isDarkModeInContext(context) 
                            ? PaginationStyles.dark 
                            : PaginationStyles.light,
                      ),
                      const SizedBox(height: 32),
                      
                      // Size variants
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Small',
                                style: TextStyles.caption01,
                              ),
                              const SizedBox(height: 8),
                              Pagination(
                                currentPage: _currentPage,
                                totalPages: _totalPages,
                                onPageChanged: (page) {
                                  setState(() {
                                    _currentPage = page;
                                  });
                                },
                                variant: PaginationStyles.primary,
                                size: PaginationStyles.small,
                                theme: _themeProvider.isDarkModeInContext(context) 
                                    ? PaginationStyles.dark 
                                    : PaginationStyles.light,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Large',
                                style: TextStyles.caption01,
                              ),
                              const SizedBox(height: 8),
                              Pagination(
                                currentPage: _currentPage,
                                totalPages: _totalPages,
                                onPageChanged: (page) {
                                  setState(() {
                                    _currentPage = page;
                                  });
                                },
                                variant: PaginationStyles.primary,
                                size: PaginationStyles.large,
                                theme: _themeProvider.isDarkModeInContext(context) 
                                    ? PaginationStyles.dark 
                                    : PaginationStyles.light,
                              ),
                            ],
                          ),
                        ],
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