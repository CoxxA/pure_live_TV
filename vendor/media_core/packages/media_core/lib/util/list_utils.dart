/// List related utilities.
abstract final class ListUtils {
  ListUtils._();

  /// Returns empty list when value is null.
  static List<T> emptyIfNull<T>(List<T>? value) {
    return value ?? <T>[];
  }

  /// Checks whether list is empty.
  static bool isEmpty<T>(List<T>? value) {
    return value == null || value.isEmpty;
  }

  /// Checks whether list is not empty.
  static bool isNotEmpty<T>(List<T>? value) {
    return !isEmpty(value);
  }

  /// Returns first item or null.
  static T? firstOrNull<T>(Iterable<T> values) {
    if (values.isEmpty) {
      return null;
    }

    return values.first;
  }

  /// Returns last item or null.
  static T? lastOrNull<T>(Iterable<T> values) {
    if (values.isEmpty) {
      return null;
    }

    return values.last;
  }

  /// Returns item at index or null.
  static T? elementAtOrNull<T>(List<T> values, int index) {
    if (index < 0 || index >= values.length) {
      return null;
    }

    return values[index];
  }

  /// Removes duplicated values.
  static List<T> distinct<T>(Iterable<T> values) {
    return values.toSet().toList();
  }

  /// Removes duplicated values by key.
  static List<T> distinctBy<T, K>(Iterable<T> values, K Function(T item) key) {
    final seen = <K>{};
    final result = <T>[];

    for (final item in values) {
      final id = key(item);

      if (seen.add(id)) {
        result.add(item);
      }
    }

    return result;
  }

  /// Splits list into chunks.
  static List<List<T>> chunk<T>(List<T> values, int size) {
    if (size <= 0) {
      throw ArgumentError('Size must be greater than zero');
    }

    final result = <List<T>>[];

    for (var i = 0; i < values.length; i += size) {
      final end = (i + size > values.length) ? values.length : i + size;

      result.add(values.sublist(i, end));
    }

    return result;
  }

  /// Returns paged list.
  static List<T> page<T>(List<T> values, int page, int pageSize) {
    if (page < 0 || pageSize <= 0) {
      return <T>[];
    }

    final start = page * pageSize;

    if (start >= values.length) {
      return <T>[];
    }

    final end = (start + pageSize > values.length) ? values.length : start + pageSize;

    return values.sublist(start, end);
  }

  /// Moves item to new position.
  static List<T> move<T>(List<T> values, int oldIndex, int newIndex) {
    final result = List<T>.from(values);

    if (oldIndex < 0 || oldIndex >= result.length || newIndex < 0 || newIndex >= result.length) {
      return result;
    }

    final item = result.removeAt(oldIndex);

    result.insert(newIndex, item);

    return result;
  }

  /// Inserts item if not exists.
  static List<T> addUnique<T>(List<T> values, T value) {
    if (values.contains(value)) {
      return values;
    }

    return [...values, value];
  }

  /// Removes item safely.
  static List<T> remove<T>(List<T> values, T value) {
    return values.where((item) => item != value).toList();
  }

  /// Returns items matching predicate.
  static List<T> where<T>(Iterable<T> values, bool Function(T value) test) {
    return values.where(test).toList();
  }

  /// Groups items by key.
  static Map<K, List<T>> groupBy<T, K>(Iterable<T> values, K Function(T item) key) {
    final result = <K, List<T>>{};

    for (final item in values) {
      final group = key(item);

      result.putIfAbsent(group, () => <T>[]).add(item);
    }

    return result;
  }

  /// Returns true when lists contain same values.
  static bool equals<T>(List<T> a, List<T> b) {
    if (identical(a, b)) {
      return true;
    }

    if (a.length != b.length) {
      return false;
    }

    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }

    return true;
  }

  /// Removes null values.
  static List<T> whereNotNull<T>(Iterable<T?> values) {
    return values.where((value) => value != null).cast<T>().toList();
  }

  /// Flattens nested lists.
  static List<T> flatten<T>(Iterable<Iterable<T>> values) {
    return values.expand((e) => e).toList();
  }

  /// Returns reversed copy.
  static List<T> reversed<T>(Iterable<T> values) {
    return values.toList().reversed.toList();
  }
}
