class EnumModel<T> {
  final Map<String, T> _values;
  final Map<T, String> _names;

  EnumModel(this._values)
      : _names = _values.map((key, value) => MapEntry(value, key));

  List<String> get names => _values.keys.toList();
  List<T> get values => _values.values.toList();

  T? fromString(String? value) => _values[value];
  String? convertToString(T? value) => _names[value];
}
