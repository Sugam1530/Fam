import 'package:flutter/material.dart';
import '../../../data/models/HC5CardModel.dart';

class HC5Widget extends StatelessWidget {

  final HC5CardModel model;
  
  const HC5Widget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Image.network(model.bgImage!.imageUrl.toString(), fit: BoxFit.contain,),
    );
  }
}
