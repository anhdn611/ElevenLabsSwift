import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:elvenlabs_flutter/elvenlabs_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ElvenLabs Flutter Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await ElvenlabsFlutter.startCall();
                },
                child: const Text('Bắt đầu cuộc gọi'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await ElvenlabsFlutter.endCall();
                },
                child: const Text('Kết thúc cuộc gọi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
