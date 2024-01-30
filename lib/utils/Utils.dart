import 'package:intl/intl.dart';

class Utils {
  static String moneyFormatter(dynamic number) {
    String result;
    NumberFormat currencyFormatter = NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp ',
        decimalDigits: 1
    );
    result = currencyFormatter.format(number).toString().replaceAll(',0', '');
    return result;
  }
}