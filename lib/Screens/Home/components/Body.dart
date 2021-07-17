import 'package:flutter/material.dart';
import 'package:writers/constants.dart';
import 'package:writers/models/Chapter.dart';
import 'package:writers/utils.dart';

class Body extends StatefulWidget {
  final AsyncSnapshot<Chapter> snapshot;
  final bool isBookmark;
  final Function setBookmark;

  const Body(
      {Key? key,
      required this.snapshot,
      required this.isBookmark,
      required this.setBookmark})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  IconData bookmarkIcon = Icons.bookmark_outline;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Card(
      shadowColor: primaryColor,
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [primaryLightColor, primarySemiColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          width: size.width * 0.9,
          height: size.height * 0.7,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.snapshot.data!.author!.name} - ${formatData(widget.snapshot.data!.createdAt!)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 26),
                      ),
                      IconButton(
                        icon: Icon(bookmarkIcon, color: primaryColor),
                        onPressed: () {
                          setState(() {
                            if (widget.isBookmark) {
                              bookmarkIcon = Icons.bookmark_outline;
                              widget.setBookmark(false);
                            } else {
                              bookmarkIcon = Icons.bookmark;
                              widget.setBookmark(true);
                            }
                            // TODO: SET ICON IF BOOKMARK FROM API
                          });
                        },
                      )
                    ]),
                SizedBox(
                  height: 30,
                ),
                // RichText(
                //   textAlign: TextAlign.start,
                //   text: TextSpan(
                //     style: TextStyle(color: Colors.grey.shade800, fontSize: 24),
                //     children: []
                //   ),
                // ),
                Text(
                  widget.snapshot.data!.text!,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 18),
                ),
              ],
            ),
          )),
    ));
  }
}
