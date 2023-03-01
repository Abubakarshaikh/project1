import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

import 'package:project1/selection_card.dart';
import 'package:project1/survey_form.dart';

class FormCard extends StatefulWidget {
  final SurveyForm surveyForm;
  final AppinioSwiperController swiperController;
  final Function() onSwipeRight;
  final Function() onSwipeBack;

  const FormCard({
    Key? key,
    required this.surveyForm,
    required this.swiperController,
    required this.onSwipeRight,
    required this.onSwipeBack,
  }) : super(key: key);

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  late List<bool> toggles;

  @override
  void initState() {
    setState(() {
      toggles = List.generate(
          widget.surveyForm.surveyFormOptions.length, (index) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
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
                  onChanged: (newValue) {
                    setState(() {
                      toggles = toggles.map((e) {
                        return toggles[index].hashCode == e.hashCode
                            ? e
                            : false;
                      }).toList();
                      toggles[index] = toggles[index] ? false : true;
                    });
                  },
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
                  onPressed: widget.onSwipeBack,
                  child: const Text("Back"),
                ),
                TextButton(
                  onPressed: widget.onSwipeRight,
                  child: const Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
