import 'HC3CardModel.dart';

class HC5CardModel {
  final int? id;
  final String? name;
  final String? slug;
  final String? title;
  final FormattedTitle? formattedTitle;
  final BgImage? bgImage;
  final bool? isDisabled;
  final bool? isShareable;
  final bool? isInternal;

  HC5CardModel({
    this.id,
    this.name,
    this.slug,
    this.title,
    this.formattedTitle,
    this.bgImage,
    this.isDisabled,
    this.isShareable,
    this.isInternal,
  });

  factory HC5CardModel.fromJson(Map<String, dynamic> json) {
    return HC5CardModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      title: json['title'],
      formattedTitle: json['formatted_title'] != null
          ? FormattedTitle.fromJson(json['formatted_title'])
          : null,
      bgImage: json['bg_image'] != null
          ? BgImage.fromJson(json['bg_image'])
          : null,
      isDisabled: json['is_disabled'],
      isShareable: json['is_shareable'],
      isInternal: json['is_internal'],
    );
  }

  static List<HC5CardModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HC5CardModel.fromJson(json)).toList();
  }
}
