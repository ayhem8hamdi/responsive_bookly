import 'package:flutter/material.dart';

class AnimatedFadeWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const AnimatedFadeWidget({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.easeInOut,
  });

  @override
  State<AnimatedFadeWidget> createState() => _AnimatedFadeWidgetState();
}

class _AnimatedFadeWidgetState extends State<AnimatedFadeWidget> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: widget.duration,
      curve: widget.curve,
      child: widget.child,
    );
  }
}
