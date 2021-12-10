import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ErrorCallback = void Function(BuildContext context);

/// An error message to clarify error state.
class ErrorMessage {
  /// Creates an [ErrorMessage].
  ErrorMessage({
    required this.title,
    required this.message,
    required this.okLabel,
    this.actionLabel,
    this.onAction,
    this.onOk,
  }) : assert((actionLabel == null && onAction == null) ||
            (actionLabel != null && onAction != null));

  /// The title of the message.
  final String title;

  /// The message.
  final String message;

  /// The label for the ok button
  /// that closes the dialog.
  final String okLabel;

  /// The label for the action button
  /// that fires `onAction`.
  final String? actionLabel;

  /// The callback to use when clicking
  /// on the action button.
  final VoidCallback? onAction;

  /// The callback to use when clicking
  /// on the ok button.
  final ErrorCallback? onOk;
}

/// A mixin used to notify when the view has failed.
mixin ErrorNotifier on ChangeNotifier {
  ErrorMessage? get errorMessage => _errorMessage;
  ErrorMessage? _errorMessage;
  @protected
  set errorMessage(ErrorMessage? value) {
    if (_errorMessage != value) {
      _errorMessage = value;
      notifyListeners();
    }
  }
}
