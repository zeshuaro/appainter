import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

import 'preview_body.dart';

class InputsPage extends PreviewBody {
  @override
  IconData get icon => Icons.keyboard;

  @override
  String get label => 'Inputs';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: MyListView(
        padding: kPaddingAll,
        children: [
          _TextFieldEnabled(),
          _TextFieldDisabled(),
          _TextFieldHintHelperCounter(),
          _TextFieldPrefixSuffix(),
          _TextFieldError(),
          _SwitchEnabled(),
          _SwitchDisabled(),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _TextFieldEnabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: 'Label'),
    );
  }
}

class _TextFieldDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(labelText: 'Disabled'),
    );
  }
}

class _TextFieldHintHelperCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Hint',
        helperText: 'Helper',
        counterText: 'Counter',
      ),
    );
  }
}

class _TextFieldPrefixSuffix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: 'Input',
      decoration: InputDecoration(
        prefixText: 'Prefix: ',
        suffixText: 'Suffix',
      ),
    );
  }
}

class _TextFieldError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Label',
        errorText: 'Error',
      ),
    );
  }
}

class _SwitchEnabled extends StatefulWidget {
  @override
  _SwitchEnabledState createState() => _SwitchEnabledState();
}

class _SwitchEnabledState extends State<_SwitchEnabled> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      title: 'Switch Enabled',
      trailing: Switch(
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}

class _SwitchDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyListTile(
      title: 'Switch Disabled',
      titleColor: Theme.of(context).disabledColor,
      trailing: Switch(
        value: true,
        onChanged: null,
      ),
    );
  }
}
