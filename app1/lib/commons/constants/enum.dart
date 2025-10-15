/// 감정(emotion) enum 정의
/// 화면에서 사용할 감정 데이터를 관리합니다.
enum Emotion {
  /// 행복한 감정
  happy,
  
  /// 슬픈 감정
  sad,
  
  /// 화난 감정
  angry,
  
  /// 놀란 감정
  surprise,
  
  /// 기타 감정
  etc;

  /// 화면에 표시될 텍스트를 반환합니다.
  String get displayText {
    switch (this) {
      case Emotion.happy:
        return "행복해요";
      case Emotion.sad:
        return "슬퍼요";
      case Emotion.angry:
        return "화나요";
      case Emotion.surprise:
        return "놀랐어요";
      case Emotion.etc:
        return "기타";
    }
  }

  /// 중간 크기 이미지 경로를 반환합니다.
  String get mediumImagePath {
    switch (this) {
      case Emotion.happy:
        return "assets/icons/emotion-happy-m.svg";
      case Emotion.sad:
        return "assets/icons/emotion-sad-m.svg";
      case Emotion.angry:
        return "assets/icons/emotion-angry-m.svg";
      case Emotion.surprise:
        return "assets/icons/emotion-surprise-m.svg";
      case Emotion.etc:
        return "assets/icons/emotion-etc-m.svg";
    }
  }

  /// 작은 크기 이미지 경로를 반환합니다.
  String get smallImagePath {
    switch (this) {
      case Emotion.happy:
        return "assets/icons/emotion-happy-s.svg";
      case Emotion.sad:
        return "assets/icons/emotion-sad-s.svg";
      case Emotion.angry:
        return "assets/icons/emotion-angry-s.svg";
      case Emotion.surprise:
        return "assets/icons/emotion-surprise-s.svg";
      case Emotion.etc:
        return "assets/icons/emotion-etc-s.svg";
    }
  }

  /// 감정별 색상 코드를 반환합니다.
  String get colorCode {
    switch (this) {
      case Emotion.happy:
        return "red60";
      case Emotion.sad:
        return "blue60";
      case Emotion.angry:
        return "gray60";
      case Emotion.surprise:
        return "yellow60";
      case Emotion.etc:
        return "green60";
    }
  }

  /// 모든 감정 목록을 반환합니다.
  static List<Emotion> get allEmotions => Emotion.values;

  /// 감정 이름으로 enum을 찾습니다.
  static Emotion? fromString(String name) {
    try {
      return Emotion.values.firstWhere(
        (emotion) => emotion.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
