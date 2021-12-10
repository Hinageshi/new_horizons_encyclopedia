import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/loadable_notifier.dart';
import 'package:provider/provider.dart';

/// A widget which can be used to load resources when it's inserted in the tree.
///
/// For example, you can use this widget to load data from the repository, the
/// first time this widget builds.
class NotifierLoader<T extends LoadableNotifier> extends StatefulWidget {
  /// Creates a [NotifierLoader] which will call the [LoadableNotifier.load] method of the
  /// [LoadableNotifier] of type [T].
  ///
  /// [child] must not be null.
  const NotifierLoader({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _NotifierLoaderState<T> createState() => _NotifierLoaderState<T>();
}

class _NotifierLoaderState<T extends LoadableNotifier>
    extends State<NotifierLoader<T>> {
  @override
  void initState() {
    super.initState();
    // We delay the loading, because if one of the `load` method is calling
    // `notifyListeners` synchronously, we would end up with an error, because we can't
    // rebuild a parent here.
    // The counter part, is that the actual rebuild will occur in two frames
    // and not in the next one.
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        context.read<T>().load();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
