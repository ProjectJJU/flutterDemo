import 'package:flutter/material.dart';
import 'commons/providers/modal/modal.provider.dart';
import 'commons/providers/next-themes/next-themes.provider.dart';
import 'commons/providers/flutter-query/flutter-query.provider.dart';
import 'commons/constants/text_styles.dart';
import 'commons/components/searchbar/searchbar_export.dart' as searchbar;
import 'commons/components/input/input_export.dart' as input;
import 'commons/components/toggle/toggle_export.dart' as toggle;
import 'commons/components/selectbox/selectbox_export.dart' as selectbox;

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
  
  // Toggle 데모용 상태들
  bool _basicToggle = false;
  bool _primaryToggle = false;
  bool _secondaryToggle = false;
  bool _tertiaryToggle = false;
  bool _smallToggle = false;
  bool _mediumToggle = false;
  bool _largeToggle = false;
  bool _disabledToggle = false;
  bool _withLabelToggle = false;
  
  // SelectBox 데모용 상태들
  String? _selectBoxValue = '전체';
  String? _selectBoxPrimaryValue = 'option1';
  String? _selectBoxSecondaryValue = 'option1';
  String? _selectBoxTertiaryValue = 'option1';
  String? _selectBoxSmallValue = 'small1';
  String? _selectBoxMediumValue = 'medium1';
  String? _selectBoxLargeValue = 'large1';
  String? _selectBoxErrorValue = 'error1';
  String? _selectBoxDisabledValue = 'disabled1';
  
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
                backgroundColor: Theme.of(context).colorScheme.surface, 
                appBar: AppBar(
                  title: Text('SearchBar, Input & Toggle 데모'),
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
                      _buildSectionTitle('SearchBar, Input & Toggle 컴포넌트 데모'),
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
                      
                      // ============================================================================
                      // Toggle 컴포넌트 데모
                      // ============================================================================
                      
                      // Toggle 컴포넌트 섹션
                      _buildSectionTitle('8. Toggle 컴포넌트 데모'),
                      const SizedBox(height: 12),
                      
                      // 기본 Toggle
                      _buildSectionTitle('8-1. 기본 Toggle'),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          toggle.Toggle(
                            value: _basicToggle,
                            onChanged: (value) {
                              setState(() {
                                _basicToggle = value;
                              });
                            },
                          ),
                          const SizedBox(width: 16),
                          Text(
                            '기본 토글: ${_basicToggle ? "켜짐" : "꺼짐"}',
                            style: TextStyles.body01,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Toggle Variant 데모
                      _buildSectionTitle('8-2. Toggle Variant 데모'),
                      const SizedBox(height: 12),
                      
                      // Primary
                      Row(
                        children: [
                          toggle.Toggle(
                            value: _primaryToggle,
                            onChanged: (value) {
                              setState(() {
                                _primaryToggle = value;
                              });
                            },
                            variant: toggle.ToggleStyles.primary,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Primary: ${_primaryToggle ? "켜짐" : "꺼짐"}',
                            style: TextStyles.body01,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Secondary
                      Row(
                        children: [
                          toggle.Toggle(
                            value: _secondaryToggle,
                            onChanged: (value) {
                              setState(() {
                                _secondaryToggle = value;
                              });
                            },
                            variant: toggle.ToggleStyles.secondary,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Secondary: ${_secondaryToggle ? "켜짐" : "꺼짐"}',
                            style: TextStyles.body01,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Tertiary
                      Row(
                        children: [
                          toggle.Toggle(
                            value: _tertiaryToggle,
                            onChanged: (value) {
                              setState(() {
                                _tertiaryToggle = value;
                              });
                            },
                            variant: toggle.ToggleStyles.tertiary,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Tertiary: ${_tertiaryToggle ? "켜짐" : "꺼짐"}',
                            style: TextStyles.body01,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Toggle Size 데모
                      _buildSectionTitle('8-3. Toggle Size 데모'),
                      const SizedBox(height: 12),
                      
                      // Small
                      Row(
                        children: [
                          toggle.Toggle(
                            value: _smallToggle,
                            onChanged: (value) {
                              setState(() {
                                _smallToggle = value;
                              });
                            },
                            size: toggle.ToggleStyles.small,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Small: ${_smallToggle ? "켜짐" : "꺼짐"}',
                            style: TextStyles.body01,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Medium
                      Row(
                        children: [
                          toggle.Toggle(
                            value: _mediumToggle,
                            onChanged: (value) {
                              setState(() {
                                _mediumToggle = value;
                              });
                            },
                            size: toggle.ToggleStyles.medium,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Medium: ${_mediumToggle ? "켜짐" : "꺼짐"}',
                            style: TextStyles.body01,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Large
                      Row(
                        children: [
                          toggle.Toggle(
                            value: _largeToggle,
                            onChanged: (value) {
                              setState(() {
                                _largeToggle = value;
                              });
                            },
                            size: toggle.ToggleStyles.large,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Large: ${_largeToggle ? "켜짐" : "꺼짐"}',
                            style: TextStyles.body01,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Toggle with Label 데모
                      _buildSectionTitle('8-4. Toggle with Label 데모'),
                      const SizedBox(height: 12),
                      
                      toggle.Toggle(
                        value: _withLabelToggle,
                        onChanged: (value) {
                          setState(() {
                            _withLabelToggle = value;
                          });
                        },
                        label: '알림 설정',
                        labelPosition: 'leading',
                        variant: toggle.ToggleStyles.primary,
                        size: toggle.ToggleStyles.medium,
                      ),
                      const SizedBox(height: 16),
                      
                      toggle.Toggle(
                        value: _withLabelToggle,
                        onChanged: (value) {
                          setState(() {
                            _withLabelToggle = value;
                          });
                        },
                        label: '자동 저장',
                        labelPosition: 'trailing',
                        variant: toggle.ToggleStyles.secondary,
                        size: toggle.ToggleStyles.medium,
                      ),
                      const SizedBox(height: 24),
                      
                      // Toggle 비활성화 상태 데모
                      _buildSectionTitle('8-5. Toggle 비활성화 상태 데모'),
                      const SizedBox(height: 12),
                      
                      Row(
                        children: [
                          toggle.Toggle(
                            value: _disabledToggle,
                            onChanged: null, // 비활성화
                            disabled: true,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            '비활성화된 토글',
                            style: TextStyles.body01.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Toggle Factory 데모
                      _buildSectionTitle('8-6. Toggle Factory 데모'),
                      const SizedBox(height: 12),
                      
                      // Primary Factory
                      Row(
                        children: [
                          toggle.ToggleFactory.primary(
                            value: _primaryToggle,
                            onChanged: (value) {
                              setState(() {
                                _primaryToggle = value;
                              });
                            },
                            label: 'Primary Factory',
                            labelPosition: 'leading',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Secondary Factory
                      Row(
                        children: [
                          toggle.ToggleFactory.secondary(
                            value: _secondaryToggle,
                            onChanged: (value) {
                              setState(() {
                                _secondaryToggle = value;
                              });
                            },
                            label: 'Secondary Factory',
                            labelPosition: 'leading',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Small Factory
                      Row(
                        children: [
                          toggle.ToggleFactory.small(
                            value: _smallToggle,
                            onChanged: (value) {
                              setState(() {
                                _smallToggle = value;
                              });
                            },
                            label: 'Small Factory',
                            labelPosition: 'leading',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Large Factory
                      Row(
                        children: [
                          toggle.ToggleFactory.large(
                            value: _largeToggle,
                            onChanged: (value) {
                              setState(() {
                                _largeToggle = value;
                              });
                            },
                            label: 'Large Factory',
                            labelPosition: 'leading',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // ============================================================================
                      // 9. SelectBox 컴포넌트 데모
                      // ============================================================================
                      
                      _buildSectionTitle('9. SelectBox 컴포넌트 데모'),
                      const SizedBox(height: 12),
                      
                      // Basic SelectBox
                      selectbox.SelectBox<String>(
                        value: _selectBoxValue,
                        onChanged: (value) {
                          setState(() {
                            _selectBoxValue = value;
                          });
                        },
                        items: const [
                          selectbox.SelectBoxItem(value: '전체', label: '전체'),
                          selectbox.SelectBoxItem(value: '행복해요', label: '행복해요'),
                          selectbox.SelectBoxItem(value: '슬퍼요', label: '슬퍼요'),
                          selectbox.SelectBoxItem(value: '놀랐어요', label: '놀랐어요'),
                          selectbox.SelectBoxItem(value: '화나요', label: '화나요'),
                          selectbox.SelectBoxItem(value: '기타', label: '기타'),
                        ],
                        hintText: '감정을 선택하세요',
                        label: '감정 선택',
                        isRequired: true,
                      ),
                      const SizedBox(height: 16),
                      
                      // SelectBox Variant 데모
                      _buildSectionTitle('9-1. SelectBox Variant 데모'),
                      const SizedBox(height: 12),
                      
                      // Primary
                      selectbox.SelectBox<String>(
                        value: _selectBoxPrimaryValue,
                        onChanged: (value) {
                          setState(() {
                            _selectBoxPrimaryValue = value;
                          });
                        },
                        items: const [
                          selectbox.SelectBoxItem(value: 'option1', label: '옵션 1'),
                          selectbox.SelectBoxItem(value: 'option2', label: '옵션 2'),
                          selectbox.SelectBoxItem(value: 'option3', label: '옵션 3'),
                        ],
                        variant: selectbox.SelectBoxVariant.primary,
                        hintText: 'Primary SelectBox',
                      ),
                      const SizedBox(height: 16),
                      
                      // Secondary
                      selectbox.SelectBox<String>(
                        value: _selectBoxSecondaryValue,
                        onChanged: (value) {
                          setState(() {
                            _selectBoxSecondaryValue = value;
                          });
                        },
                        items: const [
                          selectbox.SelectBoxItem(value: 'option1', label: '옵션 1'),
                          selectbox.SelectBoxItem(value: 'option2', label: '옵션 2'),
                          selectbox.SelectBoxItem(value: 'option3', label: '옵션 3'),
                        ],
                        variant: selectbox.SelectBoxVariant.secondary,
                        hintText: 'Secondary SelectBox',
                      ),
                      const SizedBox(height: 16),
                      
                      // Tertiary
                      selectbox.SelectBox<String>(
                        value: _selectBoxTertiaryValue,
                        onChanged: (value) {
                          setState(() {
                            _selectBoxTertiaryValue = value;
                          });
                        },
                        items: const [
                          selectbox.SelectBoxItem(value: 'option1', label: '옵션 1'),
                          selectbox.SelectBoxItem(value: 'option2', label: '옵션 2'),
                          selectbox.SelectBoxItem(value: 'option3', label: '옵션 3'),
                        ],
                        variant: selectbox.SelectBoxVariant.tertiary,
                        hintText: 'Tertiary SelectBox',
                      ),
                      const SizedBox(height: 24),
                      
                      // SelectBox Size 데모
                      _buildSectionTitle('9-2. SelectBox Size 데모'),
                      const SizedBox(height: 12),
                      
                      // Small
                      selectbox.SelectBox<String>(
                        value: _selectBoxSmallValue,
                        onChanged: (value) {
                          setState(() {
                            _selectBoxSmallValue = value;
                          });
                        },
                        items: const [
                          selectbox.SelectBoxItem(value: 'small1', label: 'Small 옵션 1'),
                          selectbox.SelectBoxItem(value: 'small2', label: 'Small 옵션 2'),
                        ],
                        size: selectbox.SelectBoxSize.small,
                        hintText: 'Small SelectBox',
                      ),
                      const SizedBox(height: 16),
                      
                      // Medium
                      selectbox.SelectBox<String>(
                        value: _selectBoxMediumValue,
                        onChanged: (value) {
                          setState(() {
                            _selectBoxMediumValue = value;
                          });
                        },
                        items: const [
                          selectbox.SelectBoxItem(value: 'medium1', label: 'Medium 옵션 1'),
                          selectbox.SelectBoxItem(value: 'medium2', label: 'Medium 옵션 2'),
                        ],
                        size: selectbox.SelectBoxSize.medium,
                        hintText: 'Medium SelectBox',
                      ),
                      const SizedBox(height: 16),
                      
                      // Large
                      selectbox.SelectBox<String>(
                        value: _selectBoxLargeValue,
                        onChanged: (value) {
                          setState(() {
                            _selectBoxLargeValue = value;
                          });
                        },
                        items: const [
                          selectbox.SelectBoxItem(value: 'large1', label: 'Large 옵션 1'),
                          selectbox.SelectBoxItem(value: 'large2', label: 'Large 옵션 2'),
                        ],
                        size: selectbox.SelectBoxSize.large,
                        hintText: 'Large SelectBox',
                      ),
                      const SizedBox(height: 24),
                      
                      // SelectBox 상태 데모
                      _buildSectionTitle('9-3. SelectBox 상태 데모'),
                      const SizedBox(height: 12),
                      
                      // Error
                      selectbox.SelectBox<String>(
                        value: _selectBoxErrorValue,
                        onChanged: (value) {
                          setState(() {
                            _selectBoxErrorValue = value;
                          });
                        },
                        items: const [
                          selectbox.SelectBoxItem(value: 'error1', label: '에러 옵션 1'),
                          selectbox.SelectBoxItem(value: 'error2', label: '에러 옵션 2'),
                        ],
                        isError: true,
                        errorText: '필수 선택 항목입니다',
                        hintText: 'Error SelectBox',
                      ),
                      const SizedBox(height: 16),
                      
                      // Disabled
                      selectbox.SelectBox<String>(
                        value: _selectBoxDisabledValue,
                        onChanged: (value) {
                          setState(() {
                            _selectBoxDisabledValue = value;
                          });
                        },
                        items: const [
                          selectbox.SelectBoxItem(value: 'disabled1', label: '비활성 옵션 1'),
                          selectbox.SelectBoxItem(value: 'disabled2', label: '비활성 옵션 2'),
                        ],
                        isDisabled: true,
                        hintText: 'Disabled SelectBox',
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
    return Builder(
      builder: (context) => Text(
        title,
        style: TextStyles.headline01.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}