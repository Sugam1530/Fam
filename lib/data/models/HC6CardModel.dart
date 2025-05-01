import 'HC3CardModel.dart';

class HC6CardModel {
  final String? title;
  final FormattedTitle? formattedTitle;
  final IconImage? icon;
  final String? url;
  final String? bgColor;
  final int? iconSize;

  HC6CardModel({
    this.title,
    this.formattedTitle,
    this.icon,
    this.url,
    this.bgColor,
    this.iconSize,
  });

  factory HC6CardModel.fromJson(List<dynamic> json) {
    return HC6CardModel(
      title: json[0]['title'],
      formattedTitle: json[0]['formatted_title'] != null
          ? FormattedTitle.fromJson(json[0]['formatted_title'])
          : null,
      icon: json[0]['icon'] != null ? IconImage.fromJson(json[0]['icon']) : null,
      url: json[0]['url'],
      bgColor: json[0]['bg_color'],
      iconSize: json[0]['icon_size'],
    );
  }
}

class IconImage {
  final String? imageUrl;
  final double? aspectRatio;

  IconImage({this.imageUrl, this.aspectRatio});

  factory IconImage.fromJson(Map<String, dynamic> json) {
    return IconImage(
      imageUrl: json['image_url'],
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
    );
  }
}
