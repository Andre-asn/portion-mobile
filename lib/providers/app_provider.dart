import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AppProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  
  User? get currentUser => _authService.currentUser;
  bool get isSignedIn => _authService.isSignedIn;

  Future<bool> signIn(String email, String password) async {
    final success = await _authService.signIn(email, password);
    if (success) {
      notifyListeners();
    }
    return success;
  }

  Future<bool> signUp(String name, String email, String password) async {
    final success = await _authService.signUp(name, email, password);
    if (success) {
      notifyListeners();
    }
    return success;
  }

  Future<void> signOut() async {
    await _authService.signOut();
    notifyListeners();
  }
} 