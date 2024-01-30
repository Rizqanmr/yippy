import 'package:flutter/material.dart';
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

  // static Widget keyValue(dynamic key, dynamic value) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(key),
  //       Text(value)
  //     ],
  //   );
  // }
}

Widget keyValue(dynamic key, dynamic value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(key),
      Text(value)
    ],
  );
}

class GlobalSnackBar {
  GlobalSnackBar._();
  static showInfoSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.grey,
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static showSuccessSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}