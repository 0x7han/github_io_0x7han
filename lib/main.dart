import 'package:flutter/material.dart';
import 'package:github_io_0x7han/provider/theme_provider.dart';
import 'package:github_io_0x7han/view/screen/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '0x7han',
      theme: _buildTheme(Brightness.dark, Colors.deepPurple),
      home: const MainScreen(),
    );
  }

  ThemeData _buildTheme(Brightness brightness, Color seedColor){
    var baseTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness),
        useMaterial3: true,
      );
    return baseTheme.copyWith(
      textTheme: GoogleFonts.rubikTextTheme(baseTheme.textTheme)
    );
  }
}


