import 'package:flutter/material.dart';
import 'package:writers/constants.dart';

class HaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const HaveAnAccountCheck({
    Key? key,
    required this.login,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an account? " : "Already have an account? ",
          style: TextStyle(color: primaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Sign Up!' : 'Sign In!',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
