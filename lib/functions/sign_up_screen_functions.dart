import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpScreenFunctions {
  static bool validateNameBoolean(String str) {
    str=str.trim();
    List<String> words = str.split(' ');
    return words.length == 4;
  }
  static bool validatePhoneBoolean(String inputText) {
    final pattern = r'^(00972|00970|\+972|\+970)(59|56)\d{7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(inputText);
  }

  static bool validateEmailBoolean(String inputString) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(inputString);
  }

  static bool validatePassBoolean(String password) {
    const pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  static bool validateRepeatePassBoolean(String pass, String rep){
    return pass==rep;
  }

  static String validateNameString(String inputString) {
    inputString = inputString.trim();
    List<String> words = inputString.split(' ');
    if (words.length != 4) {
      if (words.length < 4) {
        return 'Input string should contain exactly four words.';
      } else {
        return 'Input string should contain only four words.';
      }
    }
    return 'Valid Name.';
  }

  static String validatePhoneString(String inputText) {
    const pattern = r'^(00972|00970|\+972|\+970)(59|56)\d{7}$';
    final regex = RegExp(pattern);
    if (regex.hasMatch(inputText)) {
      return 'Valid Phone Number.'; // No error, return null
    } else {
      // Input text is not a valid phone number
      return 'Invalid phone number.'; // Return specific error message
    }
  }

  static String validatePassString(String password) {
    const lowercasePattern = r'(?=.*[a-z])';
    const uppercasePattern = r'(?=.*[A-Z])';
    const digitPattern = r'(?=.*\d)';
    const specialCharPattern = r'(?=.*[@$!%*?&])';
    const lengthPattern = r'.{8,}';

    if (!RegExp(lowercasePattern).hasMatch(password)) {
      return 'Password must contain at least one lowercase letter.';
    }
    if (!RegExp(uppercasePattern).hasMatch(password)) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!RegExp(digitPattern).hasMatch(password)) {
      return 'Password must contain at least one digit.';
    }
    if (!RegExp(specialCharPattern).hasMatch(password)) {
      return 'Password must contain at least one special character.';
    }
    if (!RegExp(lengthPattern).hasMatch(password)) {
      return 'Password must be at least 8 characters long.';
    }

    return 'Valid Password.';
  }

  static String validateRepeatePassString(String pass, String rep){
    if(pass == rep){
      return "ok";
    }
    else{
      return 'Repetion of Password is not same with Password.';
    }
  }

  static String validateEmailString(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty.';
    }
    if (email.indexOf('@') == -1 || email.indexOf('@') != email.lastIndexOf('@')) {
      return 'Invalid email format.';
    }
    if (!RegExp(r'^[a-zA-Z0-9]').hasMatch(email)) {
      return 'Email must start with an alphanumeric character.';
    }
    if (!RegExp(r'\.[a-zA-Z]{2,}$').hasMatch(email)) {
      return 'Invalid email.';
    }
    return 'Valid Email.';
  }
}