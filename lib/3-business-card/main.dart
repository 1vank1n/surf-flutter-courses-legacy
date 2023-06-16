import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

const spacerHeight = 24.0;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(spacerHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 100.0,
                    backgroundImage: AssetImage(
                      'assets/images/avatar.jpg',
                    ),
                  ),
                  const SizedBox(height: spacerHeight),
                  Text(
                    'Ivan Lukyanets',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: spacerHeight),
                  Transform.rotate(
                    angle: -pi / 120.0,
                    child: const ContentCard(
                      title: 'О себе',
                      content: 'Живу в Сочи. Счастливо женат. Двое детей. Одна собака.',
                      imagePath: 'assets/images/mario.png',
                    ),
                  ),
                  const SizedBox(height: spacerHeight),
                  Transform.rotate(
                    angle: pi / 120.0,
                    child: const ContentCard(
                      title: 'Увлечения',
                      content: 'Сериалы, игры, гитара, баскетбол.',
                      imagePath: 'assets/images/coin.png',
                    ),
                  ),
                  const SizedBox(height: spacerHeight),
                  Transform.rotate(
                    angle: -pi / 120.0,
                    child: const ContentCard(
                      title: 'Опыт в разработке',
                      content: 'Python, JS, Objective-C, Swift, Dart',
                      imagePath: 'assets/images/star.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  const ContentCard({
    super.key,
    required this.title,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(spacerHeight / 2),
          decoration: const BoxDecoration(
            color: Colors.white30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Image.asset(
                imagePath,
                width: spacerHeight,
                height: spacerHeight,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(spacerHeight / 2),
          decoration: const BoxDecoration(
            color: Colors.white54,
          ),
          child: Text(
            content,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
