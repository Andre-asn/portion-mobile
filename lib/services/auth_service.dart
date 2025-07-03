import '../models/user.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<bool> signIn(String email, String password) async {
    // TODO: Implement actual authentication
    // For now, create a mock user
    _currentUser = User(
      id: 'user_123',
      name: 'John Doe',
      email: email,
      createdAt: DateTime.now(),
    );
    return true;
  }

  Future<bool> signUp(String name, String email, String password) async {
    // TODO: Implement actual registration
    _currentUser = User(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      createdAt: DateTime.now(),
    );
    return true;
  }

  Future<void> signOut() async {
    _currentUser = null;
  }

  bool get isSignedIn => _currentUser != null;
} 