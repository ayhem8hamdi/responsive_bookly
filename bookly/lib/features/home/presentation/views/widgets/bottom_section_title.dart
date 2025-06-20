import 'package:bookly/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BottomSectionTitle extends StatelessWidget {
  const BottomSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text('You can also like',
          style: AppStyles.styleRegular14.copyWith(color: Colors.white)),
    );
  }
}
