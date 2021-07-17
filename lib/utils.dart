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

String loremipsum() {
  return """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut metus egestas, volutpat ligula ac, fringilla est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse sagittis pellentesque orci eu volutpat. Vivamus ultricies ante a molestie ultrices. Proin tristique, augue vel pellentesque molestie, lorem dui commodo nulla, vitae volutpat erat nisi id enim. Ut augue mauris, finibus vel efficitur sit amet, suscipit at magna. Vivamus a maximus ligula, id cursus eros.

Etiam nec mi lorem. Quisque vehicula, magna at fringilla dapibus, diam neque aliquet orci, id finibus tellus ligula et mauris. Praesent hendrerit sem at lacus lobortis, rutrum imperdiet tellus sodales. Donec vitae auctor nunc. Quisque et nulla et justo convallis gravida a convallis lorem. Vestibulum quis fringilla dui. Etiam id dictum turpis, a faucibus orci. Duis eu venenatis nibh. Suspendisse gravida eros ligula, eget pellentesque sem accumsan sit amet. Duis et massa vitae quam euismod pulvinar. Proin pharetra turpis urna, vitae gravida turpis ultrices ut. Ut arcu enim, sollicitudin et fringilla vitae, faucibus et nisl. Etiam quis consectetur dolor.

Vestibulum non nulla nibh. In hac habitasse platea dictumst. Phasellus ultricies quam non elementum suscipit. Quisque sagittis nec quam non venenatis. Nunc purus justo, euismod ac placerat eget, bibendum vel diam. Phasellus ullamcorper vehicula justo vel gravida. Mauris arcu lacus, rutrum vitae dignissim quis, suscipit eu ante. Aenean tincidunt dui ac tempus feugiat. Vivamus hendrerit quis elit eu vehicula. Nunc malesuada mattis ligula fermentum pulvinar. Suspendisse potenti. Vivamus porttitor metus at porta fermentum. Aenean nisl lorem, condimentum vitae lectus ac, viverra maximus leo. In quis posuere lacus. Praesent bibendum tristique rutrum. Maecenas felis nunc, congue ut vulputate egestas, tristique at neque.

Etiam rutrum leo ex, et bibendum ex volutpat ac. Maecenas eget ullamcorper nisl. Curabitur tellus sem, sagittis ut lacus non, vulputate suscipit nisl. Sed mattis metus non lorem porta dapibus. Phasellus gravida quis nisl vitae tempus. Pellentesque at ultrices sapien. Etiam porta condimentum ante ac ornare. Pellentesque congue magna nisi, ac malesuada turpis fringilla at. Aliquam vel eros scelerisque, mattis ligula in, viverra arcu. In purus nulla, suscipit vitae arcu ac, placerat pulvinar mauris. Suspendisse blandit tempus diam. Donec molestie massa volutpat, aliquam lorem vel, placerat nibh. Nulla facilisi. Etiam sodales rhoncus mattis.

Quisque viverra velit nec enim tincidunt, quis consequat sem vestibulum. Integer sem libero, rutrum vel lacus eget, gravida convallis arcu. Nunc maximus venenatis metus quis sollicitudin. Integer quis eros imperdiet, fermentum ante vel, varius neque. Duis auctor est est, in tempor quam accumsan laoreet. In hac habitasse platea dictumst. Integer dolor erat, sodales et fringilla vitae, tristique vel risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum fermentum felis sit amet semper imperdiet. Etiam et leo nec eros tincidunt tempor sed eu nibh. Duis ut felis ut mi fermentum lobortis. Mauris feugiat feugiat suscipit. Pellentesque accumsan egestas rhoncus. Vestibulum vehicula ultricies dui. Phasellus tincidunt consectetur nunc at suscipit. Vivamus a vehicula justo, sed viverra lectus.""";
}
