import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:writers/Screens/Signup/components/background.dart';
import 'package:writers/Screens/Login/login_screen.dart';
import 'package:writers/Screens/Signup/languages_dropdown.dart';
import 'package:writers/components/have_an_account_check.dart';
import 'package:writers/components/rounded_button.dart';
import 'package:writers/components/rounded_input_field.dart';
import 'package:writers/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'SIGNUP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            'assets/icons/signup.svg',
            height: size.height * 0.35,
          ),
          RoundedInputField(
            hint: 'e-mail',
            icon: Icons.mail,
            onChange: (value) {},
          ),
          RoundedInputField(
            hint: 'name',
            icon: Icons.person,
            onChange: (value) {},
          ),
          LanguagesDropdown(),
          RoundedPasswordField(
            onChange: (value) {},
          ),
          RoundedButton(text: 'REGISTER', press: () {}),
          SizedBox(
            height: size.height * 0.03,
          ),
          HaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
