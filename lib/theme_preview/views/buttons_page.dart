import 'package:flutter/material.dart';
import 'package:flutter_theme/common/consts.dart';
import 'package:flutter_theme/theme_preview/views/preview_body.dart';
import 'package:flutter_theme/widgets/paddings.dart';
import 'package:flutter_theme/widgets/widgets.dart';

const Icon _buttonIcon = Icon(Icons.favorite);

class ButtonsPage extends PreviewBody {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  IconData get icon => Icons.touch_app;

  @override
  String get label => 'Buttons';

  @override
  Widget build(BuildContext context) {
    return MyListView(
      padding: kPaddingAll,
      children: [
        _ButtonsRow(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ],
        ),
        _ButtonsRow(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: _buttonIcon,
              label: const Text('Elevated Button Icon'),
            ),
            ElevatedButton.icon(
              onPressed: null,
              icon: _buttonIcon,
              label: const Text('Disabled'),
            ),
          ],
        ),
        _ButtonsRow(
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            const OutlinedButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ],
        ),
        _ButtonsRow(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: _buttonIcon,
              label: const Text('Outlined Button Icon'),
            ),
            OutlinedButton.icon(
              onPressed: null,
              icon: _buttonIcon,
              label: const Text('Disabled'),
            ),
          ],
        ),
        _ButtonsRow(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            const TextButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ],
        ),
        _ButtonsRow(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: _buttonIcon,
              label: const Text('Text Button Icon'),
            ),
            TextButton.icon(
              onPressed: null,
              icon: _buttonIcon,
              label: const Text('Disabled'),
            ),
          ],
        ),
        const Divider(),
        _IconButtons(),
        const SizedBox(height: 50),
      ],
    );
  }
}

class _ButtonsRow extends StatelessWidget {
  final List<Widget> children;

  const _ButtonsRow({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (context, index) => const HorizontalPadding(),
        itemCount: children.length,
      ),
    );
  }
}

class _IconButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(color: Theme.of(context).disabledColor);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Icon Buttons',
          style: kListTileTitleStyle,
        ),
        Row(
          children: [
            Text(
              'Enabled',
              style: labelStyle,
            ),
            IconButton(
              icon: _buttonIcon,
              onPressed: () {},
            ),
            const HorizontalPadding(),
            Text(
              'Disabled',
              style: labelStyle,
            ),
            const IconButton(
              icon: _buttonIcon,
              onPressed: null,
            ),
          ],
        )
      ],
    );
  }
}
