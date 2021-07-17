import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:writers/Screens/Welcome/welcome_screen.dart';
import 'package:writers/Service.dart';
import 'package:writers/apiService.dart';
import 'package:writers/models/User.dart';
import 'package:writers/utils.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  Service _service = Service();

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', '');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WelcomeScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(_service.currentUser.user!.name!),
          ),
          ListTile(
            title: Text('go to bookmark'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('export story'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('sttings'),
            onTap: () {
              Navigator.pop(context); // tamaño de letra, colores, etc.
            },
          ),
          if (_service.currentUser.user!.role == Roles.MOD)
            ListTile(
              title: Text('moderate chapters'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          if (_service.currentUser.user!.role == Roles.ADMIN)
            ListTile(
              title: Text('create Story'),
              onTap: () {
                String text = loremipsum();
                ApiService.createStory("ES", text);
                Navigator.pop(context);
              },
            ),
          ListTile(
            title: Text('log out'),
            onTap: () {
              logout();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
