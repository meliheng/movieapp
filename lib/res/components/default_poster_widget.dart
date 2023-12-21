import 'package:flutter/material.dart';

class DefaultPosterWidget extends StatelessWidget {
  final double height;
  final double width;
  const DefaultPosterWidget({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: const Center(child: Text("N/A")),
    );
  }
}
