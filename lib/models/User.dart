import 'package:writers/models/Chapter.dart';
import 'package:writers/models/Vote.dart';
import 'package:writers/utils.dart';

enum Roles { USER, MOD, ADMIN }

enum Languages { ES, PT, EN }

class User {
  final String id;
  final String? name;
  final String? email;
  final List<Chapter> chapters;
  final List<Vote> votes;
  final Roles? role;
  final Languages? language;
  final String? bookmark;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.chapters,
    required this.votes,
    required this.role,
    required this.language,
    required this.bookmark,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? null,
      email: json['email'] ?? null,
      chapters: json['chapters'] != null
          ? List<Chapter>.from(
              json['chapters'].map((model) => Chapter.fromJson(model)))
          : [],
      votes: json['votes'] != null
          ? List<Vote>.from(json['votes'].map((model) => Vote.fromJson(model)))
          : [],
      role: json['role'] != null
          ? enumFromString(Roles.values, json['role'])
          : null,
      language: json['language'] != null
          ? enumFromString(Languages.values, json['language'])
          : null,
      bookmark: json['bookmark'] ?? null,
    );
  }

  @override
  String toString() {
    return 'User: {id: $id, name: $name, language: $language}';
  }
}
