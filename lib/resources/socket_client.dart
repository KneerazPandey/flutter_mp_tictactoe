import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SocketClient {
  IO.Socket? socket;

  static SocketClient? _instance;

  SocketClient._internal() {
    String baseUrl = dotenv.env['BASE_URL'] ?? 'http://0.0.0.0:3000';
    socket = IO.io(baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
