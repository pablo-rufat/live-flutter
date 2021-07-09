import 'package:flutter/material.dart';
import 'package:writers/Service.dart';
import 'package:writers/apiService.dart';
import 'package:writers/models/Chapter.dart';
import 'package:writers/models/Story.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  Service _service = Service();
  Story? story;
  Chapter? chapter;

  Future fetchData() async {
    story = await fetchStory();

    if (story != null) {
      print(story!.firstChapterId);
      chapter = await fetchChapter(story!.firstChapterId);
    }

    print(story.toString());
    print(chapter.toString());
  }

  Future<Story?> fetchStory() async {
    story = await ApiService.fetchStory(
        _service.currentUser.user!.language.toString().split('.').last);

    return story;
  }

  Future<Chapter?> fetchChapter(String chapterId) async {
    chapter = await ApiService.fetchChapter(chapterId);

    return chapter;
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Container();
  }
}
