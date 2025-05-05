import 'package:fam/data/models/HC1CardModel.dart';
import 'package:flutter/material.dart';

class HC1Widget extends StatelessWidget {
  final HC1CardModel cards;
  final double height;
  final bool isFullWidth;

  const HC1Widget({
    Key? key,
    required this.cards,
    this.height = 64,
    this.isFullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: isFullWidth ? double.infinity : null,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _parseColor(cards.bgColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            if (cards.icon?.imageUrl != null)
              Image.network(
                cards.icon!.imageUrl!,
                height: height - 20,
                width: height - 20,
                fit: BoxFit.cover,
              ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (cards.formattedTitle?.entities?.isNotEmpty ?? false)
                  Text(
                    cards.formattedTitle!.entities!.first.text ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _parseColor(cards.formattedTitle!.entities!.first.color),
                    ),
                  ),
                if (cards.formattedDescription?.entities?.isNotEmpty ?? false)
                  Text(
                    cards.formattedDescription!.entities!.first.text ?? '',
                    style: TextStyle(
                      color: _parseColor(cards.formattedDescription!.entities!.first.color),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color? _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return Colors.grey[200];
    return Color(int.parse(hexColor.replaceFirst('#', '0xff')));
  }
}
