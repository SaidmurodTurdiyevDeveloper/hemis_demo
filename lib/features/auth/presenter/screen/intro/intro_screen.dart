import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              controller: _controller,
              children: [Container(color: Colors.red), Container(color: Colors.green), Container(color: Colors.blue), Container(color: Colors.purple)],
            ),
          ),
          SmoothPageIndicator(
            count: 4,
            controller: _controller,
            effect: const ExpandingDotsEffect(dotWidth: 10, dotHeight: 10, activeDotColor: Colors.deepPurple, dotColor: Colors.deepPurple),
          ),
        ],
      ),
    );
  }

  void _nextPage() {}

  void _skip() {}

  void _finishingOnboarding() {}
}
