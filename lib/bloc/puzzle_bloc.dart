// puzzle_bloc.dart
import 'dart:math';
import 'package:bloc/bloc.dart';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc() : super(PuzzleState.initial()) {
    on<ShuffledEvent>(random);
    on<TileTappedEvent>(_tile_Tapped);
  }

  void random(ShuffledEvent event, Emitter<PuzzleState> emit) {
    final random = Random();
    final shuffledTiles = List<int>.from(state.tiles);
    do {
      shuffledTiles.shuffle(random);
    } while (!_isSolvable(shuffledTiles) || _isCompleted(shuffledTiles));

    emit(state.copyWith(tiles: shuffledTiles));
  }

  void _tile_Tapped(TileTappedEvent event, Emitter<PuzzleState> emit) {
    final int index = event.index;
    final int emptyIndex = state.tiles.indexOf(0);

    if (_isAdjacent(index, emptyIndex)) {
      final newTiles = List<int>.from(state.tiles);
      newTiles[emptyIndex] = newTiles[index];
      newTiles[index] = 0;
      emit(state.copyWith(tiles: newTiles));
    }
  }

  bool _isAdjacent(int index, int emptyIndex) {
    final int row = index ~/ 4;
    final int col = index % 4;
    final int emptyRow = emptyIndex ~/ 4;
    final int emptyCol = emptyIndex % 4;
    return (row == emptyRow && (col - emptyCol).abs() == 1) ||
        (col == emptyCol && (row - emptyRow).abs() == 1);
  }

  bool _isSolvable(List<int> tiles) {
    int inversions = 0;
    for (int i = 0; i < tiles.length; i++) {
      for (int j = i + 1; j < tiles.length; j++) {
        if (tiles[i] > 0 && tiles[j] > 0 && tiles[i] > tiles[j]) {
          inversions++;
        }
      }
    }
    final int emptyRow = tiles.indexOf(0) ~/ 4;
    return (inversions + emptyRow) % 2 == 0;
  }

  bool _isCompleted(List<int> tiles) {
    for (int i = 0; i < tiles.length - 1; i++) {
      if (tiles[i] > 0 && tiles[i] > tiles[i + 1]) return false;
    }
    return true;
  }
}
