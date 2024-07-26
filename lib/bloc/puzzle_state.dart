part of 'puzzle_bloc.dart';

class PuzzleState {
  final List<int> tiles;

  const PuzzleState(this.tiles);

  factory PuzzleState.initial() {
    // Boshlang'ich tartib
    return PuzzleState(
      List.generate(
        16,
        (index) => index,
      ),
    );
  }

  @override
  List<Object> get props => [tiles];

  PuzzleState copyWith({List<int>? tiles}) {
    return PuzzleState(tiles ?? this.tiles);
  }
}
