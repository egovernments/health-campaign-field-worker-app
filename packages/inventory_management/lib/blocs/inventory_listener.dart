abstract class InventoryListener {

}

class InventorySingleton {
  static final InventorySingleton _singleton = InventorySingleton._internal();
  factory InventorySingleton() {
    return _singleton;
  }

  InventorySingleton._internal();
  final List<InventoryListener> _listeners = [];

  void addListener(InventoryListener listener) {
    _listeners.add(listener);
  }
  void removeListener(InventoryListener listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (var listener in _listeners) {
      // listener.onInventoryChanged();
    }
  }

}