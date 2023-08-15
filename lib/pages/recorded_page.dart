import 'dart:io';

import 'package:flutter/material.dart';

class RecordedPage extends StatelessWidget {
  const RecordedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final file = ModalRoute.of(context)!.settings.arguments as File;
    return Scaffold(
      body: Center(
        child: Text(file.path),
      ),
    );
  }
}
