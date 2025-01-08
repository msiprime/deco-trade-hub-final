import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSecrets {
  // Static variables to hold Supabase credentials
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  // You can also add other secrets here as needed

  // Method to load .env variables
  static Future<void> load() async {
    // await dotenv.load(fileName: ".env");
    await dotenv.load();
  }
}
