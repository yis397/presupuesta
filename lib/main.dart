import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestpuesta/bloc/bloc.dart';
import 'package:prestpuesta/bloc/recordatorio/recordatorio_bloc.dart';
import 'package:prestpuesta/screens/index.dart';
import 'helpers/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => MaterialesBloc(),
      ),
      BlocProvider(
        create: (context) => CalculoBloc(),
      ),
      BlocProvider(
        create: (context) => RecordatorioBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PresUpuesta",
      home: const HomeScreen(),
      routes: {
        "home": (_) => const HomeScreen(),
        "material": (_) => const MaterialScreen(),
        "calculo": (_) => const CalculoScreen(),
        "recuerda": (_) => const RecordatorioScreen(),
      },
    );
  }
}
