import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rsupa/core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

initApp() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: Constants.supabaseUrl, anonKey: Constants.supabaseAnon);
}
