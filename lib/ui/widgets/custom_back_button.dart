import 'package:flutter/material.dart';
import 'package:tenis_court/ui/theme/color.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.onTap});

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: LightColor.appleGreen,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.0),
          child: Icon(
            Icons.adaptive.arrow_back_outlined,
          ),
        ),
      ),
    );
  }
}
