import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/bloc/puzzle_bloc.dart';
import 'package:puzzle/data/service/service_locator.dart';
import 'package:puzzle/ui/widgets/counter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Puzzle"),
      ),
      body: Column(
        children: [
          Counter(),
          Expanded(
            child: BlocBuilder<PuzzleBloc, PuzzleState>(
              builder: (context, state) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: state.tiles.length,
                  itemBuilder: (context, index) {
                    final tile = state.tiles[index];
                    return GestureDetector(
                      onTap: () {
                        context.read<PuzzleBloc>().add(TileTappedEvent(index));
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
          FilledButton(
            onPressed: () {
              getIt<PuzzleBloc>().add(ShuffledEvent());
            },
            child: const Text(
              "Random Places",
            ),
          ),
        ],
      ),
    );
  }
}
