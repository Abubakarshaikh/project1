import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/cubit/survey_form_cubit.dart';
import 'package:project1/example1.dart';
import 'package:project1/survey_form/survey_form_screen.dart';

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
    return BlocProvider<SurveyFormCubit>(
      create: (context) => SurveyFormCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme().copyWith(),
        ),
        // home: Example1(),
        home: const SurveyFormScreen(),
      ),
    );
  }
}
