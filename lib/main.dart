import 'package:flutter/material.dart';
import 'package:flutter_mp_tictactoe/core/core.dart';
import 'package:flutter_mp_tictactoe/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
      debugShowCheckedModeBanner: false,
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
