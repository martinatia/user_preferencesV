import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences_app/providers/theme_provider.dart';
import 'package:user_preferences_app/share_preferences/preferences.dart';
import 'package:user_preferences_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'Settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkmode = false;
  // int gender = 1;
  // String name = 'Amir';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                Divider(),
                SwitchListTile.adaptive(
                    // value: isDarkmode,
                    value: Preferences.isDarkmode,
                    title: Text('Darkmode'),
                    onChanged: (value) {
                      //isDarkmode = value;
                      Preferences.isDarkmode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      value
                          ? themeProvider.setDarkMode()
                          : themeProvider.setLightMode();

                      setState(() {});
                    }),
                Divider(),
                RadioListTile<int>(
                    value: 1,
                    //groupValue: gender,
                    groupValue: Preferences.gender,
                    title: Text('Masculino'),
                    onChanged: (value) {
                      //si value es nulo le pongo 1
                      // gender = value ?? 1;
                      Preferences.gender = value ?? 1;
                      setState(() {});
                    }),
                Divider(),
                RadioListTile<int>(
                    value: 2,
                    //groupValue: gender,
                    groupValue: Preferences.gender,
                    title: Text('Femenino'),
                    onChanged: (value) {
                      Preferences.gender = value ?? 2;
                      setState(() {});
                    }),
                Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    onChanged: (value) {
                      //name = value;
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: 'Nombre', helperText: 'Nombre del usuario'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
