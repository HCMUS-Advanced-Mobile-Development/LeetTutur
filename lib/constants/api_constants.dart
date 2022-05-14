import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final String baseURL =
      dotenv.env['BASE_URL'] ?? "https://sandbox.api.lettutor.com";
  static final String meetingURL =
      dotenv.env['MEETING_URL'] ?? "https://meet.lettutor.com";
  static final String wsUrl = dotenv.env['SOCKET_URL'] ??
      "wss://sandbox.api.lettutor.com/socket.io/?EIO=4&transport=websocket";
}
