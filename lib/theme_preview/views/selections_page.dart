import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/theme_preview/views/preview_body.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:intl/intl.dart';

class SelectionsPage extends PreviewBody {
  @override
  IconData get icon => Icons.select_all;

  @override
  String get label => 'Selections';

  @override
  Widget build(BuildContext context) {
    return MyListView(
      padding: kPaddingAll,
      children: [
        _CheckboxEnabled(),
        _CheckboxDisabled(),
        Divider(height: 0),
        _Radio(),
        Divider(height: 0),
        Text(
          'Sliders',
          style: kListTileTitleStyle,
        ),
        _SliderEnabled(),
        _SliderEnabledDivisions(),
        _SliderDisabled(),
        Divider(height: 0),
        _DatePicker(),
        _TimePicker(),
        SizedBox(height: 50),
      ],
    );
  }
}

class _CheckboxEnabled extends StatefulWidget {
  @override
  _CheckboxEnabledState createState() => _CheckboxEnabledState();
}

class _CheckboxEnabledState extends State<_CheckboxEnabled> {
  bool? _value = true;

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      title: 'Checkbox Enabled',
      trailing: Checkbox(
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}

class _CheckboxDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyListTile(
      title: 'Checkbox Disabled',
      titleColor: Theme.of(context).disabledColor,
      trailing: Checkbox(
        value: true,
        onChanged: null,
      ),
    );
  }
}

class _Radio extends StatefulWidget {
  @override
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<_Radio> {
  int? _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [0, 1, 2].map(
        (value) {
          return MyListTile(
            title: 'Radio ${value + 1}',
            trailing: Radio(
              value: value,
              groupValue: _groupValue,
              onChanged: (int? newValue) => setState(() {
                _groupValue = newValue;
              }),
            ),
          );
        },
      ).toList()
        ..add(
          MyListTile(
            title: 'Radio Disabled',
            titleColor: Theme.of(context).disabledColor,
            trailing: Radio(
              value: null,
              groupValue: null,
              onChanged: null,
            ),
          ),
        ),
    );
  }
}

class _SliderEnabled extends StatefulWidget {
  @override
  _SliderEnabledState createState() => _SliderEnabledState();
}

class _SliderEnabledState extends State<_SliderEnabled> {
  double _value = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      min: 0,
      max: 100,
      label: _value.round().toString(),
      onChanged: (value) => setState(() => _value = value),
    );
  }
}

class _SliderEnabledDivisions extends StatefulWidget {
  @override
  _SliderEnabledDivisionsState createState() => _SliderEnabledDivisionsState();
}

class _SliderEnabledDivisionsState extends State<_SliderEnabledDivisions> {
  double _value = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      min: 0,
      max: 100,
      divisions: 5,
      label: _value.round().toString(),
      onChanged: (value) => setState(() => _value = value),
    );
  }
}

class _SliderDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: 20,
      min: 0,
      max: 100,
      onChanged: null,
    );
  }
}

class _DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<_DatePicker> {
  final _firstDate = DateTime(2018, 12, 4);
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(_dateTime);
    return MyListTile(
      title: 'Date Picker: $formattedDate',
      trailing: ElevatedButton(
        onPressed: () async {
          final dateTime = await showDatePicker(
            context: context,
            initialDate: _dateTime,
            firstDate: _firstDate,
            lastDate: DateTime.now(),
          );

          if (dateTime != null) setState(() => _dateTime = dateTime);
        },
        child: Text('Pick Date'),
      ),
    );
  }
}

class _TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<_TimePicker> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      title: 'Time Picker: ${_timeOfDay.format(context)}',
      trailing: ElevatedButton(
        onPressed: () async {
          final timeOfDay =
              await showTimePicker(context: context, initialTime: _timeOfDay);

          if (timeOfDay != null) setState(() => _timeOfDay = timeOfDay);
        },
        child: Text('Pick Time'),
      ),
    );
  }
}
