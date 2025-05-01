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

  factory HC5CardModel.fromJson(List<dynamic> json) {
    return HC5CardModel(
      id: json[0]['id'],
      name: json[0]['name'],
      slug: json[0]['slug'],
      title: json[0]['title'],
      formattedTitle: json[0]['formatted_title'] != null
          ? FormattedTitle.fromJson(json[0]['formatted_title'])
          : null,
      bgImage: json[0]['bg_image'] != null
          ? BgImage.fromJson(json[0]['bg_image'])
          : null,
      isDisabled: json[0]['is_disabled'],
      isShareable: json[0]['is_shareable'],
      isInternal: json[0]['is_internal'],
    );
  }
}
