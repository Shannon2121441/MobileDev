import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String userKey = 'user';

  // Simulated user data
  static final Map<String, dynamic> users = {
    '1': {
      'id': '1',
      'name': 'Shannon Po',
      'email': 's2121441@usls.edu.ph',
      'password': 'password123'
    }
  };

  static Future<bool> login(String email, String password) async {
    // Simulated login logic
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    final user = users.values.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => null);

    if (user != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(userKey, jsonEncode(user));
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> signUp(String name, String email, String password) async {
    // Simulated sign up logic
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    final id = (users.length + 1).toString();
    final newUser = {
      'id': id,
      'name': name,
      'email': email,
      'password': password
    };
    users[id] = newUser;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userKey, jsonEncode(newUser));
    return true;
  }

  static Future<void> logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(userKey);
    Navigator.pushReplacementNamed(
        context, '/intropage'); // Go back to the intro page
  }

  static Future<Map<String, dynamic>> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(userKey);
    return userString != null ? jsonDecode(userString) : null;
  }

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userKey) != null;
  }
}
