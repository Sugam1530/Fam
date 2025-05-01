import 'package:flutter/material.dart';
import '../../../data/models/HC3CardModel.dart';

class HC3Widget extends StatelessWidget {
  final HC3CardModel model;

  const HC3Widget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade800,
          borderRadius: BorderRadius.circular(12),
          image:
              model.bgImage?.imageUrl != null
                  ? DecorationImage(
                    image: NetworkImage(model.bgImage!.imageUrl!),
                    fit: BoxFit.cover,
                  )
                  : null,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 16, top: 145),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...?model.formattedTitle?.entities?.asMap().entries.map((
                    entry,
                  ) {
                    final index = entry.key;
                    final e = entry.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.text ?? '',
                          style: TextStyle(
                            color: Color(
                              int.parse(
                                "0xff${e.color?.replaceAll("#", "") ?? "FFFFFF"}",
                              ),
                            ),
                            fontSize: e.fontSize ?? 16,
                            fontWeight: e.fontSize! > 18 ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                        if (index == 0)
                          const SizedBox(height: 4), // spacing if needed
                        if (index == 0)
                          Column(
                            children: [
                              const Text(
                                'With Action',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 30,)
                            ],
                          ),
                      ],
                    );
                  }),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: 128,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(
                    int.parse(
                      "0xff${model.cta![0].bgColor?.replaceAll("#", "") ?? "FFFFFF"}",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    model.cta![0].text.toString(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 16 / 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
