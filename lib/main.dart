import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestpuesta/bloc/bloc.dart';
import 'package:prestpuesta/screens/index.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => MaterialesBloc(),
      ),
      BlocProvider(
        create: (context) => CalculoBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PresUpuesta",
      home: const HomeScreen(),
      routes: {
        "home": (_) => const HomeScreen(),
        "material": (_) => const MaterialScreen(),
        "calculo": (_) => const CalculoScreen(),
      },
    );
  }
}
