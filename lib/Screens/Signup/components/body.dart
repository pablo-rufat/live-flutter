import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:writers/Screens/Home/home_screen.dart';
import 'package:writers/Screens/Signup/components/background.dart';
import 'package:writers/Screens/Login/login_screen.dart';
import 'package:writers/Screens/Signup/languages_dropdown.dart';
import 'package:writers/Service.dart';
import 'package:writers/apiService.dart';
import 'package:writers/components/have_an_account_check.dart';
import 'package:writers/components/rounded_button.dart';
import 'package:writers/components/rounded_input_field.dart';
import 'package:writers/components/rounded_password_field.dart';
import 'package:writers/models/User.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email = "";
  String name = "";
  String language = "";
  String password = "";
  Service _service = Service();
  bool isLoading = false;

  register() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();

    _service.currentUser =
        await ApiService.register(email, name, language, password);

    if (_service.currentUser.token != null) {
      prefs.setString('token', _service.currentUser.token ?? "");
    }

    setState(() {
      isLoading = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
    );
  }

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
            onChange: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          RoundedInputField(
            hint: 'name',
            icon: Icons.person,
            onChange: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          LanguagesDropdown(
            onChange: (value) {
              language = value ?? "ES";
            },
          ),
          RoundedPasswordField(
            onChange: (value) {
              password = value;
            },
          ),
          RoundedButton(
              text: 'REGISTER',
              press: () {
                register();
              }),
          Visibility(visible: isLoading, child: CircularProgressIndicator()),
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
