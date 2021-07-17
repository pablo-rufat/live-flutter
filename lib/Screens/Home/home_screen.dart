import 'package:flutter/material.dart';
import 'package:writers/Screens/Home/components/HomeDrawer.dart';
import 'package:writers/Screens/Home/components/body.dart';
import 'package:writers/Service.dart';
import 'package:writers/apiService.dart';
import 'package:writers/constants.dart';
import 'package:writers/models/Chapter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Service _service = Service();
  late Future<Chapter>? futureChapter;
  bool isBookmark = false;

  @override
  void initState() {
    super.initState();

    if (_service.currentUser.user!.bookmark != null) {
      futureChapter = fetchChapter(_service.currentUser.user!.bookmark!);
    } else {
      futureChapter = fetchFirstChapter();
    }
    // TODO: INIT BOOKMARK ICON
  }

  Future<Chapter>? fetchFirstChapter() async {
    return ApiService.fetchFirstChapter(
        _service.currentUser.user!.language.toString().split('.').last);
  }

  Future<Chapter>? fetchChapter(String chapterId) async {
    return await ApiService.fetchChapter(chapterId);
  }

  Future<void> setBookmark() async {
    // setar bookmark na api
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('writers')),
        drawer: HomeDrawer(),
        body: FutureBuilder<Chapter>(
          future: futureChapter,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Body(
                      snapshot: snapshot,
                      isBookmark: isBookmark,
                      setBookmark: setBookmark,
                    ),
                    ButtonBar(
                      buttonHeight: size.height * 0.1,
                      alignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Continue reading",
                              style: TextStyle(color: primaryColor),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Create new chapter",
                              style: TextStyle(color: primaryColor),
                            ))
                      ],
                    ),
                  ]);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
