import 'package:bookly/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoResultsFoundSliver extends StatelessWidget {
  final String lottieAssetPath;

  const NoResultsFoundSliver({
    super.key,
    this.lottieAssetPath = Assets.searchFailed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final animationSize = size.width * 0.77;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: size.height * 0.7,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  lottieAssetPath,
                  width: animationSize,
                  height: animationSize,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
