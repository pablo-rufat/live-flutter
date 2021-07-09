import 'package:writers/utils.dart';

enum Languages { ES, PT, EN }

class Story {
  final String id;
  final Languages language;
  final String createdAt;
  final String updatedAt;
  final String firstChapterId;

  Story({
    required this.id,
    required this.language,
    required this.createdAt,
    required this.updatedAt,
    required this.firstChapterId,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      language: enumFromString(Languages.values, json['language']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      firstChapterId: json['firstChapterId'],
    );
  }

  @override
  String toString() {
    return 'User: {id: $id, name: $firstChapterId}';
  }
}
