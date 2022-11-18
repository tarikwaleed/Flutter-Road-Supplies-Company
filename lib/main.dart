import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/providers/providers.dart';
import 'package:salah_construction/route_generator.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/theme.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/dtos/source.dart' as sourcedto;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mixerdbService = MixerDBService();
    final shipmentdbService = ShipmentDataRepository();
    final sourceDataRepository = SourceDataRepository();
    return MultiProvider(
      providers: [
        FutureProvider<List<sourcedto.Source>>(
            create: (_) => sourceDataRepository.retrieveSources(),
            initialData: const <sourcedto.Source>[]),
        FutureProvider<List<Mixer>>(
            create: (_) => mixerdbService.retrieveMixers(),
            initialData: const <Mixer>[]),
        ProxyProvider<List<Mixer>, Future<List<int>>>(
            update: (_, mixers, __) async {
          final List<int> ints = [];

          for (var mixer in mixers) {
            final value = await shipmentdbService
                .retrieveNumberOfShipmentsByMixerId(mixer.id);
            ints.add(value);
          }
          return ints;
        }),
        ChangeNotifierProvider(
          create: (_) => SourceNameProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MixerIDProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShipmentDateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VehicleNumberProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartNumberProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MaterialProvier(),
        ),
        ChangeNotifierProvider(
          create: (context) => MaterialPriceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarriagePriceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SourceIDProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VolumeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClientIDProvider(),
        ),
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
        initialRoute: '/login',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
