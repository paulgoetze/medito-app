
import 'package:flutter/foundation.dart';

class MockStats {
  static const enabled = kDebugMode;
  
  static List<DateTime> getMockedDays() => [
    DateTime.now(),
    DateTime.now().subtract(const Duration(days: 1)),
  ];
} 