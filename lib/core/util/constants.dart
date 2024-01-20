import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Constants {
  static String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  static String supabaseAnon = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
}
