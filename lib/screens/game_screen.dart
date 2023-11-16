import 'package:flutter/material.dart';
import 'package:flutter_mp_tictactoe/provider/room_data_provider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game-screen';

  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          Provider.of<RoomDataProvider>(context).romData.toString(),
        ),
      ),
    );
  }
}
