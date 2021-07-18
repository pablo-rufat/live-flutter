import 'package:flutter/material.dart';

class ChapterNotFound extends StatelessWidget {
  const ChapterNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Image.asset("assets/images/not_found.jpeg"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Chapter not found...",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
