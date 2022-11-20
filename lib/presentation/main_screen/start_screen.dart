import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    // textEditingController.value.text = 'fy44mks9itt8r8iqtd54o41qb4qijh18ro7bbs6i9xouhpx9tf8y';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'FastReport Cloud',
          style: TextStyle(
            fontSize: 40,
            color: Color(0xFF1E7BB9),
          ),
        ),
        const SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your token',
            ),
          ),
        ),
        const SizedBox(height: 22),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 215,

            child: const Text(
              'Продолжить',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Еще нет токена? ',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            GestureDetector(
              onTap: _launchUrl,
              child: const Text(
                'Получить',
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    );
  }



  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse('https://id.fast-report.com/Account/SignIn'))) {
      throw 'Could not launch ${Uri.parse('https://id.fast-report.com/Account/SignIn')}';
    }
  }
}
