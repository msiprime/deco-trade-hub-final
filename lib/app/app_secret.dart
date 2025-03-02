import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSecrets {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';

  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  static String get stripePublishableKey =>
      dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';

  static String get stripeSecretKey => dotenv.env['STRIPE_SECRET_KEY'] ?? '';

  static Future<void> load() async {
    await dotenv.load();
  }
}
