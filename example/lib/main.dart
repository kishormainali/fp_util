import 'package:example/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:fp_util/fp_util.dart';

class SimpleBlocObserver extends BlocObserver with LoggerMixin {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    i(change.currentState);
  }
}

GlobalKey<ScaffoldMessengerState> scaffoldMessageKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  Bloc.observer = SimpleBlocObserver();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      scaffoldMessengerKey: scaffoldMessageKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}
