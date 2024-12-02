import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable [TextFormField] with default styling and behavior.
///
/// This widget provides a wide range of customization options for a text form
/// field, including styling, validation, and behavior controls.
class BaseTextFormField extends StatelessWidget {
  /// Creates a [BaseTextFormField].
  ///
  /// Many parameters are optional and will use default values if not specified.
  const BaseTextFormField({
    super.key,
    this.enableSuggestions,
    this.autocorrect,
    this.scrollPadding,
    this.cursorColor,
    this.decoration,
    this.enabled,
    this.labelText,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.onValidate,
    this.height,
    this.width,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.hintText,
    this.errorMaxLines,
    this.autoFocus = false,
    this.onTapOutside,
    this.obscureText = false,
    this.suffixIcon,
    this.contentPadding,
    this.style,
    this.filled,
    this.fillColor,
    this.defaultValidatorErrorMessage,
    this.textAlign,
    this.hintStyle,
    this.floatingLabelBehavior,
    this.labelStyle,
    this.suffixIconConstraints,
    this.inputFormatters,
    this.maxLines,
    this.labelPadding,
    this.autoValidateMode,
  });

  /// Whether to show input suggestions.
  final bool? enableSuggestions;

  /// Whether to enable autocorrect.
  final bool? autocorrect;

  /// The padding for scrollable ancestor widgets.
  final EdgeInsets? scrollPadding;

  /// The color of the cursor.
  final Color? cursorColor;

  /// The decoration to show around the text field.
  final InputDecoration? decoration;

  /// Whether the text field is enabled.
  final bool? enabled;

  /// The text to use for the floating label.
  final String? labelText;

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// Called when the user indicates that they are done editing the text in the
  /// field.
  final void Function(String text)? onFieldSubmitted;

  /// Called when the user changes the text in the field.
  final void Function(String text)? onChanged;

  /// Called with the current validation state when the input is validated.
  final void Function({required bool isValid})? onValidate;

  /// The height of the text field.
  final double? height;

  /// The width of the text field.
  final double? width;

  /// The type of action button to use for the keyboard.
  final TextInputAction? textInputAction;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// An optional method that validates an input. Returns an error string to
  /// display if the input is invalid, or null otherwise.
  final String? Function(String? value)? validator;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// The maximum number of lines the error text can occupy.
  final int? errorMaxLines;

  /// Whether this text field should focus itself if nothing else is already
  /// focused.
  final bool autoFocus;

  /// Called when the user taps outside of the text field.
  final void Function(PointerDownEvent event)? onTapOutside;

  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  /// An icon that appears after the editable part of the text field.
  final Widget? suffixIcon;

  /// The padding for the input decoration's container.
  final EdgeInsets? contentPadding;

  /// The style to use for the text being edited.
  final TextStyle? style;

  /// If true, the decoration's container is filled with [fillColor].
  final bool? filled;

  /// The color to fill the decoration's container with, if [filled] is true.
  final Color? fillColor;

  /// The error message to show when the default validator fails.
  final String? defaultValidatorErrorMessage;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The style to use for the [hintText].
  final TextStyle? hintStyle;

  /// Defines how the floating label should behave.
  final FloatingLabelBehavior? floatingLabelBehavior;

  /// The style to use for the [labelText].
  final TextStyle? labelStyle;

  /// Optional size constraints for the suffix icon.
  final BoxConstraints? suffixIconConstraints;

  /// Optional input validation and formatting rules.
  final List<TextInputFormatter>? inputFormatters;

  /// The maximum number of lines for the text to span, wrapping if necessary.
  final int? maxLines;

  /// The padding for the [labelText].
  final EdgeInsetsGeometry? labelPadding;

  /// Used to configure the auto validation of [FormField] and [Form] widgets.
  final AutovalidateMode? autoValidateMode;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: TextFormField(
          enableSuggestions: enableSuggestions ?? true,
          autocorrect: autocorrect ?? true,
          scrollPadding: scrollPadding ?? const EdgeInsets.all(20),
          cursorColor: cursorColor,
          maxLines: maxLines ?? 1,
          enabled: enabled,
          focusNode: focusNode,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          controller: controller,
          textAlign: textAlign ?? TextAlign.start,
          onTap: () => focusNode?.requestFocus(),
          autofocus: autoFocus,
          autovalidateMode: autoValidateMode,
          style: style ??
              context.appTextTheme.body3.copyWith(color: AppColorsTheme.purple),
          decoration: decoration ??
              InputDecoration(
                filled: filled ?? true,
                fillColor: fillColor ?? Colors.white,
                suffixIcon: suffixIcon,
                suffixIconConstraints: suffixIconConstraints,
                errorMaxLines: errorMaxLines,
                label: Padding(
                  padding: labelPadding ?? EdgeInsets.zero,
                  child: Text(
                    labelText ?? '',
                    style: labelStyle ??
                        context.appTextTheme.body3
                            .copyWith(color: AppColorsTheme.blue),
                  ),
                ),
                floatingLabelBehavior:
                    floatingLabelBehavior ?? FloatingLabelBehavior.always,
                hintText: hintText,
                hintStyle: hintStyle ??
                    context.appTextTheme.body3
                        .copyWith(color: AppColorsTheme.lightGrey),
                contentPadding:
                    contentPadding ?? const EdgeInsets.only(left: 5),
                enabledBorder: context.appTextFieldTheme.enabledBorder,
                disabledBorder: context.appTextFieldTheme.disabledBorder,
                focusedBorder: context.appTextFieldTheme.focusedBorder,
                errorBorder: context.appTextFieldTheme.errorBorder,
                focusedErrorBorder:
                    context.appTextFieldTheme.focusedErrorBorder,
              ),
          onChanged: onChanged,
          validator: (String? value) {
            if (validator != null) {
              final error = validator!.call(value);
              if (error != null) {
                onValidate?.call(isValid: false);
                return error;
              }
              onValidate?.call(isValid: true);
              return null;
            } else {
              // Use default validator if no custom validator is provided
              const textLengthValidatorErrorMessage = 'error text length';
              onValidate?.call(isValid: false);
              return defaultValidatorErrorMessage ??
                  textLengthValidatorErrorMessage;
            }
          },
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: textInputAction ?? TextInputAction.next,
          onTapOutside: onTapOutside ??
              (_) => FocusManager.instance.primaryFocus?.unfocus(),
        ),
      );
}
