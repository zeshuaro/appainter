import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final String? tooltip;
  final String? subtitle;
  final Widget? trailing;

  const MyListTile({
    super.key,
    required this.title,
    this.titleColor,
    this.tooltip,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Title(
                title: title,
                titleColor: titleColor,
                tooltip: tooltip,
              ),
              const VerticalPadding(
                size: PaddingSize.small,
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final String? tooltip;

  const _Title({required this.title, this.titleColor, this.tooltip});

  @override
  Widget build(BuildContext context) {
    return MyTooltip(
      tooltip: tooltip,
      child: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
