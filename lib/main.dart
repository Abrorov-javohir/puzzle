import 'package:flutter/material.dart';
import 'package:puzzle/data/service/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/ui/screens/home_screen.dart';
import 'bloc/puzzle_bloc.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: '15 Puzzle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<PuzzleBloc>(),
        child: const HomeScreen(),
      ),
    );
  }
}
