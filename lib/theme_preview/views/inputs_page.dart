import 'package:flutter/material.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/theme_preview/views/preview_body.dart';
import 'package:appainter/widgets/widgets.dart';

class InputsPage extends PreviewBody {
  const InputsPage({super.key});

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
