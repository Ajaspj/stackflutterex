import 'package:stacked/stacked.dart';

class ValidationViewModel extends BaseViewModel {
  String _email = '';
  String _password = '';
  String? _emailError;
  String? _passwordError;

  String get email => _email;
  String get password => _password;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  bool validate() {
    bool isValid = true;

    // Email validation
    if (_email.isEmpty) {
      _emailError = 'Email cannot be empty';
      isValid = false;
    } else if (!_isEmailValid(_email)) {
      _emailError = 'Enter a valid email address';
      isValid = false;
    } else {
      _emailError = null;
    }

    // Password validation
    if (_password.isEmpty) {
      _passwordError = 'Password cannot be empty';
      isValid = false;
    } else if (_password.length < 8) {
      _passwordError = 'Password must be at least 8 characters long';
      isValid = false;
    } else if (!_isPasswordStrong(_password)) {
      _passwordError = 'Password must include letters and numbers';
      isValid = false;
    } else {
      _passwordError = null;
    }

    notifyListeners();
    return isValid;
  }

  bool _isEmailValid(String email) {
    // Regular expression for email validation
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  bool _isPasswordStrong(String password) {
    // Regular expression for password strength validation
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    );
    return passwordRegExp.hasMatch(password);
  }
}
