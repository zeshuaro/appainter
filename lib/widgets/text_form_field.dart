import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  final String? initialValue;
  final bool? enabled;
  final TextEditingController? controller;

  const MyTextFormField({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.initialValue,
    this.enabled,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      initialValue: initialValue,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[850]
            : Colors.grey[200],
        labelText: labelText,
      ),
      onChanged: onChanged,
    );
  }
}
