import 'dart:convert';

import 'package:writers/models/User.dart';

class AuthPayload {
  String? token;
  User? user;

  AuthPayload({required this.token, required this.user});

  factory AuthPayload.fromJson(Map<String, dynamic> json) {
    return AuthPayload(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }

  @override
  String toString() {
    return 'AuthPayload: {token: $token, user: $user}';
  }
}
