import 'package:flutter/material.dart';

class UnderLineShadow extends StatelessWidget {
  const UnderLineShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[600], boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: const Offset(0, 1),
            blurStyle: BlurStyle.outer)
      ]),
      height: 0.2,
    );
  }
}
