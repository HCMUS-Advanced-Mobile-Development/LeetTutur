import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
    static final String baseURL = dotenv.env['BASE_URL']!;
    static final String meetingURL = dotenv.env['MEETING_URL']!;
}
