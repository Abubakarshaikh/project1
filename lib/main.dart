import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/survey_form_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme().copyWith(
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.5,
          ),
          titleSmall: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 12.5,
          ),
          titleLarge: const TextStyle(),
        ),
      ),
      home: SurveyFormScreen(),
    );
  }
}
