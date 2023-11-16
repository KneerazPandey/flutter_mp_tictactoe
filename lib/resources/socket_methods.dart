import 'package:flutter/material.dart';
import 'package:flutter_mp_tictactoe/provider/room_data_provider.dart';
import 'package:flutter_mp_tictactoe/resources/socket_client.dart';
import 'package:flutter_mp_tictactoe/screens/game_screen.dart';
import 'package:provider/provider.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit(
        'createRoom',
        <String, dynamic>{
          'nickname': nickname,
        },
      );
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}
