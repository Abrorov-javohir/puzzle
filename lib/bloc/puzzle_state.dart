class PuzzleState {
  final List<int> tiles;
  final int moves;
  final bool isPlaying; // Qo'shilgan

  PuzzleState({required this.tiles, this.moves = 0, this.isPlaying = false}); // Default isPlaying false

  factory PuzzleState.initial() {
    return PuzzleState(
      tiles: List.generate(16, (index) => index),
      moves: 0,
      isPlaying: false, // Boshlang'ich qiymat
    );
  }

  PuzzleState copyWith({List<int>? tiles, int? moves, bool? isPlaying}) {
    return PuzzleState(
      tiles: tiles ?? this.tiles,
      moves: moves ?? this.moves,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}
