import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:writers/models/AuthPayload.dart';
import 'package:writers/models/Chapter.dart';
import 'package:writers/models/Story.dart';
import 'package:writers/models/User.dart';

class ApiService {
  static Future<User> fetchUserFromToken(String token) async {
    const userFronToken = {
      "query": """query {
          userFromToken {
            id
            name
            email
            role
            language
            bookmark
          }
        }"""
    };

    final response = await http.post(
        Uri.parse('https://writers-live-api.herokuapp.com/'),
        body: jsonEncode(userFronToken),
        headers: {
          "authorization": "Bearer $token",
          "Content-Type": "application/json"
        });

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body)['data']['userFromToken']);
    } else {
      throw Exception("Failed to load User");
    }
  }

  static Future<AuthPayload> login(String email, String password) async {
    var login = {
      "query": """mutation {
          signIn(email: \"$email\", password: \"$password\") {
            token
            user {
              id
              name
              email
              role
              language
              bookmark
            }
          }
        }"""
    };

    final response = await http.post(
        Uri.parse('https://writers-live-api.herokuapp.com/'),
        body: jsonEncode(login),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return AuthPayload.fromJson(jsonDecode(response.body)['data']['signIn']);
    } else {
      throw Exception("Failed to signIn");
    }
  }

  static Future<AuthPayload> register(
      String email, String name, String language, String password) async {
    var login = {
      "query": """mutation {
          signUp(email: \"$email\", password: \"$password\", name: \"$name\", language: $language) {
            token
            user {
              id
              name
              email
              role
              language
              bookmark
            }
          }
        }"""
    };

    final response = await http.post(
        Uri.parse('https://writers-live-api.herokuapp.com/'),
        body: jsonEncode(login),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return AuthPayload.fromJson(jsonDecode(response.body)['data']['signUp']);
    } else {
      throw Exception("Failed to signUp");
    }
  }

  static Future<Story?> fetchStory(String language) async {
    var login = {
      "query": """query {
          story(language: $language) {
            id
            language
            createdAt
            updatedAt
            firstChapterId
          }
        }"""
    };

    final response = await http.post(
        Uri.parse('https://writers-live-api.herokuapp.com/'),
        body: jsonEncode(login),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body)['data']['story'];
      return body != null ? Story.fromJson(body) : null;
    } else {
      throw Exception("Failed to load Story");
    }
  }

  static Future<Chapter?> fetchChapter(String chapterId) async {
    var login = {
      "query": """query {
          chapter(id: \"$chapterId\") {
            id
            text
            depth
            children {
              id
              text
            }
            parent {
              id
            }
            author {
              id
            }
            createdAt
            votes {
              id
            }
            storyId
            status
          }
        }"""
    };

    final response = await http.post(
        Uri.parse('https://writers-live-api.herokuapp.com/'),
        body: jsonEncode(login),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body)['data']['chapter'];
      return body != null ? Chapter.fromJson(body) : null;
    } else {
      throw Exception("Failed to load Chapter");
    }
  }
}
