import 'package:flutter/material.dart';
import 'package:flutter_mp_tictactoe/core/core.dart';
import 'package:flutter_mp_tictactoe/widgets/custom_button.dart';
import 'package:flutter_mp_tictactoe/widgets/custom_text_field.dart';
import 'package:flutter_mp_tictactoe/widgets/glowing_text.dart';

class CreateRoomScreen extends StatefulWidget {
  static const String routeName = '/create-room';

  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  late TextEditingController nickNameController;

  @override
  void initState() {
    nickNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nickNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const GlowingText(
                text: 'Create Room',
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
              SizedBox(height: size.height * 0.045),
              CustomButton(
                buttonName: 'Create',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
