import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salah_construction/screens/home_screen.dart';
import 'package:salah_construction/theme.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale(
          "ar",
          "AE",
        ), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale(
        "ar",
        "AE",
      ),
      // OR Locale('ar', 'AE') OR Other RTL locales,
      title: 'Salah Construction',
      theme: ThemeData(
        textTheme: tajawalTextTheme,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>const HomeScreen(),
      },
    );
  }
}
