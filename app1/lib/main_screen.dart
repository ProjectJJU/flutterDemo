import 'package:flutter/material.dart';
import 'commons/providers/modal/modal.provider.dart';
import 'commons/providers/next-themes/next-themes.provider.dart';
import 'commons/providers/flutter-query/flutter-query.provider.dart';
import 'commons/constants/text_styles.dart';
import 'commons/components/searchbar/searchbar_export.dart' as searchbar;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with FlutterQueryMixin {
  final ModalProvider _modalProvider = ModalProvider();
  final NextThemesProvider _themeProvider = NextThemesProvider();
  final FlutterQueryProvider _queryProvider = FlutterQueryProvider();
  
  // SearchBar 데모용 컨트롤러들
  final TextEditingController _basicController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _primaryController = TextEditingController();
  final TextEditingController _secondaryController = TextEditingController();
  final TextEditingController _tertiaryController = TextEditingController();
  final TextEditingController _errorController = TextEditingController();
  final TextEditingController _disabledController = TextEditingController();
  
  // 검색 결과 상태
  String _searchResult = '';

  @override
  void dispose() {
    _basicController.dispose();
    _searchController.dispose();
    _primaryController.dispose();
    _secondaryController.dispose();
    _tertiaryController.dispose();
    _errorController.dispose();
    _disabledController.dispose();
    super.dispose();
  }

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
                  title: Text('SearchBar 데모'),
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
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 제목
                      Text(
                        'SearchBar 컴포넌트 데모',
                        style: TextStyles.headline01,
                      ),
                      const SizedBox(height: 24),
                      
                      // 기본 SearchBar
                      _buildSectionTitle('1. 기본 SearchBar'),
                      const SizedBox(height: 12),
                      searchbar.SearchBar(
                        label: '기본 검색',
                        placeholder: '검색어를 입력하세요',
                        controller: _basicController,
                        onChanged: (value) {
                          setState(() {
                            _searchResult = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      
                      // SearchInputField (검색 전용)
                      _buildSectionTitle('2. SearchInputField (검색 전용)'),
                      const SizedBox(height: 12),
                      searchbar.SearchInputField(
                        placeholder: '검색어를 입력해 주세요.',
                        controller: _searchController,
                        onSearch: (value) {
                          setState(() {
                            _searchResult = '검색: $value';
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      
                      // Variant 데모
                      _buildSectionTitle('3. Variant 데모'),
                      const SizedBox(height: 12),
                      
                      // Primary
                      searchbar.SearchBar(
                        label: 'Primary Variant',
                        placeholder: 'Primary 스타일',
                        controller: _primaryController,
                        variant: searchbar.SearchBarVariant.primary,
                      ),
                      const SizedBox(height: 16),
                      
                      // Secondary
                      searchbar.SearchBar(
                        label: 'Secondary Variant',
                        placeholder: 'Secondary 스타일',
                        controller: _secondaryController,
                        variant: searchbar.SearchBarVariant.secondary,
                      ),
                      const SizedBox(height: 16),
                      
                      // Tertiary
                      searchbar.SearchBar(
                        label: 'Tertiary Variant',
                        placeholder: 'Tertiary 스타일',
                        controller: _tertiaryController,
                        variant: searchbar.SearchBarVariant.tertiary,
                      ),
                      const SizedBox(height: 24),
                      
                      // Size 데모
                      _buildSectionTitle('4. Size 데모'),
                      const SizedBox(height: 12),
                      
                      searchbar.SearchBar(
                        label: 'Small Size',
                        placeholder: 'Small 크기',
                        size: searchbar.SearchBarSize.small,
                      ),
                      const SizedBox(height: 16),
                      
                      searchbar.SearchBar(
                        label: 'Medium Size',
                        placeholder: 'Medium 크기',
                        size: searchbar.SearchBarSize.medium,
                      ),
                      const SizedBox(height: 16),
                      
                      searchbar.SearchBar(
                        label: 'Large Size',
                        placeholder: 'Large 크기',
                        size: searchbar.SearchBarSize.large,
                      ),
                      const SizedBox(height: 24),
                      
                      // 에러 상태 데모
                      _buildSectionTitle('5. 에러 상태 데모'),
                      const SizedBox(height: 12),
                      searchbar.SearchBar(
                        label: '에러 상태',
                        placeholder: '에러가 있는 입력',
                        controller: _errorController,
                        errorText: '올바른 값을 입력해주세요.',
                        onChanged: (value) {
                          // 에러 상태 데모용
                        },
                      ),
                      const SizedBox(height: 24),
                      
                      // 비활성화 상태 데모
                      _buildSectionTitle('6. 비활성화 상태 데모'),
                      const SizedBox(height: 12),
                      searchbar.SearchBar(
                        label: '비활성화 상태',
                        placeholder: '비활성화된 입력',
                        controller: _disabledController,
                        enabled: false,
                      ),
                      const SizedBox(height: 24),
                      
                      // 검색 결과 표시
                      if (_searchResult.isNotEmpty) ...[
                        _buildSectionTitle('검색 결과'),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Text(
                            _searchResult,
                            style: const TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                      
                      // 하단 여백
                      const SizedBox(height: 32),
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
  
  /// 섹션 제목 위젯
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1A1A1A),
      ),
    );
  }
}