import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/places.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 99, 8, 246),
  background: const Color.fromARGB(255, 57, 47, 68),
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: colorScheme.background,
        // textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        //   titleSmall: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        //   titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        //   titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        // ),
      ),
      home: const PlacesScreen(),
    );
  }
}
