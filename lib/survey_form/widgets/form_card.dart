import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubit/survey_form_cubit.dart';
import 'package:project1/form_submit/form_submit_screen.dart';
import 'package:project1/survey_form/widgets/selection_card.dart';
import 'package:project1/survey_form.dart';

class FormCard extends StatefulWidget {
  final SurveyForm surveyForm;
  final AppinioSwiperController swiperController;
  const FormCard({
    Key? key,
    required this.surveyForm,
    required this.swiperController,
  }) : super(key: key);

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  late List<bool> toggles;

  @override
  void initState() {
    toggles = List.generate(SurveyForm.allQuestions().length, (index) => false);

    widget.swiperController.addListener(() {
      toggles =
          List.generate(SurveyForm.allQuestions().length, (index) => false);
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocBuilder<SurveyFormCubit, int>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Select an answer", style: theme.titleSmall),
                Text(widget.surveyForm.question, style: theme.titleLarge),
                Column(
                  children: List.generate(
                      widget.surveyForm.surveyFormOptions.length, (index) {
                    return SelectionCard(
                      onChanged: (newValue) => _toggle(index),
                      isChecked: toggles[index],
                      cardBorderColor: widget.surveyForm.borderColor,
                      cardColor: widget.surveyForm.cardColor,
                      title: widget.surveyForm.surveyFormOptions[index].title,
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: state <= 1
                          ? null
                          : () {
                              context.read<SurveyFormCubit>().decrement();
                              widget.swiperController.unswipe();
                            },
                      child: const Text("Back"),
                    ),
                    TextButton(
                      onPressed: state <= 3
                          ? () {
                              context.read<SurveyFormCubit>().increment();
                              widget.swiperController.swipeRight();
                            }
                          : () {
                              Navigator.push(context, FormSubmitScreen.route());
                            },
                      child: Text(state <= 3 ? "Next" : "Finish"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _toggle(int index) {
    return setState(() {
      toggles = toggles.map((e) {
        return toggles[index].hashCode == e.hashCode ? e : false;
      }).toList();
      toggles[index] = toggles[index] ? false : true;
    });
  }
}
