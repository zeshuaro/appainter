import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/theme_preview/views/preview_body.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class InputsPage extends PreviewBody {
  const InputsPage({Key? key}) : super(key: key);

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
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _TextFieldEnabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(labelText: 'Label'),
    );
  }
}

class _TextFieldDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      enabled: false,
      decoration: InputDecoration(labelText: 'Disabled'),
    );
  }
}

class _TextFieldHintHelperCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
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
      decoration: const InputDecoration(
        prefixText: 'Prefix: ',
        suffixText: 'Suffix',
      ),
    );
  }
}

class _TextFieldError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Label',
        errorText: 'Error',
      ),
    );
  }
}
