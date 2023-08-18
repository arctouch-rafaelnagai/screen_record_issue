import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../screen_recorder/ed_screen_recorder_plugin.dart';
import '../widgets/flutter_example.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final EdScreenRecorder screenRecorder;

  final int countDown = 5;
  int currentCountDown = 5;

  @override
  void initState() {
    super.initState();
    screenRecorder = EdScreenRecorder();
  }

  Future<void> startRecord() async {
    try {
      final appDocumentsDirectory = await getApplicationDocumentsDirectory();
      final appDocumentsPath = appDocumentsDirectory.path;
      await screenRecorder.startRecordScreen(
        fileName: "test",
        audioEnable: false,
        dirPathToSave: '$appDocumentsPath/',
      );
      startCountDown();
    } catch (e) {
      startRecord();
      debugPrint('NAGA: ${e.toString()}');
    }
  }

  void startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentCountDown <= 0) {
        timer.cancel();
        stopRecord();
        return;
      }
      currentCountDown--;
      setState(() {});
    });
  }

  Future<void> stopRecord() async {
    screenRecorder.stopRecord().then((response) {
      Navigator.of(context).pushNamed('recorded', arguments: response['file']);
    });
    currentCountDown = countDown;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FlutterExample(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await startRecord();
        },
        child: currentCountDown == countDown
            ? const Icon(Icons.play_arrow)
            : Text(currentCountDown.toString()),
      ),
    );
  }
}
