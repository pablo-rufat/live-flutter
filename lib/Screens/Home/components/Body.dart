import 'package:flutter/material.dart';
import 'package:writers/Service.dart';
import 'package:writers/apiService.dart';
import 'package:writers/constants.dart';
import 'package:writers/models/Chapter.dart';
import 'package:writers/utils.dart';

class Body extends StatefulWidget {
  final AsyncSnapshot<Chapter> snapshot;

  const Body({Key? key, required this.snapshot}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  IconData bookmarkIcon = Icons.bookmark_outline;
  bool isBookmark = false;
  Service _service = Service();

  @override
  void initState() {
    super.initState();

    if (_service.currentUser.user!.bookmark == widget.snapshot.data!.id) {
      isBookmark = true;
      bookmarkIcon = Icons.bookmark;
    }
  }

  Future<void> setBookmark(String bookmark) async {
    _service.currentUser.user = await ApiService.setBookmark(bookmark);
  }

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
                            if (isBookmark == true) {
                              bookmarkIcon = Icons.bookmark_outline;
                              isBookmark = false;
                              setBookmark("remove");
                            } else {
                              bookmarkIcon = Icons.bookmark;
                              isBookmark = true;
                              setBookmark(widget.snapshot.data!.id);
                            }
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
