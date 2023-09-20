import 'package:flutter/material.dart';
import 'package:flutter_mp_tictactoe/widgets/widgets.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              buttonName: 'Create Room',
              onPressed: () {},
            ),
            const SizedBox(height: 18),
            CustomButton(
              buttonName: 'Join Room',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
