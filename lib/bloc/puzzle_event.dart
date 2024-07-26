part of 'puzzle_bloc.dart';

abstract class PuzzleEvent {
  List<Object> get props => [];
}

class ShuffledEvent extends PuzzleEvent {}

class TileTappedEvent extends PuzzleEvent {
  final int index;
  TileTappedEvent(this.index);
  @override
  List<Object> get props => [index];
}
