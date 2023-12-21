import 'package:flutter/material.dart';

class DefaultPosterWidget extends StatelessWidget {
  const DefaultPosterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
