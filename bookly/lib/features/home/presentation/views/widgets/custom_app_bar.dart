import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.leftAsset,
    required this.rightAsset,
    required this.onPressed,
  });

  final String leftAsset;
  final String rightAsset;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: SvgPicture.asset(leftAsset),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {}, // Right icon does nothing for now
          icon: SvgPicture.asset(rightAsset),
        )
      ],
    );
  }
}
