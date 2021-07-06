import 'package:flutter/material.dart';
import 'package:writers/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      backgroundColor: color,
    );

    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
            style: flatButtonStyle,
            onPressed: press,
            child: Text(
              this.text,
              style: TextStyle(color: textColor),
            )),
      ),
    );
  }
}
