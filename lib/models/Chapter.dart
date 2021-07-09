import 'package:writers/models/User.dart';
import 'package:writers/models/Vote.dart';
import 'package:writers/utils.dart';

enum Status { WAITING, APPROVED, REPROVED }

class Chapter {
  final String id;
  final String? text;
  final int? depth;
  final List<Chapter> children;
  final Chapter? parent;
  final User? author;
  final String? createdAt;
  final List<Vote> votes;
  final String? storyId;
  final Status? status;

  Chapter({
    required this.id,
    required this.text,
    required this.depth,
    required this.children,
    required this.parent,
    required this.author,
    required this.createdAt,
    required this.votes,
    required this.storyId,
    required this.status,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    print(json['children']);
    return Chapter(
      id: json['id'],
      text: json['text'],
      depth: json['depth'],
      children: json['children'] != null
          ? List<Chapter>.from(
              json['children'].map((model) => Chapter.fromJson(model)))
          : [],
      parent: json['parent'] != null ? Chapter.fromJson(json['parent']) : null,
      author: User.fromJson(json['author']),
      createdAt: json['createdAt'],
      votes: json['votes'] != null
          ? List<Vote>.from(json['votes'].map((model) => Vote.fromJson(model)))
          : [],
      storyId: json['storyId'],
      status: enumFromString(Status.values, json['status']),
    );
  }

  @override
  String toString() {
    return 'Chapter: {id: $id, text: $text, depth: $depth, children: $children }';
  }
}
