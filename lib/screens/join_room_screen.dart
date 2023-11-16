import 'package:flutter/material.dart';
import 'package:flutter_mp_tictactoe/core/core.dart';
import 'package:flutter_mp_tictactoe/resources/socket_methods.dart';
import 'package:flutter_mp_tictactoe/widgets/custom_button.dart';
import 'package:flutter_mp_tictactoe/widgets/custom_text_field.dart';
import 'package:flutter_mp_tictactoe/widgets/glowing_text.dart';

class JoinRoomScreen extends StatefulWidget {
  static const String routeName = '/join-room';

  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  late TextEditingController nickNameController;
  late TextEditingController gameIdController;
  final SocketMethods socketMethods = SocketMethods();

  @override
  void initState() {
    nickNameController = TextEditingController();
    gameIdController = TextEditingController();
    socketMethods.joinRoomSuccessListener(context);
    socketMethods.errorOccuredListener(context);
    super.initState();
  }

  @override
  void dispose() {
    nickNameController.dispose();
    gameIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Responsive(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const GlowingText(
                  text: 'Join Room',
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius: 40,
                      color: Colors.blue,
                    ),
                  ],
                  fontSize: 82,
                ),
                SizedBox(height: size.height * 0.08),
                CustomTextField(
                  controller: nickNameController,
                  hintText: 'Enter your nickname',
                ),
                SizedBox(height: size.height * 0.041),
                CustomTextField(
                  controller: gameIdController,
                  hintText: 'Enter Game ID',
                ),
                SizedBox(height: size.height * 0.048),
                CustomButton(
                  buttonName: 'Join',
                  onPressed: () {
                    socketMethods.joinRoom(
                      nickname: nickNameController.text,
                      roomId: gameIdController.text,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
