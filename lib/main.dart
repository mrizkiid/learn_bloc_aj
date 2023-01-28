// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learnbloc_aj/bloc/mybloc_observer.dart';
import 'package:learnbloc_aj/page/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/counter/counter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  //blocOverrids fot observer check test error
  // BlocOverrides.runZoned(
  //   () => runApp(const MyApp()),
  //   blocObserver: MyBlocObserver(),
  // );

  // Bloc.observer = MyBlocObserver();

  HydratedBloc.storage = storage;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) => CounterBloc(),
      child: HomeScreen(),
    ));
  }
}
