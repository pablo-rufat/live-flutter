import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:writers/Screens/Home/home_screen.dart';
import 'package:writers/Screens/Login/components/background.dart';
import 'package:writers/Screens/Signup/signup_screen.dart';
import 'package:writers/Service.dart';
import 'package:writers/apiService.dart';
import 'package:writers/components/have_an_account_check.dart';
import 'package:writers/components/rounded_button.dart';
import 'package:writers/components/rounded_input_field.dart';
import 'package:writers/components/rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email = "";
  String password = "";
  Service _service = Service();
  bool isLoading = false;

  login() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();

    _service.currentUser = await ApiService.login(email, password);

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
            'LOGIN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            'assets/icons/login.svg',
            height: size.height * 0.35,
          ),
          RoundedInputField(
            hint: 'e-mail',
            icon: Icons.person,
            onChange: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          RoundedPasswordField(
            onChange: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          RoundedButton(
              text: 'LOGIN',
              press: () {
                login();
              }),
          Visibility(visible: isLoading, child: CircularProgressIndicator()),
          SizedBox(
            height: size.height * 0.03,
          ),
          HaveAnAccountCheck(
            login: true,
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
          ),
        ],
      ),
    );
  }
}
