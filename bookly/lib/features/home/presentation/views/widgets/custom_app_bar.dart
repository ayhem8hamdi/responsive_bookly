import 'package:bookly/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.logo),
        const Spacer(),
        IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.searchIcon))
      ],
    );
  }
}
