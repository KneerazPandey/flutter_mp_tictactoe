import 'package:flutter/material.dart';
import 'package:flutter_mp_tictactoe/core/core.dart';
import 'package:flutter_mp_tictactoe/provider/room_data_provider.dart';
import 'package:flutter_mp_tictactoe/screens/game_screen.dart';
import 'package:flutter_mp_tictactoe/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext cotext) => RoomDataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        routes: <String, Widget Function(BuildContext)>{
          MainMenuScreen.routeName: (BuildContext context) =>
              const MainMenuScreen(),
          CreateRoomScreen.routeName: (BuildContext context) =>
              const CreateRoomScreen(),
          JoinRoomScreen.routeName: (BuildContext context) =>
              const JoinRoomScreen(),
          GameScreen.routeName: (BuildContext context) => const GameScreen(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: MainMenuScreen.routeName,
      ),
    );
  }
}
