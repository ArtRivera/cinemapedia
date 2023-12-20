import 'package:flutter/material.dart';

final List<String> messages = [
  'Loading...',
  'Please wait...',
  'Almost there...',
  'Just a moment...',
  'Hold on...',
  'Just a sec...',
  'Just a moment...',
  'Please wait...',
];

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> get _messagesStream {
    return Stream.periodic(const Duration(seconds: 2), (int index) {
      return messages[index];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hi there 👋🏼!'),
        const SizedBox(height: 20),
        const CircularProgressIndicator(),
        const SizedBox(height: 20),
        StreamBuilder(
            stream: _messagesStream,
            builder: (context, snapshot) {
              return Text(snapshot.data ?? '');
            })
      ],
    ));
  }
}
