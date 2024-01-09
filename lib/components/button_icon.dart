import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final ImageProvider background;
  final Widget? child;
  final Size? size;
  final VoidCallback? onTap;

  ButtonIcon({
    required this.background,
    this.child,
    this.size,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: background,
          ),
        ),
        height: size?.height ?? 123,
        width: size?.width ?? 232,
        child: child ?? const SizedBox(),
      ),
    );
  }
}
