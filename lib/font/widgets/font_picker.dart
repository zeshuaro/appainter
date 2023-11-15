import 'package:appainter/font/font.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FontPicker extends StatelessWidget {
  const FontPicker({super.key, required this.onChanged});

  final ValueChanged<FontData> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<FontData>(
      key: const Key('fontPicker'),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        isFilterOnline: true,
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            labelText: 'Search for fonts',
            helperText: 'Fonts are sourced from Google Fonts, '
                'only the top $kMaxFontSearchResults fonts are shown',
            helperMaxLines: 2,
            border: OutlineInputBorder(),
          ),
        ),
        itemBuilder: (context, item, isSelected) {
          return ListTile(
            key: Key('fontPicker_${item.family}'),
            title: Text(item.family, style: item.style),
          );
        },
      ),
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(labelText: 'Font family'),
      ),
      selectedItem: FontData.defaultFontData(),
      itemAsString: (item) => item.family,
      asyncItems: (query) => _onFind(context, query),
      onChanged: (data) => _onChanged(context, data),
    );
  }

  Future<List<FontData>> _onFind(BuildContext context, String query) {
    return Future.value(context.read<FontRepository>().searchFonts(query));
  }

  void _onChanged(BuildContext context, FontData? data) {
    if (data != null) {
      onChanged(data);
    }
  }
}
