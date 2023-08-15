import 'package:flutter/material.dart';
import 'package:screen_record_issue/pages/home_page.dart';
import 'package:screen_record_issue/pages/recorded_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => const HomePage(),
        'recorded': (context) => const RecordedPage(),
      },
      initialRoute: 'home',
    );
  }
}
