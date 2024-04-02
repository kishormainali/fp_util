extension IterationWithIndex<T> on Iterable<T> {
  /// Takes an action for each element.
  ///
  /// Calls [action] for each element along with the index in the
  /// iteration order.
  void forEachIndexed(void Function(int index, T element) action) {
    var index = 0;
    for (var element in this) {
      action(index++, element);
    }
  }

  /// Maps each element and its index to a new value.
  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    var index = 0;
    for (var element in this) {
      yield convert(index++, element);
    }
  }

  /// The elements whose value and index satisfies [test].
  Iterable<T> whereIndexed(bool Function(int index, T element) test) sync* {
    var index = 0;
    for (var element in this) {
      if (test(index++, element)) yield element;
    }
  }

  /// The elements whose value and index do not satisfy [test].
  Iterable<T> whereNotIndexed(bool Function(int index, T element) test) sync* {
    var index = 0;
    for (var element in this) {
      if (!test(index++, element)) yield element;
    }
  }

  /// Expands each element and index to a number of elements in a new iterable.
  Iterable<R> expandIndexed<R>(
      Iterable<R> Function(int index, T element) expand) sync* {
    var index = 0;
    for (var element in this) {
      yield* expand(index++, element);
    }
  }

  Iterable<T> getOrDefault(Iterable<T> defaultValue) =>
      isEmpty ? defaultValue : this;

  /// The first element whose value and index satisfies [test].
  ///
  /// Returns `null` if there are no element and index satisfying [test].
  T? firstWhereIndexedOrNull(bool Function(int index, T element) test) {
    var index = 0;
    for (var element in this) {
      if (test(index++, element)) return element;
    }
    return null;
  }

  /// The last element satisfying [test], or `null` if there are none.
  T? lastWhereOrNull(bool Function(T element) test) {
    T? result;
    for (var element in this) {
      if (test(element)) result = element;
    }
    return result;
  }

  /// The last element whose index and value satisfies [test].
  ///
  /// Returns `null` if no element and index satisfies [test].
  T? lastWhereIndexedOrNull(bool Function(int index, T element) test) {
    T? result;
    var index = 0;
    for (var element in this) {
      if (test(index++, element)) result = element;
    }
    return result;
  }

  /// The single element satisfying [test].
  ///
  /// Returns `null` if there are either no elements
  /// or more than one element satisfying [test].
  ///
  /// **Notice**: This behavior differs from [Iterable.singleWhere]
  /// which always throws if there are more than one match,
  /// and only calls the `orElse` function on zero matches.
  T? singleWhereOrNull(bool Function(T element) test) {
    T? result;
    var found = false;
    for (var element in this) {
      if (test(element)) {
        if (!found) {
          result = element;
          found = true;
        } else {
          return null;
        }
      }
    }
    return result;
  }

  /// The single element satisfying [test].
  ///
  /// Returns `null` if there are either none
  /// or more than one element and index satisfying [test].
  T? singleWhereIndexedOrNull(bool Function(int index, T element) test) {
    T? result;
    var found = false;
    var index = 0;
    for (var element in this) {
      if (test(index++, element)) {
        if (!found) {
          result = element;
          found = true;
        } else {
          return null;
        }
      }
    }
    return result;
  }
}

extension IterableX<T> on Iterable<T>? {
  /// checks weather list is not null or not empty
  bool get isNotNullNotEmpty {
    return this != null && this!.isNotEmpty;
  }

  /// checks weather list is  null or empty
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}
