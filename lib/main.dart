import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:writers/Screens/Home/home_screen.dart';
import 'package:writers/Screens/Welcome/welcome_screen.dart';
import 'package:writers/Service.dart';
import 'package:writers/apiService.dart';
import 'package:writers/constants.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'writers',
    theme: ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Service _service = Service();

  Future<Widget> loadCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.setString('token', ''); // TODO: REMOVE!
    final token = prefs.getString('token') ?? null;
    if (token != null && token.isNotEmpty) {
      _service.currentUser.user = await ApiService.fetchUserFromToken(token);
      _service.currentUser.token = token;
      return Future.value(HomeScreen());
    }

    await Future.delayed(Duration(seconds: 1), () => {});

    return Future.value(WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterFuture: loadCurrentUser(),
      title: Text(
        'writers',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      image: Image.asset('assets/images/signup_top.png'),
      backgroundColor: primaryLightColor,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: () => print('Splash Splash!'),
      loaderColor: primaryColor,
    );
  }
}
