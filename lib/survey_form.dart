import 'package:flutter/material.dart';

class SurveyForm {
  final String question;
  final List<SurveyFormOption> surveyFormOptions;
  final Color cardColor;
  final Color borderColor;
  final bool isCompleted;

  const SurveyForm({
    required this.borderColor,
    required this.cardColor,
    required this.surveyFormOptions,
    required this.question,
    this.isCompleted = false,
  });

  static List<SurveyForm> allQuestions() {
    return [
      SurveyForm(
        borderColor: Color.fromARGB(255, 48, 69, 187),
        cardColor: Colors.indigo,
        question: "🍏 How many times a day do you eat?",
        surveyFormOptions: [
          SurveyFormOption(title: "1"),
          SurveyFormOption(title: "2"),
          SurveyFormOption(title: "3"),
          SurveyFormOption(title: "4 and more"),
        ],
      ),
      SurveyForm(
        borderColor: Color.fromARGB(255, 3, 247, 247),
        cardColor: Colors.cyanAccent,
        question:
            "🍕 What meal would you consider to be your main meal of the day?",
        surveyFormOptions: [
          SurveyFormOption(title: "1"),
          SurveyFormOption(title: "2"),
          SurveyFormOption(title: "3"),
          SurveyFormOption(title: "4 and more"),
        ],
      ),
      SurveyForm(
        borderColor: Color.fromARGB(255, 201, 122, 3),
        cardColor: Colors.orange[400]!,
        question: "🍓 Are you allergic to any citrus foods?",
        surveyFormOptions: [
          SurveyFormOption(title: "1"),
          SurveyFormOption(title: "2"),
          SurveyFormOption(title: "3"),
          SurveyFormOption(title: "4 and more"),
        ],
      ),
      SurveyForm(
        borderColor: Color.fromARGB(255, 3, 105, 188),
        cardColor: Colors.blue[200]!,
        question: "🍟 Do you know your current BMI (Body Mass Index) Index?",
        surveyFormOptions: [
          SurveyFormOption(title: "1"),
          SurveyFormOption(title: "2"),
          SurveyFormOption(title: "3"),
          SurveyFormOption(title: "4 and more"),
        ],
      ),
    ];
  }



  SurveyForm copyWith({
    String? question,
    List<SurveyFormOption>? surveyFormOptions,
    Color? cardColor,
    Color? borderColor,
    bool? isCompleted,
  }) {
    return SurveyForm(
      question: question ?? this.question,
      surveyFormOptions: surveyFormOptions ?? this.surveyFormOptions,
      cardColor: cardColor ?? this.cardColor,
      borderColor: borderColor ?? this.borderColor,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class SurveyFormOption {
  final String title;
  final bool isChecked;
  const SurveyFormOption({
    required this.title,
    this.isChecked = false,
  });

  SurveyFormOption copyWith({
    String? title,
    bool? isChecked,
  }) {
    return SurveyFormOption(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
