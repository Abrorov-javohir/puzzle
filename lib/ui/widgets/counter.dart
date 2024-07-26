import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: double.infinity,
      height: 100,
      child: const Row(
        children: [
          SizedBox(
            width: 50,
          ),
          Text(
            "Classic",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                "Moves",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Time",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 40,
          ),
          Column(
            children: [
              Text(
                "0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
