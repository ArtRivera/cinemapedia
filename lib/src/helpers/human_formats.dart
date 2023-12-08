import 'package:intl/intl.dart';

class HumanFormat {
  static String number(double number) {
    final formattedNumber =
        NumberFormat.compact(locale: 'en_US').format(number);

    return formattedNumber;
  }
}
