import 'package:get_it/get_it.dart';
import 'package:puzzle/bloc/puzzle_bloc.dart';

final getIt = GetIt.I;
void setupLocator() {
  getIt.registerSingleton<PuzzleBloc>(PuzzleBloc());
}
