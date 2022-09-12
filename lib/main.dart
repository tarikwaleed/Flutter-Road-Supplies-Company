import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/providers.dart';
import 'package:salah_construction/navigation/navigation.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/theme.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

Future<void> main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final mixersLisScreenViewmodel = serviceLocator<MixersListScreenViewmodel>();

  @override
  void initState() {
    mixersLisScreenViewmodel.loadMixers();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => mixersLisScreenViewmodel),
      ],
      child: MaterialApp(
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
          textTheme: MyTextTheme().tajawalTextTheme(),
          inputDecorationTheme:
              MyInputDecorationTheme().myInputDecorationTheme(),
          iconTheme: MyIconTheme().shipmentCardIconTheme(),
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
