import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tenis_court/app/infrastructure/sources/app_asset.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAsset.logo,
      width: 209.0,
      height: 148.0,
    );
  }
}
