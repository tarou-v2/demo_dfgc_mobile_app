// 数値をk、m、bの記号に変換する関数
String formatNumber(double number) {
  if (number >= 1000000000) {
    return '${(number / 1000000000).toStringAsFixed(1)}B'; // 十億単位
  } else if (number >= 1000000) {
    return '${(number / 1000000).toStringAsFixed(1)}M'; // 百万単位
  } else if (number >= 1000) {
    return '${(number / 1000).toStringAsFixed(1)}K'; // 千単位
  } else {
    return number.toStringAsFixed(1); // 1未満の場合はそのまま表示
  }
}
