import 'package:flutter/material.dart';

class MayAlsoLikeBooksSizedBox extends StatelessWidget {
  const MayAlsoLikeBooksSizedBox({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20 < 115
          ? 105
          : MediaQuery.of(context).size.height * 0.20,
      child: widget,
    );
  }
}
