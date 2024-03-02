extension MapX<K, V> on Map<K, V> {
  /// get value if null or null
  V? getOrNull(K key) => containsKey(key) ? this[key] : null;

  /// get value if null or null
  V getOrDefault(K key, V defaultValue) {
    if (containsKey(key)) {
      return this[key]!;
    } else {
      return defaultValue;
    }
  }

  /// get values list
  List<V> get valuesList => values.toList();

  /// get keys list
  List<K> get keysList => keys.toList();

  /// get entries list
  List<MapEntry<K, V>> get entriesList => entries.toList();

  /// merge two maps into one
  /// if the same key exists, the value of the other map will be used
  Map<K, V> merge(Map<K, V> other) {
    return {...this, ...other};
  }
}
