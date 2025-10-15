import 'package:flutter/material.dart';
import 'dart:async';

/// 캐시 아이템 클래스
class CacheItem {
  final dynamic data;
  final DateTime timestamp;
  final Duration? staleTime;
  final Duration? cacheTime;

  CacheItem({
    required this.data,
    required this.timestamp,
    this.staleTime,
    this.cacheTime,
  });

  bool get isStale {
    if (staleTime == null) return false;
    return DateTime.now().difference(timestamp) > staleTime!;
  }

  bool get isExpired {
    if (cacheTime == null) return false;
    return DateTime.now().difference(timestamp) > cacheTime!;
  }
}

/// 쿼리 상태 클래스
class QueryState {
  final String queryKey;
  bool isLoading;
  bool isError;
  String? errorMessage;
  dynamic data;

  QueryState({
    required this.queryKey,
    this.isLoading = false,
    this.isError = false,
    this.errorMessage,
    this.data,
  });
}

/// Flutter Query Provider
/// 클라이언트 캐싱 구조를 제공하는 Provider
class FlutterQueryProvider extends ChangeNotifier {
  static final FlutterQueryProvider _instance = FlutterQueryProvider._internal();
  factory FlutterQueryProvider() => _instance;
  FlutterQueryProvider._internal();

  // 캐시 저장소
  final Map<String, CacheItem> _cache = {};
  
  // 쿼리 상태 관리
  final Map<String, QueryState> _queryStates = {};

  /// 쿼리 실행 및 캐싱
  Future<T> query<T>({
    required String queryKey,
    required Future<T> Function() queryFn,
    Duration? staleTime,
    Duration? cacheTime,
    bool refetchOnMount = true,
  }) async {
    // 기존 캐시 확인
    final cachedItem = _cache[queryKey];
    if (cachedItem != null && !cachedItem.isExpired && !cachedItem.isStale) {
      _queryStates[queryKey] = QueryState(
        queryKey: queryKey,
        data: cachedItem.data,
        isLoading: false,
        isError: false,
      );
      notifyListeners();
      return cachedItem.data as T;
    }

    // 쿼리 상태 업데이트
    _queryStates[queryKey] = QueryState(
      queryKey: queryKey,
      isLoading: true,
      isError: false,
    );
    notifyListeners();

    try {
      // 쿼리 실행
      final result = await queryFn();
      
      // 캐시에 저장
      _cache[queryKey] = CacheItem(
        data: result,
        timestamp: DateTime.now(),
        staleTime: staleTime,
        cacheTime: cacheTime,
      );

      // 쿼리 상태 업데이트
      _queryStates[queryKey] = QueryState(
        queryKey: queryKey,
        data: result,
        isLoading: false,
        isError: false,
      );
      
      notifyListeners();
      return result;
    } catch (error) {
      // 에러 상태 업데이트
      _queryStates[queryKey] = QueryState(
        queryKey: queryKey,
        isLoading: false,
        isError: true,
        errorMessage: error.toString(),
      );
      
      notifyListeners();
      rethrow;
    }
  }

  /// 쿼리 무효화
  void invalidateQuery(String queryKey) {
    _cache.remove(queryKey);
    _queryStates.remove(queryKey);
    notifyListeners();
  }

  /// 모든 쿼리 무효화
  void invalidateAllQueries() {
    _cache.clear();
    _queryStates.clear();
    notifyListeners();
  }

  /// 쿼리 상태 가져오기
  QueryState? getQueryState(String queryKey) {
    return _queryStates[queryKey];
  }

  /// 캐시된 데이터 가져오기
  T? getCachedData<T>(String queryKey) {
    final cachedItem = _cache[queryKey];
    if (cachedItem != null && !cachedItem.isExpired) {
      return cachedItem.data as T?;
    }
    return null;
  }

  /// 캐시 크기 가져오기
  int get cacheSize => _cache.length;

  /// 활성 쿼리 수 가져오기
  int get activeQueriesCount => _queryStates.length;
}

/// Flutter Query Wrapper 위젯
class FlutterQueryWrapper extends StatefulWidget {
  final Widget child;
  final FlutterQueryProvider? queryProvider;

  const FlutterQueryWrapper({
    super.key,
    required this.child,
    this.queryProvider,
  });

  @override
  State<FlutterQueryWrapper> createState() => _FlutterQueryWrapperState();
}

class _FlutterQueryWrapperState extends State<FlutterQueryWrapper> {
  late FlutterQueryProvider _queryProvider;

  @override
  void initState() {
    super.initState();
    _queryProvider = widget.queryProvider ?? FlutterQueryProvider();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _queryProvider,
      builder: (context, child) {
        return widget.child;
      },
    );
  }
}

/// Flutter Query Hook을 사용하기 위한 Mixin
mixin FlutterQueryMixin<T extends StatefulWidget> on State<T> {
  FlutterQueryProvider get queryProvider => FlutterQueryProvider();

  /// 쿼리 실행
  Future<R> useQuery<R>({
    required String queryKey,
    required Future<R> Function() queryFn,
    Duration? staleTime,
    Duration? cacheTime,
    bool refetchOnMount = true,
  }) async {
    return await queryProvider.query<R>(
      queryKey: queryKey,
      queryFn: queryFn,
      staleTime: staleTime,
      cacheTime: cacheTime,
      refetchOnMount: refetchOnMount,
    );
  }

  /// 쿼리 상태 가져오기
  QueryState? useQueryState(String queryKey) {
    return queryProvider.getQueryState(queryKey);
  }

  /// 캐시된 데이터 가져오기
  R? useCachedData<R>(String queryKey) {
    return queryProvider.getCachedData<R>(queryKey);
  }

  /// 쿼리 무효화
  void invalidateQuery(String queryKey) {
    queryProvider.invalidateQuery(queryKey);
  }

  /// 모든 쿼리 무효화
  void invalidateAllQueries() {
    queryProvider.invalidateAllQueries();
  }
}
