import 'package:flutter/material.dart';

class FlutterExample extends StatefulWidget {
  const FlutterExample({super.key, this.title = "Flutter Demo Home Page"});

  final String title;

  @override
  State<FlutterExample> createState() => _FlutterExampleState();
}

class _FlutterExampleState extends State<FlutterExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
            onPressed: _incrementCounter,
            child: const Text('Increment'),
          )
        ],
      ),
    );
  }
}
