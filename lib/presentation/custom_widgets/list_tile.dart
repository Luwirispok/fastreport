import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListTileW extends StatelessWidget {
  final String? text;
  final IconData? icon;
  VoidCallback? onTap;
  ListTileW({
    super.key,
    this.text,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!.call(),
      child: ListTile(
        leading: Icon(icon),
        title: Text(text ?? ''),
      ),
    );
  }
}
