import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubit/survey_form_cubit.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SurveyFormHeader extends StatelessWidget {
  const SurveyFormHeader({
    super.key,
    required int questionLength,
  }) : _questionLength = questionLength;

  final int _questionLength;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocBuilder<SurveyFormCubit, int>(
      builder: (context, value) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "${value <= _questionLength ? value : _questionLength} of $_questionLength",
                  style: theme.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: theme.titleSmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: StepProgressIndicator(
                totalSteps: _questionLength,
                currentStep: value <= _questionLength ? value : _questionLength,
                size: 8,
                padding: 0,
                selectedColor: Colors.blue,
                unselectedColor: const Color.fromARGB(255, 120, 120, 120),
                roundedEdges: const Radius.circular(10),
              ),
            ),
          ],
        );
      },
    );
  }
}
