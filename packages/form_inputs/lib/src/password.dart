import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart' show FormzInput;

/// {@template password}
/// Form input for a password with specific validation requirements.
/// {@endtemplate}
@immutable
class Password extends FormzInput<String, PasswordValidationError>
    with EquatableMixin, FormzValidationMixin {
  /// Pure constructor for an initial untouched password.
  const Password.pure([super.value = '']) : super.pure();

  /// Dirty constructor for a password that has been interacted with.
  const Password.dirty([super.value = '']) : super.dirty();

  // Regular expressions for each password requirement
  static final RegExp _uppercaseRegExp = RegExp('[A-Z]');
  static final RegExp _lowercaseRegExp = RegExp('[a-z]');
  static final RegExp _numberRegExp = RegExp(r'\d');
  static final RegExp _specialCharRegExp = RegExp(r'[!@#\$&*~]');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 6 || value.length > 120) {
      return PasswordValidationError.length;
    } else if (!_uppercaseRegExp.hasMatch(value)) {
      return PasswordValidationError.noUppercase;
    } else if (!_lowercaseRegExp.hasMatch(value)) {
      return PasswordValidationError.noLowercase;
    } else if (!_numberRegExp.hasMatch(value)) {
      return PasswordValidationError.noNumber;
    } else if (!_specialCharRegExp.hasMatch(value)) {
      return PasswordValidationError.noSpecialCharacter;
    }
    return null; // Password is valid
  }

  @override
  Map<PasswordValidationError, String?> get validationErrorMessage => {
        PasswordValidationError.empty: 'Password is required.',
        PasswordValidationError.length:
            'Password must be between 6 and 120 characters.',
        PasswordValidationError.noUppercase:
            'Password must contain at least one uppercase letter.',
        PasswordValidationError.noLowercase:
            'Password must contain at least one lowercase letter.',
        PasswordValidationError.noNumber:
            'Password must contain at least one number.',
        PasswordValidationError.noSpecialCharacter:
            'Password must contain at least one special character'
                r' (e.g., !@#$&*~).',
      };

  @override
  List<Object?> get props => [value];
}

/// Validation errors for [Password].
/// Each error corresponds to a specific password rule.
enum PasswordValidationError {
  /// Empty password.
  empty,

  /// Password length is less than 6 or more than 120 characters.
  length,

  /// Missing an uppercase letter.
  noUppercase,

  /// Missing a lowercase letter.
  noLowercase,

  /// Missing a numeric character.
  noNumber,

  /// Missing a special character.
  noSpecialCharacter,
}
