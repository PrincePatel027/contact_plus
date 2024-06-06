import 'package:contact_plus/custom_widgets/height_width.dart';
import 'package:flutter/material.dart';

class Phone extends StatelessWidget {
  const Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: heightFS(context) / 1.2,
          color: Colors.black12,
        )
      ],
    );
  }
}
