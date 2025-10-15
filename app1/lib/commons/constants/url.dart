/// URL ��� ��� �� ����� ����
/// ���̳��� ������� �����ϸ�, �� ��κ� �� ������ �����մϴ�.
class AppUrls {
  // ���� ���� ���
  static const String login = '/auth/login';
  static const String signup = '/auth/signup';
  
  // �ϱ� ���� ���
  static const String diaries = '/diaries';
  static const String diaryDetail = '/diaries/:id';
  
  // ���� ���� ���
  static const String pictures = '/pictures';
  
  /// URL ��κ� �� ������ �����ϴ� ��
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
  
  /// ���̳��� ������� ���� ��� ����
  static String generatePath(String basePath, {Map<String, String>? params}) {
    String path = basePath;
    
    if (params != null) {
      params.forEach((key, value) {
        path = path.replaceAll(':$key', value);
      });
    }
    
    return path;
  }
  
  /// �ϱ� �� ������ ��� ����
  static String diaryDetailPath(String id) {
    return generatePath(diaryDetail, params: {'id': id});
  }
  
  /// ��ΰ� ��ȿ���� Ȯ��
  static bool isValidPath(String path) {
    return urlInfo.containsKey(path) || 
           (path.startsWith('/diaries/') && path != '/diaries');
  }
  
  /// ��� ���� ��ȸ
  static UrlInfo? getUrlInfo(String path) {
    // ��Ȯ�� ��� ��ġ
    if (urlInfo.containsKey(path)) {
      return urlInfo[path];
    }
    
    // ���̳��� ��� ��ġ (�ϱ� �� ������)
    if (path.startsWith('/diaries/') && path != '/diaries') {
      return urlInfo[diaryDetail];
    }
    
    return null;
  }
  
  /// ���� ������ ������� Ȯ��
  static bool isAccessible(String path, {bool isMember = false}) {
    final info = getUrlInfo(path);
    if (info == null) return false;
    
    return info.accessLevel == AccessLevel.everyone || 
           (info.accessLevel == AccessLevel.memberOnly && isMember);
  }
  
  /// ��� ��� ����� ��ȯ�մϴ�.
  static List<String> getAllPaths() {
    return urlInfo.keys.toList();
  }
  
  /// Ư�� ���� ������ ��� ����� ��ȯ�մϴ�.
  static List<String> getPathsByAccessLevel(AccessLevel level) {
    return urlInfo.entries
        .where((entry) => entry.value.accessLevel == level)
        .map((entry) => entry.key)
        .toList();
  }
}

/// ���� ���� ������
enum AccessLevel {
  /// ������ ���� ����
  everyone,
  
  /// ȸ���� ���� ����
  memberOnly,
}

/// URL ���� Ŭ����
class UrlInfo {
  /// ���
  final String path;
  
  /// ���� ���� ����
  final AccessLevel accessLevel;
  
  /// ��� ǥ�� ����
  final bool showHeader;
  
  /// �ΰ� ǥ�� ����
  final bool showLogo;
  
  /// ��ũ��� ��ȯ ��� ǥ�� ����
  final bool showDarkModeToggle;
  
  /// ��� ǥ�� ����
  final bool showBanner;
  
  /// �׺���̼� ǥ�� ����
  final bool showNavigation;
  
  /// Ǫ�� ǥ�� ����
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
  
  /// ���� �������� Ȯ���մϴ�.
  bool isAccessible({bool isMember = false}) {
    return accessLevel == AccessLevel.everyone || 
           (accessLevel == AccessLevel.memberOnly && isMember);
  }
  
  /// ����� �ʿ����� Ȯ���մϴ�.
  bool get needsHeader => showHeader;
  
  /// �ΰ� �ʿ����� Ȯ���մϴ�.
  bool get needsLogo => showLogo;
  
  /// ��ũ��� ����� �ʿ����� Ȯ���մϴ�.
  bool get needsDarkModeToggle => showDarkModeToggle;
  
  /// ��ʰ� �ʿ����� Ȯ���մϴ�.
  bool get needsBanner => showBanner;
  
  /// �׺���̼��� �ʿ����� Ȯ���մϴ�.
  bool get needsNavigation => showNavigation;
  
  /// Ǫ�Ͱ� �ʿ����� Ȯ���մϴ�.
  bool get needsFooter => showFooter;
}
