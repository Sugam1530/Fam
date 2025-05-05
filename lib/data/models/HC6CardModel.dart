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

  factory HC6CardModel.fromJson(Map<String, dynamic> json) {
    return HC6CardModel(
      title: json['title'],
      formattedTitle: json['formatted_title'] != null
          ? FormattedTitle.fromJson(json['formatted_title'])
          : null,
      icon: json['icon'] != null ? IconImage.fromJson(json['icon']) : null,
      url: json['url'],
      bgColor: json['bg_color'],
      iconSize: json['icon_size'],
    );
  }

  static List<HC6CardModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HC6CardModel.fromJson(json)).toList();
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
