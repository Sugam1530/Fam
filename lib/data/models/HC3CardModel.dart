class HC3CardModel {
  final String? title;
  final FormattedTitle? formattedTitle;
  final BgImage? bgImage;
  final List<CTA>? cta;

  HC3CardModel({
    this.title,
    this.formattedTitle,
    this.bgImage,
    this.cta,
  });

  factory HC3CardModel.fromJson(List<dynamic> json) {
    return HC3CardModel(
      title: json[0]['title'],
      formattedTitle: json[0]['formatted_title'] != null
          ? FormattedTitle.fromJson(json[0]['formatted_title'])
          : null,
      bgImage: json[0]['bg_image'] != null
          ? BgImage.fromJson(json[0]['bg_image'])
          : null,
      cta: (json[0]['cta'] as List<dynamic>?)
          ?.map((e) => CTA.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class FormattedTitle {
  final String? text;
  final List<FormattedEntity>? entities;

  FormattedTitle({this.text, this.entities});

  factory FormattedTitle.fromJson(Map<String, dynamic> json) {
    return FormattedTitle(
      text: json['text'],
      entities: (json['entities'] as List<dynamic>?)
          ?.map((e) => FormattedEntity.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class FormattedEntity {
  final String? text;
  final String? color;
  final double? fontSize;

  FormattedEntity({this.text, this.color, this.fontSize});

  factory FormattedEntity.fromJson(Map<String, dynamic> json) {
    return FormattedEntity(
      text: json['text'],
      color: json['color'],
      fontSize: (json['font_size'] as num?)?.toDouble(),
    );
  }

  get fontStyle => null;

  get fontFamily => null;
}

class BgImage {
  final String? imageUrl;

  BgImage({this.imageUrl});

  factory BgImage.fromJson(Map<String, dynamic> json) {
    return BgImage(
      imageUrl: json['image_url'],
    );
  }
}

class CTA {
  final String? text;
  final String? type;
  final String? bgColor;
  final bool? isCircular;
  final bool? isSecondary;
  final int? strokeWidth;

  CTA({
    this.text,
    this.type,
    this.bgColor,
    this.isCircular,
    this.isSecondary,
    this.strokeWidth,
  });

  factory CTA.fromJson(Map<String, dynamic> json) {
    return CTA(
      text: json['text'],
      type: json['type'],
      bgColor: json['bg_color'],
      isCircular: json['is_circular'],
      isSecondary: json['is_secondary'],
      strokeWidth: json['stroke_width'],
    );
  }
}
