import 'package:appainter/text_theme/text_theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FontPicker extends StatelessWidget {
  const FontPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<FontData>(
      key: const Key('fontPicker'),
      mode: Mode.MENU,
      showSearchBox: true,
      isFilteredOnline: true,
      selectedItem: FontData.defaultFontData(),
      dropdownSearchDecoration: const InputDecoration(labelText: 'Font family'),
      itemAsString: (item) => item?.family ?? kDefaultFontFamily,
      searchFieldProps: TextFieldProps(
        decoration: const InputDecoration(
          labelText: 'Search for fonts',
          helperText: 'Fonts are sourced from Google Fonts, '
              'only the top $kMaxFontSearchResults fonts are shown',
          helperMaxLines: 2,
          border: OutlineInputBorder(),
        ),
      ),
      popupItemBuilder: (context, item, isSelected) {
        return ListTile(
          key: Key('fontPicker_${item.family}'),
          title: Text(item.family, style: item.style),
        );
      },
      onFind: (query) => _onFind(context, query),
      onChanged: (data) => _onChanged(context, data),
    );
  }

  Future<List<FontData>> _onFind(BuildContext context, String? query) {
    return Future.value(
      query != null
          ? context.read<TextThemeRepository>().searchFonts(query)
          : [],
    );
  }

  void _onChanged(BuildContext context, FontData? data) {
    if (data != null) {
      context.read<TextThemeCubit>().fontFamilyChanged(data.family);
    }
  }
}
