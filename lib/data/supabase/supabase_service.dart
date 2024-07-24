import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A class that represents a Supabase client.
class SupabaseService {
  /// Initializes the Supabase client.
  ///
  /// The [supabaseUrl] is the URL of the Supabase server.
  /// The [supabaseAnonKey] is the anonymous key for accessing the Supabase server.
  static Future<void> initialize() async {
    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

    // initialize supabase
    await Supabase.initialize(
      url: supabaseUrl!,
      anonKey: supabaseAnonKey!,
    );
  }
}
