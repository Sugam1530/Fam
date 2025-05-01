import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/HC6CardModel.dart';

class HC6Widget extends StatelessWidget {
  final HC6CardModel model;

  const HC6Widget({super.key, required this.model});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.url != null ? () => _launchURL(model.url!) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          //color: Color(int.parse('0xff${model.bgColor?.replaceAll('#', '') ?? 'FFFFFF'}')),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (model.icon?.imageUrl != null)
              Image.network(
                model.icon!.imageUrl!,
                width: 26,
                height: 26,
                fit: BoxFit.contain,
              ),
            const SizedBox(width: 10),
            ...?model.formattedTitle?.entities?.map((e) {
              return Text(
                e.text ?? '',
                style: TextStyle(
                  decoration: e.fontStyle == 'underline'
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  fontWeight: FontWeight.w500,
                  color: Color(int.parse('0xff${e.color?.replaceAll('#', '') ?? '000000'}')),
                ),
              );
            }),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
