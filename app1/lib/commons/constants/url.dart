/// URL 경로 상수 및 라우팅 관리
/// 다이나믹 라우팅을 지원하며, 각 경로별 상세 정보를 관리합니다.
class AppUrls {
  // 인증 관련 경로
  static const String login = '/auth/login';
  static const String signup = '/auth/signup';
  
  // 일기 관련 경로
  static const String diaries = '/diaries';
  static const String diaryDetail = '/diaries/:id';
  
  // 사진 관련 경로
  static const String pictures = '/pictures';
  
  /// URL 경로별 상세 정보를 관리하는 맵
  static const Map<String, UrlInfo> urlInfo = {
    login: UrlInfo(
      path: login,
      accessLevel: AccessLevel.everyone,
      showHeader: false,
      showLogo: false,
      showDarkModeToggle: false,
      showBanner: false,
      showNavigation: false,
      showFooter: false,
    ),
    signup: UrlInfo(
      path: signup,
      accessLevel: AccessLevel.everyone,
      showHeader: false,
      showLogo: false,
      showDarkModeToggle: false,
      showBanner: false,
      showNavigation: false,
      showFooter: false,
    ),
    diaries: UrlInfo(
      path: diaries,
      accessLevel: AccessLevel.everyone,
      showHeader: true,
      showLogo: true,
      showDarkModeToggle: false,
      showBanner: true,
      showNavigation: true,
      showFooter: true,
    ),
    diaryDetail: UrlInfo(
      path: diaryDetail,
      accessLevel: AccessLevel.memberOnly,
      showHeader: true,
      showLogo: true,
      showDarkModeToggle: false,
      showBanner: false,
      showNavigation: false,
      showFooter: true,
    ),
    pictures: UrlInfo(
      path: pictures,
      accessLevel: AccessLevel.everyone,
      showHeader: true,
      showLogo: true,
      showDarkModeToggle: false,
      showBanner: true,
      showNavigation: true,
      showFooter: true,
    ),
  };
  
  /// 다이나믹 라우팅을 위한 경로 생성
  static String generatePath(String basePath, {Map<String, String>? params}) {
    String path = basePath;
    
    if (params != null) {
      params.forEach((key, value) {
        path = path.replaceAll(':$key', value);
      });
    }
    
    return path;
  }
  
  /// 일기 상세 페이지 경로 생성
  static String diaryDetailPath(String id) {
    return generatePath(diaryDetail, params: {'id': id});
  }
  
  /// 경로가 유효한지 확인
  static bool isValidPath(String path) {
    return urlInfo.containsKey(path) || 
           (path.startsWith('/diaries/') && path != '/diaries');
  }
  
  /// 경로 정보 조회
  static UrlInfo? getUrlInfo(String path) {
    // 정확한 경로 매치
    if (urlInfo.containsKey(path)) {
      return urlInfo[path];
    }
    
    // 다이나믹 경로 매치 (일기 상세 페이지)
    if (path.startsWith('/diaries/') && path != '/diaries') {
      return urlInfo[diaryDetail];
    }
    
    return null;
  }
  
  /// 접근 가능한 경로인지 확인
  static bool isAccessible(String path, {bool isMember = false}) {
    final info = getUrlInfo(path);
    if (info == null) return false;
    
    return info.accessLevel == AccessLevel.everyone || 
           (info.accessLevel == AccessLevel.memberOnly && isMember);
  }
  
  /// 모든 경로 목록을 반환합니다.
  static List<String> getAllPaths() {
    return urlInfo.keys.toList();
  }
  
  /// 특정 접근 레벨의 경로 목록을 반환합니다.
  static List<String> getPathsByAccessLevel(AccessLevel level) {
    return urlInfo.entries
        .where((entry) => entry.value.accessLevel == level)
        .map((entry) => entry.key)
        .toList();
  }
}

/// 접근 레벨 열거형
enum AccessLevel {
  /// 누구나 접근 가능
  everyone,
  
  /// 회원만 접근 가능
  memberOnly,
}

/// URL 정보 클래스
class UrlInfo {
  /// 경로
  final String path;
  
  /// 접근 가능 상태
  final AccessLevel accessLevel;
  
  /// 헤더 표시 여부
  final bool showHeader;
  
  /// 로고 표시 여부
  final bool showLogo;
  
  /// 다크모드 전환 토글 표시 여부
  final bool showDarkModeToggle;
  
  /// 배너 표시 여부
  final bool showBanner;
  
  /// 네비게이션 표시 여부
  final bool showNavigation;
  
  /// 푸터 표시 여부
  final bool showFooter;
  
  const UrlInfo({
    required this.path,
    required this.accessLevel,
    required this.showHeader,
    required this.showLogo,
    required this.showDarkModeToggle,
    required this.showBanner,
    required this.showNavigation,
    required this.showFooter,
  });
  
  /// 접근 가능한지 확인합니다.
  bool isAccessible({bool isMember = false}) {
    return accessLevel == AccessLevel.everyone || 
           (accessLevel == AccessLevel.memberOnly && isMember);
  }
  
  /// 헤더가 필요한지 확인합니다.
  bool get needsHeader => showHeader;
  
  /// 로고가 필요한지 확인합니다.
  bool get needsLogo => showLogo;
  
  /// 다크모드 토글이 필요한지 확인합니다.
  bool get needsDarkModeToggle => showDarkModeToggle;
  
  /// 배너가 필요한지 확인합니다.
  bool get needsBanner => showBanner;
  
  /// 네비게이션이 필요한지 확인합니다.
  bool get needsNavigation => showNavigation;
  
  /// 푸터가 필요한지 확인합니다.
  bool get needsFooter => showFooter;
}
