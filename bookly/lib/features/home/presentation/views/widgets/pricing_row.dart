import 'package:bookly/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PricingRow extends StatelessWidget {
  const PricingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
        child: Row(
          children: [LeftPricingWidget(), RightPricingWidget()],
        ),
      ),
    );
  }
}

class LeftPricingWidget extends StatelessWidget {
  const LeftPricingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}

class RightPricingWidget extends StatelessWidget {
  const RightPricingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0XFFEF8262),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8), bottomRight: Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'Free preview',
            style: AppStyles.styleRegular18,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
