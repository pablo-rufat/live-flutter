import 'dart:convert';

import 'package:intl/intl.dart';

dynamic enumFromString(List values, String comp) {
  dynamic enumValue;
  values.forEach((item) {
    if (item.toString().split('.').last == comp) {
      enumValue = item;
    }
  });
  return enumValue;
}

String formatData(String milis) {
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(int.parse(milis));
  var format = new DateFormat("d/M/y");
  return format.format(date);
}
