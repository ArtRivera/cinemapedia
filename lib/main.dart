import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';

void main() async {
  // Loads the .env file
  await dotenv.load(fileName: ".env");

  // Runs the app
  runApp(const ProviderScope(child: MyApp()));
}
