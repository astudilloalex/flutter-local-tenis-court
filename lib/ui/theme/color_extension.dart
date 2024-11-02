import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  const ColorExtension({
    this.link,
  });

  final Color? link;

  @override
  ThemeExtension<ColorExtension> copyWith({
    Color? link,
  }) {
    return ColorExtension(
      link: link ?? this.link,
    );
  }

  @override
  ColorExtension lerp(
    covariant ColorExtension? other,
    double t,
  ) {
    return ColorExtension(
      link: Color.lerp(link, other?.link, t) ?? link,
    );
  }
}
