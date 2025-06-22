import 'package:bookly/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class LeftPricingWidget extends StatelessWidget {
  const LeftPricingWidget({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
            child: Center(
              child: Text(
                'Download',
                style: AppStyles.styleRegular18.copyWith(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RightPricingWidget extends StatelessWidget {
  const RightPricingWidget({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0XFFEF8262),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Free preview',
              style: AppStyles.styleRegular18,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
