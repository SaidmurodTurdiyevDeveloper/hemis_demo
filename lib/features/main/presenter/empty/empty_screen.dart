import 'package:flutter/material.dart';

import '../../../../core/navigator/navigators.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamis app', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () => appRouter.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Center(
        child: Text('Bu oyna qilinish jarayonida', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
