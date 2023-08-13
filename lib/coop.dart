import 'package:flutter/material.dart';
import 'package:medlem/services/serevices.dart';

class CoopApp extends StatelessWidget {
  const CoopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          // background: const Color.fromRGBO(233, 227, 213, 1),
          seedColor: const Color.fromRGBO(12, 78, 140, 1),
        ),
      ),
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationService.instance.onGenerateRoute,
      initialRoute: splashRoute,
    );
  }
}
