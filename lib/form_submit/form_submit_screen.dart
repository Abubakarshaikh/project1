import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubit/survey_form_cubit.dart';
import 'package:project1/survey_form/survey_form_screen.dart';

class FormSubmitScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const FormSubmitScreen());
  }

  const FormSubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Form Submited. Thanks"),
            TextButton(
              onPressed: () {
                context.read<SurveyFormCubit>().reset();
                Navigator.push(context, SurveyFormScreen.route());
              },
              child: const Text("Back to Survey From"),
            ),
          ],
        ),
      ),
    );
  }
}
