dynamic enumFromString(List values, String comp) {
  dynamic enumValue;
  values.forEach((item) {
    if (item.toString().split('.').last == comp) {
      enumValue = item;
    }
  });
  return enumValue;
}
