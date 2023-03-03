import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  AppinioSwiperController _appinioSwiperController = AppinioSwiperController();

  @override
  void initState() {
    _appinioSwiperController.addListener(() {
      print("dome");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppinioSwiper(
        allowUnswipe: true,
        unlimitedUnswipe: true,
        controller: _appinioSwiperController,
        cards: List.generate(
          12,
          (index) => Center(
            child: SizedBox(
              height: 450,
              child: Card(
                color: Colors.deepOrange,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(index.toString(), textAlign: TextAlign.center),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back),
                        ),
                        IconButton(
                          onPressed: () {
                            _appinioSwiperController.unswipe();
                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
