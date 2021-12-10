import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Signature for a function that returns true when the update from [previous] to [current]
/// should call [onUpdated].
typedef ShouldCallOnUpdated<T> = bool Function(T previous, T current);

/// A widget which observe a single [value] and calls [onUpdated]
/// when the value is updated.
class ValueObserver<T> extends StatefulWidget {
  /// Creates a [ValueObserver].
  const ValueObserver({
    Key? key,
    required this.value,
    required this.onUpdated,
    required this.child,
    ShouldCallOnUpdated<T>? shouldCallOnUpdated,
    this.shouldCallOnInit = false,
  })  : shouldCallOnUpdated =
            shouldCallOnUpdated ?? _defaultShouldCallOnUpdated,
        super(key: key);

  static bool _defaultShouldCallOnUpdated<T>(T previous, T current) =>
      previous != current;

  /// The value to observe.
  final T value;

  /// The callback to use when [ValueObserver.value]
  /// is updated.
  final ValueChanged<T> onUpdated;

  /// The widget below in the tree.
  ///
  /// {@macro flutter.widgets.child}.
  final Widget child;

  /// Whether the class should run `onUpdated`.
  ///
  /// Defaults to `(previous, next) => previous != next`.
  final ShouldCallOnUpdated<T> shouldCallOnUpdated;

  /// Whether the class should run `onUpdated` with the first value.
  ///
  /// Default to `false`.
  final bool shouldCallOnInit;

  @override
  _ValueObserverState<T> createState() => _ValueObserverState<T>();
}

class _ValueObserverState<T> extends State<ValueObserver<T>> {
  @override
  void initState() {
    super.initState();
    if (widget.shouldCallOnInit) {
      _onUpdatedPostFrame();
    }
  }

  @override
  void didUpdateWidget(ValueObserver<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldCallOnUpdated(oldWidget.value, widget.value)) {
      _onUpdatedPostFrame();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _onUpdatedPostFrame() {
    return WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        widget.onUpdated(widget.value);
      },
    );
  }
}
