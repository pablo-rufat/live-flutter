import 'package:writers/models/Chapter.dart';
import 'package:writers/models/User.dart';

class Vote {
  final String id;
  final User user;
  final Chapter chapter;

  Vote({required this.id, required this.user, required this.chapter});

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
      id: json['id'],
      user: User.fromJson(json['user']),
      chapter: Chapter.fromJson(json['chapter']),
    );
  }
}
