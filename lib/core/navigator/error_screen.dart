import 'package:flutter/material.dart';
import 'package:hemis_demo/core/navigator/navigators.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => appRouter.pop(), icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text('Error'),
      ),
    );
  }
}
