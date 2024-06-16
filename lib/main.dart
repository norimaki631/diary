import 'package:diary/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData.from(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 66, 68, 62),
          onPrimary: Colors.white,
          secondary: Color(0xFF82B7EB),
          onSecondary: Color(0xFF101112),
          error: Color(0xFFA32323),
          onError: Colors.white,
          surface: Color(0xFFe9e6d7),
          onSurface: Color(0xFF21272a),
        ),
      ),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
