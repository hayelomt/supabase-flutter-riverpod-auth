import 'package:flutter/material.dart';

class BtnChild extends StatelessWidget {
  const BtnChild({
    Key? key,
    required this.loading,
    this.color,
    this.size = 14,
    required this.child,
  }) : super(key: key);

  final bool loading;
  final Widget child;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: child),
        if (loading)
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: size,
              height: size,
              child: const CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
          ),
      ],
    );
  }
}
