import 'package:flutter/material.dart';
import 'package:flutter_mp_tictactoe/core/core.dart';
import 'package:flutter_mp_tictactoe/screens/screens.dart';
import 'package:flutter_mp_tictactoe/widgets/widgets.dart';

class MainMenuScreen extends StatelessWidget {
  static const String routeName = '/main-menu';

  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Responsive(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton(
                buttonName: 'Create Room',
                onPressed: () {
                  navigateToCreateRoomScreen(context);
                },
              ),
              const SizedBox(height: 18),
              CustomButton(
                buttonName: 'Join Room',
                onPressed: () {
                  navigateToJoinRoomScreen(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToCreateRoomScreen(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void navigateToJoinRoomScreen(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }
}
