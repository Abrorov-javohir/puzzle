import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/bloc/puzzle_bloc.dart';
import 'package:puzzle/bloc/puzzle_event.dart';
import 'package:puzzle/bloc/puzzle_state.dart';
import 'package:puzzle/data/service/service_locator.dart';
import 'package:puzzle/ui/widgets/counter.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playMusic() async {
    await _audioPlayer.play(AssetSource(
        'audio/music.mp3')); // `audio/music.mp3` ni to'g'ri yo'liga almashtiring
  }

  void _stopMusic() async {
    await _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Puzzle"),
      ),
      body: BlocListener<PuzzleBloc, PuzzleState>(
        listener: (context, state) {
          if (state.isPlaying) {
            _playMusic(); // O'yin boshlanganda qo'shiqni chaladi
          } else {
            _stopMusic(); // O'yin tugaganda qo'shiqni to'xtatadi
          }
        },
        child: Column(
          children: [
            Counter(),
            Expanded(
              child: BlocBuilder<PuzzleBloc, PuzzleState>(
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: state.tiles.length,
                    itemBuilder: (context, index) {
                      final tile = state.tiles[index];
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<PuzzleBloc>()
                              .add(TileTappedEvent(index));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: tile == 0 ? Colors.transparent : Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              tile == 0 ? '' : '$tile',
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              width: 500, // Kenglikni belgilash
              height: 60, // Balandlikni belgilash
              child: FilledButton(
                onPressed: () {
                  getIt<PuzzleBloc>().add(ShuffledEvent());
                },
                child: const Text(
                  "Start",
                  style: TextStyle(
                      fontSize: 20), // Matn o'lchamini kattalashtirish
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
