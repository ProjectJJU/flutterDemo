/// ����(emotion) enum ����
/// ȭ�鿡�� ����� ���� �����͸� �����մϴ�.
enum Emotion {
  /// �ູ�� ����
  happy,
  
  /// ���� ����
  sad,
  
  /// ȭ�� ����
  angry,
  
  /// ��� ����
  surprise,
  
  /// ��Ÿ ����
  etc;

  /// ȭ�鿡 ǥ�õ� �ؽ�Ʈ�� ��ȯ�մϴ�.
  String get displayText {
    switch (this) {
      case Emotion.happy:
        return "�ູ�ؿ�";
      case Emotion.sad:
        return "���ۿ�";
      case Emotion.angry:
        return "ȭ����";
      case Emotion.surprise:
        return "������";
      case Emotion.etc:
        return "��Ÿ";
    }
  }

  /// �߰� ũ�� �̹��� ��θ� ��ȯ�մϴ�.
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

  /// ���� ũ�� �̹��� ��θ� ��ȯ�մϴ�.
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

  /// ������ ���� �ڵ带 ��ȯ�մϴ�.
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

  /// ��� ���� ����� ��ȯ�մϴ�.
  static List<Emotion> get allEmotions => Emotion.values;

  /// ���� �̸����� enum�� ã���ϴ�.
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
