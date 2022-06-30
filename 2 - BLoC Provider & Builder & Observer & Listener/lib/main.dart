import 'package:bloc_counter_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bloc/bloc_imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // * StatusBar & NavigationBar Color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurpleAccent.shade700,
      systemNavigationBarColor: Colors.deepPurpleAccent.shade700,
    ),
  );

  // * Orientations
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: CustomBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter',
        home: HomePage(),
      ),
    );
  }
}
