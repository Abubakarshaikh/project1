import 'dart:developer';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:project1/form_card.dart';
import 'package:project1/survey_form.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SurveyFormScreen extends StatefulWidget {
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
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              ValueListenableBuilder(
                valueListenable: _currentIndexNotifier,
                builder: (context, value, child) {
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
                          currentStep: value <= _questionLength
                              ? value
                              : _questionLength,
                          size: 8,
                          padding: 0,
                          selectedColor: Colors.blue,
                          unselectedColor:
                              const Color.fromARGB(255, 120, 120, 120),
                          roundedEdges: const Radius.circular(10),
                        ),
                      ),
                    ],
                  );
                },
              ),
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
                        onSwipeBack: () {
                          _appinioSwiperController.swipeLeft();
                        },
                        onSwipeRight: () {
                          _currentIndexNotifier.value += 1;
                          _appinioSwiperController.swipeRight();
                        },
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
