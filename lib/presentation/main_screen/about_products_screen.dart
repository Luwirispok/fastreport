import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutProductScreen extends StatelessWidget {
  const AboutProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Документы'),
        ),
      ),
      body: Container(
        child: Center(
            child: Text(
          'HUI',
        )),
      ),
    );
  }
}
