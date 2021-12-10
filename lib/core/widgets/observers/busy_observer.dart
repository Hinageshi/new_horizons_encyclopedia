import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/busy_notifier.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_loader.dart';
import 'package:provider/provider.dart';

/// Listens a [BusyNotifier] and displays either a loader or the child
/// depending on the [BusyNotifier.busy] value.
class BusyObserver<T extends ChangeNotifier> extends StatelessWidget {
  /// Creates a [BusyObserver].
  const BusyObserver({
    Key? key,
    required this.child,
    this.loader,
  }) : super(key: key);

  /// The widget below in the tree.
  ///
  /// {@macro flutter.widgets.child}.
  final Widget child;

  /// The loader widget to display while busy.
  final Widget? loader;

  @override
  Widget build(BuildContext context) {
    final bool isBusy = context.select<T, bool>((x) {
      if (x is BusyNotifier) {
        return x.busy;
      } else {
        return false;
      }
    });
    final safeLoader = loader;
    if (safeLoader == null) {
      return _DefaultLoader(
        enabled: isBusy,
        child: child,
      );
    }

    return isBusy ? safeLoader : child;
  }
}

class _DefaultLoader extends StatelessWidget {
  const _DefaultLoader({
    Key? key,
    required this.child,
    required this.enabled,
  }) : super(key: key);

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: enabled,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child,
          if (enabled) ...[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            const Center(
              child: AppLoader(),
            ),
          ],
        ],
      ),
    );
  }
}

/// Listens a [BusyNotifier] and displays either a loader or the child
/// depending on the [BusyNotifier.busy] value.
/// This version is lighly different than [BusyObserver] because we always keep
/// the same widget tree. We just opacify things when needed.
/// The BusyObserver is keep for the moment for backward compatibility.
class ExtendedBusyObserver<T extends ChangeNotifier> extends StatelessWidget {
  /// Creates a [BusyObserver].
  const ExtendedBusyObserver({
    Key? key,
    required this.child,
    this.loader,
    this.enabled = true,
    this.showChildWhileBusy = true,
  }) : super(key: key);

  /// The widget below in the tree.
  ///
  /// {@macro flutter.widgets.child}.
  final Widget child;

  /// The loader widget to display while busy.
  final Widget? loader;

  final bool enabled;

  final bool showChildWhileBusy;

  @override
  Widget build(BuildContext context) {
    final bool isBusy = context.select<T, bool>((x) {
      if (x is BusyNotifier) {
        return x.busy;
      } else {
        return false;
      }
    });

    return _ExtendedDefaultLoader(
      enabled: enabled && isBusy,
      loader: loader,
      showChildWhileBusy: showChildWhileBusy,
      child: child,
    );
  }
}

class _ExtendedDefaultLoader extends StatelessWidget {
  const _ExtendedDefaultLoader({
    Key? key,
    required this.child,
    required this.enabled,
    required this.showChildWhileBusy,
    this.loader,
  }) : super(key: key);

  final Widget child;
  final bool enabled;
  final bool showChildWhileBusy;
  final Widget? loader;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: enabled,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Opacity(
            opacity: !enabled || showChildWhileBusy ? 1 : 0,
            child: child,
          ),
          if (enabled) ...[
            if (loader == null)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            loader ?? const CircularProgressIndicator(),
          ],
        ],
      ),
    );
  }
}
