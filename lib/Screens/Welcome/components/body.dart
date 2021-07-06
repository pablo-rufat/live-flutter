import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:writers/Screens/Login/login_screen.dart';
import 'package:writers/Screens/Signup/signup_screen.dart';
import 'package:writers/Screens/Welcome/components/background.dart';
import 'package:writers/Service.dart';
import 'package:writers/components/rounded_button.dart';
import 'package:writers/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'WELCOME TO WRITERS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.4,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: 'LOGIN',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }),
                );
              },
            ),
            RoundedButton(
              text: 'REGISTER',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
              color: primaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
