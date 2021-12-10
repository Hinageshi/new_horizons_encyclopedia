/// Interface for notifiers that can be used with [NotifierLoader].
abstract class LoadableNotifier {
  /// Loads data.
  Future<void> load();
}
