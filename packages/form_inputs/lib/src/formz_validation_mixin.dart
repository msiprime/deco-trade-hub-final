import 'package:formz/formz.dart';

/// Mixin on [FormzInput] that provides common functionality for form input
/// fields.
///
/// It has:
/// - [errorMessage] getter that returns an error message based on [E]
/// - [validationErrorMessage] map that contains error messages for each [E]
mixin FormzValidationMixin<T, E> on FormzInput<T, E> {
  /// Returns the validation error if the input is invalid.
  // E? get validationError => error;

  /// Returns email error text based on [E].
  String? get errorMessage => validationErrorMessage[error];

  /// Email validation errors message
  Map<E?, String?> get validationErrorMessage;
}
