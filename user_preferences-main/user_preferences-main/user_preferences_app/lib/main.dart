import 'package:flutter/material.dart';
import 'package:user_preferences_app/providers/theme_provider.dart';
import 'package:user_preferences_app/share_preferences/preferences.dart';
import 'screens/screens.dart';
import 'package:provider/provider.dart';

//void main() => runApp(MyApp());
//lo cambio para el sharedpreferences

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SettingsScreen.routeName: (_) => SettingsScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
