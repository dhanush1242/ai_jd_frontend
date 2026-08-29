import 'package:flutter_riverpod/flutter_riverpod.dart';

// A simple global state for UI testing to track if the candidate has completed their profile
final profileCompletedProvider = StateProvider<bool>((ref) => false);
