import 'package:flutter/material.dart';
import 'commons/providers/modal/modal.provider.dart';
import 'commons/providers/next-themes/next-themes.provider.dart';
import 'commons/providers/flutter-query/flutter-query.provider.dart';
import 'commons/constants/text_styles.dart';
import 'commons/components/searchbar/searchbar_export.dart' as searchbar;
import 'commons/components/input/input_export.dart' as input;

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
  
  // Input 데모용 컨트롤러들
  final TextEditingController _inputBasicController = TextEditingController();
  final TextEditingController _inputPrimaryController = TextEditingController();
  final TextEditingController _inputSecondaryController = TextEditingController();
  final TextEditingController _inputTertiaryController = TextEditingController();
  final TextEditingController _inputErrorController = TextEditingController();
  final TextEditingController _inputDisabledController = TextEditingController();
  
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
    
    _inputBasicController.dispose();
    _inputPrimaryController.dispose();
    _inputSecondaryController.dispose();
    _inputTertiaryController.dispose();
    _inputErrorController.dispose();
    _inputDisabledController.dispose();
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
                backgroundColor: _themeProvider.isDarkModeInContext(context) 
                  ? const Color(0xFF1C1C1C) // 다크 모드 배경색
                  : const Color(0xFFFFFFFF), // 라이트 모드 배경색
                appBar: AppBar(
                  title: Text('SearchBar & Input 데모'),
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
                        'SearchBar & Input 컴포넌트 데모',
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
                            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            _searchResult,
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                      
                      // ============================================================================
                      // Input 컴포넌트 데모
                      // ============================================================================
                      
                      // Input 컴포넌트 섹션
                      _buildSectionTitle('7. Input 컴포넌트 데모'),
                      const SizedBox(height: 12),
                      
                      // 기본 Input
                      _buildSectionTitle('7-1. 기본 Input'),
                      const SizedBox(height: 12),
                      input.Input(
                        label: '기본 입력',
                        placeholder: '텍스트를 입력하세요',
                        controller: _inputBasicController,
                        onChanged: (value) {
                          setState(() {
                            _searchResult = 'Input: $value';
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      
                      // InputField (간단한 사용)
                      _buildSectionTitle('7-2. InputField (간단한 사용)'),
                      const SizedBox(height: 12),
                      input.InputField(
                        label: '간단한 입력',
                        placeHolder: '간단한 입력 필드',
                        controller: TextEditingController(),
                      ),
                      const SizedBox(height: 24),
                      
                      // Input Variant 데모
                      _buildSectionTitle('7-3. Input Variant 데모'),
                      const SizedBox(height: 12),
                      
                      // Primary
                      input.Input(
                        label: 'Primary Variant',
                        placeholder: 'Primary 스타일',
                        controller: _inputPrimaryController,
                        variant: input.InputVariant.primary,
                      ),
                      const SizedBox(height: 16),
                      
                      // Secondary
                      input.Input(
                        label: 'Secondary Variant',
                        placeholder: 'Secondary 스타일',
                        controller: _inputSecondaryController,
                        variant: input.InputVariant.secondary,
                      ),
                      const SizedBox(height: 16),
                      
                      // Tertiary
                      input.Input(
                        label: 'Tertiary Variant',
                        placeholder: 'Tertiary 스타일',
                        controller: _inputTertiaryController,
                        variant: input.InputVariant.tertiary,
                      ),
                      const SizedBox(height: 24),
                      
                      // Input Size 데모
                      _buildSectionTitle('7-4. Input Size 데모'),
                      const SizedBox(height: 12),
                      
                      input.Input(
                        label: 'Small Size',
                        placeholder: 'Small 크기',
                        size: input.InputSize.small,
                      ),
                      const SizedBox(height: 16),
                      
                      input.Input(
                        label: 'Medium Size',
                        placeholder: 'Medium 크기',
                        size: input.InputSize.medium,
                      ),
                      const SizedBox(height: 16),
                      
                      input.Input(
                        label: 'Large Size',
                        placeholder: 'Large 크기',
                        size: input.InputSize.large,
                      ),
                      const SizedBox(height: 24),
                      
                      // Input 에러 상태 데모
                      _buildSectionTitle('7-5. Input 에러 상태 데모'),
                      const SizedBox(height: 12),
                      input.Input(
                        label: '에러 상태',
                        placeholder: '에러가 있는 입력',
                        controller: _inputErrorController,
                        errorText: '올바른 값을 입력해주세요.',
                        onChanged: (value) {
                          // 에러 상태 데모용
                        },
                      ),
                      const SizedBox(height: 24),
                      
                      // Input 비활성화 상태 데모
                      _buildSectionTitle('7-6. Input 비활성화 상태 데모'),
                      const SizedBox(height: 12),
                      input.Input(
                        label: '비활성화 상태',
                        placeholder: '비활성화된 입력',
                        controller: _inputDisabledController,
                        enabled: false,
                      ),
                      const SizedBox(height: 24),
                      
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
      style: TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}