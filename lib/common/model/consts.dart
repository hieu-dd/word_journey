class Consts {
  static const String ASSETS_PATH = "assets";
  static const String JSON_PATH = "${ASSETS_PATH}/json";

  static String getWordsWithIndex(int index) =>
      "${JSON_PATH}/words_$index.json";
}
