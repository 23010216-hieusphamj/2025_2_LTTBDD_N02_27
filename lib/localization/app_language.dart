import 'en.dart';
import 'vi.dart';

class AppLanguage {
  static String currentLanguage = "en";

  static Map<String, Map<String, String>> languages = {
    "en": en,
    "vi": vi,
  };

  static String get(String key) {
    if (currentLanguage == "vi") {
      return vi[key] ?? key;
    }
    return en[key] ?? key;
  }

  static void changeLanguage(String lang) {
    currentLanguage = lang;
  }

  static void setLanguage(String lang) {
    currentLanguage = lang;
  }
}
