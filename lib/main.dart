import 'package:flutter/material.dart';
import 'package:puzzle/data/service/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/ui/screens/splash_screen.dart';
import 'bloc/puzzle_bloc.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PuzzleBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
