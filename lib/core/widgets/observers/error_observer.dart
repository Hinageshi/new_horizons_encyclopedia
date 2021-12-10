import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/error_notifier.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/value_observer.dart';
import 'package:provider/provider.dart';

/// Listens an [ErrorNotifier] and displays an [AlertDialog] when
/// [ErrorNotifier.errorMessage] changes.
class ErrorObserver<T extends ErrorNotifier> extends StatefulWidget {
  /// Creates an [ErrorObserver].
  const ErrorObserver({
    Key? key,
    required this.child,
    this.shouldObserveRoute = true,
  }) : super(key: key);

  /// The widget below in the tree.
  ///
  /// {@macro flutter.widgets.child}.
  final Widget child;
  final bool shouldObserveRoute;

  @override
  _ErrorObserverState<T> createState() => _ErrorObserverState<T>();
}

class _ErrorObserverState<T extends ErrorNotifier>
    extends State<ErrorObserver<T>> with RouteAware {
  RouteObserver<PageRoute>? routeObserver;
  // To be sure to present dialog only if it's on screen currently
  int pagesPushed = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.shouldObserveRoute) {
      routeObserver = context.read<RouteObserver<PageRoute>>();
      routeObserver?.subscribe(this, ModalRoute.of(context) as PageRoute);
    }
  }

  @override
  void dispose() {
    routeObserver?.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ErrorMessage? errorMessage = context.select((T x) => x.errorMessage);

    return ValueObserver<ErrorMessage?>(
      value: errorMessage,
      onUpdated: (errorMessage) => _handleOnErrorNotified(
        context,
        errorMessage,
      ),
      child: widget.child,
    );
  }

  void _handleOnErrorNotified(
    BuildContext context,
    ErrorMessage? errorMessage,
  ) {
    if (errorMessage != null && pagesPushed == 0) {
      showDialog<void>(
        context: context,
        builder: (context) {
          return _DefaultErrorDialog(errorMessage: errorMessage);
        },
      );
    }
  }

  @override
  void didPopNext() => pagesPushed--;

  @override
  void didPushNext() => pagesPushed++;
}

class _DefaultErrorDialog extends StatelessWidget {
  const _DefaultErrorDialog({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  final ErrorMessage errorMessage;

  @override
  Widget build(BuildContext context) {
    final actionLabel = errorMessage.actionLabel;

    return AlertDialog(
      title: Text(errorMessage.title),
      content: Text(errorMessage.message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (errorMessage.onOk != null) {
              errorMessage.onOk?.call(context);
            }
          },
          child: Text(errorMessage.okLabel),
        ),
        if (actionLabel != null)
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              errorMessage.onAction?.call();
            },
            child: Text(actionLabel),
          ),
      ],
    );
  }
}
