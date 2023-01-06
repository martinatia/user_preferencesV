import 'package:flutter/material.dart';
import 'package:user_preferences_app/share_preferences/preferences.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkmode: ${Preferences.isDarkmode}'),
            const Divider(),
            Text('Género: ${Preferences.gender}'),
            const Divider(),
            Text('Nombre de usuario: ${Preferences.name}')
          ],
        ));
  }
}
