import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  final AppinioSwiperController swiperController;

  const FormCard({
    Key? key,
    required this.swiperController,
  }) : super(key: key);

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
            Text("How many times a day do you eat?", style: theme.titleLarge),
            Card(
              child: Row(
                children: [
                  Checkbox(
                    shape: const CircleBorder(),
                    value: false,
                    onChanged: (value) {},
                  ),
                  const Text("1"),
                ],
              ),
            ),
            Card(
              color: Colors.deepOrange,
              child: Row(
                children: [
                  Checkbox(
                    shape: const CircleBorder(),
                    value: false,
                    onChanged: (value) {},
                  ),
                  const Text("2"),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  Checkbox(
                    shape: const CircleBorder(),
                    value: false,
                    onChanged: (value) {},
                  ),
                  const Text("3"),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  Checkbox(
                    shape: const CircleBorder(),
                    value: false,
                    onChanged: (value) {},
                  ),
                  const Text("4 and more"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => swiperController.swipeLeft(),
                  child: const Text("Back"),
                ),
                TextButton(
                  onPressed: () => swiperController.swipeRight(),
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
