import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  
  Future<Map<String, dynamic>> getStartupValues() async {
    final _counter = await _getCounterFromSharedPref();
    final _textColorInt = await _getCounterColorFromSharedPref();
    return {
      'counter': _counter,
      'textColorInt': _textColorInt,
    };
  }

  Future<int> _getCounterFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('startupNumber');
    if (startupNumber == null) {
      return 0;
    }
    return startupNumber;
  }

  Future<int> _getCounterColorFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final startupColor = prefs.getInt('startupColor');
    if (startupColor == null) {
      return Colors.black.value;
    }
    return startupColor;
  }

  Future<void> resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('startupNumber', 0);
    await prefs.setInt('startupColor', Colors.black.value);
  }

  Future<void> storeCounter(int counter, int textColorInt) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('startupNumber', counter);
    await prefs.setInt('startupColor', textColorInt);
  }
}
