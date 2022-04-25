class ThemeDocs {
  final Set<String> propertyTypes;

  const ThemeDocs({this.propertyTypes = defaultPropertyTyles});

  static const defaultPropertyTyles = {'color', 'double', 'bool'};
}
