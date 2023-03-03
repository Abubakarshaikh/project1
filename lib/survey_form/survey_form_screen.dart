import 'dart:developer';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:project1/survey_form/widgets/form_card.dart';
import 'package:project1/survey_form.dart';
import 'widgets/survey_form_header.dart';

class SurveyFormScreen extends StatefulWidget {
    static Route route() {
    return MaterialPageRoute(builder: (context) => const SurveyFormScreen());
  }
  const SurveyFormScreen({
    super.key,
  });

  @override
  State<SurveyFormScreen> createState() => _SurveyFormScreenState();
}

class _SurveyFormScreenState extends State<SurveyFormScreen> {
  late final AppinioSwiperController _appinioSwiperController;
  late List<SurveyForm> _allQuestions;
  late final int _questionLength;

  late final ValueNotifier _currentIndexNotifier;
  @override
  void initState() {
    _appinioSwiperController = AppinioSwiperController();
    _allQuestions = SurveyForm.allQuestions().reversed.toList();
    _questionLength = _allQuestions.length;
    _currentIndexNotifier = ValueNotifier(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              SurveyFormHeader(questionLength: _questionLength),
              const SizedBox(height: 24),
              Expanded(
                child: AppinioSwiper(
                  isDisabled: true,
                  unlimitedUnswipe: true,
                  padding: EdgeInsets.zero,
                  duration: const Duration(milliseconds: 460),
                  controller: _appinioSwiperController,
                  cards: List.generate(
                    _questionLength,
                    (index) {
                      log("$index");
                      return FormCard(
                       
                        swiperController: _appinioSwiperController,
                        surveyForm: _allQuestions[index],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 110),
            ],
          ),
        ),
      ),
    );
  }
}
