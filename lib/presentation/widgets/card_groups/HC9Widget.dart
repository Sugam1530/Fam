import 'package:flutter/material.dart';
import '../../../data/models/HC9CardModel.dart';

class HC9Widget extends StatelessWidget {
  final HC9CardModel model;

  const HC9Widget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final gradientColors = model.bgGradient?.colors
        ?.map((hex) => Color(_hexToColor(hex)))
        .toList()
        .reversed
        .toList() ??
        [Colors.grey, Colors.black];

    double containerHeight = 200.0;
    double containerWidth = containerHeight * (model.bgImage?.aspectRatio ?? 1);

    return Container(
      width: containerWidth,
      height: containerHeight,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        image: model.bgImage?.imageUrl != null
            ? DecorationImage(
          image: NetworkImage(model.bgImage!.imageUrl!),
          fit: BoxFit.cover,
        )
            : null,
      ),
    );
  }

  int _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return int.parse(hex, radix: 16);
  }
}
