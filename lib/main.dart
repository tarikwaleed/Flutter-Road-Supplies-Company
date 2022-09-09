import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/providers/providers.dart';
import 'package:salah_construction/navigation/navigation.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/theme.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/dtos/source.dart' as sourcedto;
import 'package:salah_construction/viewmodels/viewmodels.dart';

Future<void> main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mixerDataRepository = serviceLocator<MixerDataRepository>();
    final shipmentdbService = serviceLocator<ShipmentDataRepository>();
    final sourceDataRepository = serviceLocator<SourceDataRepository>();
    final shipmentItemScreenViewmodel =
        serviceLocator<ShipmentItemScreenViewmodel>();
    final shipmentCardViewmodel = serviceLocator<ShipmentCardViewmodel>();
    return MultiProvider(
      providers: [
        FutureProvider<List<sourcedto.Source>>(
          create: (_) => sourceDataRepository.retrieveSources(),
          initialData: const <sourcedto.Source>[],
        ),
        FutureProvider<List<Mixer>>(
            create: (_) => mixerDataRepository.retrieveMixers(),
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
          create: (_) => shipmentItemScreenViewmodel,
        ),
        ChangeNotifierProvider(
          create: (_) => shipmentCardViewmodel,
        ),
        ChangeNotifierProvider(
          create: (_) => SourceNameProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MixerIDProvider(),
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
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
