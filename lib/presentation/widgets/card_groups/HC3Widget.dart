import 'package:flutter/material.dart';
import '../../../data/models/HC3CardModel.dart';

class HC3Widget extends StatefulWidget {
  final HC3CardModel model;

  const HC3Widget({super.key, required this.model});

  @override
  State<HC3Widget> createState() => _HC3WidgetState();
}

class _HC3WidgetState extends State<HC3Widget> {

  bool showOptions = false;

  void resetCard() {
    setState(() {
      showOptions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: showOptions == false ?
      InkWell(
        onLongPress: () {
          setState(() {
            showOptions = true;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            image:
                widget.model.bgImage?.imageUrl != null
                    ? DecorationImage(
                      image: NetworkImage(widget.model.bgImage!.imageUrl!),
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
                    ...?widget.model.formattedTitle?.entities?.asMap().entries.map((
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
                        "0xff${widget.model.cta![0].bgColor?.replaceAll("#", "") ?? "FFFFFF"}",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      widget.model.cta![0].text.toString(),
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
      ) :
      Container(
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    resetCard();
                  },
                  child: Container(
                    width: 90,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F6F3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Icon(Icons.notifications, color: Color(0xFFFBAF03),size: 30,),
                        SizedBox(height: 5,),
                        Text('remind later', style: TextStyle(fontSize: 12),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: () {
                    resetCard();
                  },
                  child: Container(
                    width: 90,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F6F3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Icon(Icons.cancel, color: Color(0xFFFBAF03),size: 30,),
                        SizedBox(height: 5,),
                        Text('dis miss now', style: TextStyle(fontSize: 12),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15,),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                image:
                widget.model.bgImage?.imageUrl != null
                    ? DecorationImage(
                  image: NetworkImage(widget.model.bgImage!.imageUrl!),
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
                        ...?widget.model.formattedTitle?.entities?.asMap().entries.map((
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
                            "0xff${widget.model.cta![0].bgColor?.replaceAll("#", "") ?? "FFFFFF"}",
                          ),
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          widget.model.cta![0].text.toString(),
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
            )
          ],
        ),
      ),
    );
  }
}
