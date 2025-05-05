class HC1CardModel {
  final int? id;
  final String? name;
  final String? slug;
  final String? title;
  final FormattedText? formattedTitle;
  final String? description;
  final FormattedText? formattedDescription;
  final HC1Icon? icon;
  final String? bgColor;
  final bool? isDisabled;
  final bool? isShareable;
  final bool? isInternal;

  HC1CardModel({
    this.id,
    this.name,
    this.slug,
    this.title,
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    this.icon,
    this.bgColor,
    this.isDisabled,
    this.isShareable,
    this.isInternal,
  });

  factory HC1CardModel.fromJson(Map<String, dynamic> json) {
    return HC1CardModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      title: json['title'],
      formattedTitle: json['formatted_title'] != null ? FormattedText.fromJson(json['formatted_title']) : null,
      description: json['description'],
      formattedDescription: json['formatted_description'] != null ? FormattedText.fromJson(json['formatted_description']) : null,
      icon: json['icon'] != null ? HC1Icon.fromJson(json['icon']) : null,
      bgColor: json['bg_color'],
      isDisabled: json['is_disabled'],
      isShareable: json['is_shareable'],
      isInternal: json['is_internal'],
    );
  }

  static List<HC1CardModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HC1CardModel.fromJson(json)).toList();
  }
}

class FormattedText {
  final String? text;
  final String? align;
  final List<TextEntity>? entities;

  FormattedText({this.text, this.align, this.entities});

  factory FormattedText.fromJson(Map<String, dynamic> json) {
    return FormattedText(
      text: json['text'],
      align: json['align'],
      entities: json['entities'] != null
          ? List<TextEntity>.from(json['entities'].map((e) => TextEntity.fromJson(e)))
          : null,
    );
  }
}

class TextEntity {
  final String? text;
  final String? type;
  final String? color;
  final String? fontStyle;
  final String? fontFamily;

  TextEntity({this.text, this.type, this.color, this.fontStyle, this.fontFamily});

  factory TextEntity.fromJson(Map<String, dynamic> json) {
    return TextEntity(
      text: json['text'],
      type: json['type'],
      color: json['color'],
      fontStyle: json['font_style'],
      fontFamily: json['font_family'],
    );
  }
}

class HC1Icon {
  final String? imageType;
  final String? imageUrl;
  final double? aspectRatio;
  final double? iconSize;

  HC1Icon({this.imageType, this.imageUrl, this.aspectRatio, this.iconSize});

  factory HC1Icon.fromJson(Map<String, dynamic> json) {
    return HC1Icon(
      imageType: json['image_type'],
      imageUrl: json['image_url'],
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
      iconSize: (json['icon_size'] as num?)?.toDouble(),
    );
  }
}
