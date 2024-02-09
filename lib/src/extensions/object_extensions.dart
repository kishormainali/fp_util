extension ObjectUtils<T> on T? {
  /// Returns the result of the [callback] function applied to this value.
  R? let<R>(R Function(T) callback) {
    if (this == null) {
      return null;
    }
    return callback.call(this as T);
  }

  /// Returns the result of the [callback] function applied to this value.
  T? also(void Function(T) callback) {
    if (this == null) {
      return null;
    }
    callback.call(this as T);
    return this;
  }

  /// safe cast
  R? safeCast<R>() {
    if (this is R) {
      return this as R;
    }
    return null;
  }
}
