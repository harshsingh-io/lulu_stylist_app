import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvLoader {
  static Future<void> loadEnv() async {
    try {
      final envString = await rootBundle.loadString('.env');
      await dotenv.load(fileName: envString);
    } catch (e) {
      print('Error loading env: $e');
      rethrow;
    }
  }
}
