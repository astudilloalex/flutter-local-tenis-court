import 'package:flutter/material.dart';

class InputPrefixIcon extends StatelessWidget {
  const InputPrefixIcon({
    super.key,
    required this.iconData,
  });

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData),
        const SizedBox(width: 8.0),
        Container(
          height: 24.0,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}
