import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class SvgLabel extends StatelessWidget {

  final String assetName;
  final String text;
  final Color color;

  const SvgLabel({super.key, required this.assetName, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VectorGraphic(
          loader: AssetBytesLoader('assets/$assetName'),
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 16, color: Colors.black)),

      ],
    );
  }
}
