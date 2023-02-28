import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:project1/form_card.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SurveyFormScreen extends StatelessWidget {
  SurveyFormScreen({
    super.key,
  });

  final AppinioSwiperController _appinioSwiperController =
      AppinioSwiperController();

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
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "1 of 4",
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 32,
                  size: 8,
                  padding: 0,
                  selectedColor: Colors.blue,
                  unselectedColor: Color.fromARGB(255, 120, 120, 120),
                  roundedEdges: Radius.circular(10),
                ),
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
                      12,
                      (index) => FormCard(
                            swiperController: _appinioSwiperController,
                          )),
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
