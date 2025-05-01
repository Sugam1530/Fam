class HC9CardModel {
  final int? id;
  final String? name;
  final String? slug;
  final BgImage? bgImage;
  final BgGradient? bgGradient;
  final bool? isDisabled;
  final bool? isShareable;
  final bool? isInternal;

  HC9CardModel({
    this.id,
    this.name,
    this.slug,
    this.bgImage,
    this.bgGradient,
    this.isDisabled,
    this.isShareable,
    this.isInternal,
  });

  factory HC9CardModel.fromJson(Map<String, dynamic> json) {
    return HC9CardModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      bgImage: json['bg_image'] != null ? BgImage.fromJson(json['bg_image']) : null,
      bgGradient: json['bg_gradient'] != null ? BgGradient.fromJson(json['bg_gradient']) : null,
      isDisabled: json['is_disabled'],
      isShareable: json['is_shareable'],
      isInternal: json['is_internal'],
    );
  }

  static List<HC9CardModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HC9CardModel.fromJson(json)).toList();
  }
}

class BgImage {
  final String? imageType;
  final String? imageUrl;
  final double? aspectRatio;

  BgImage({this.imageType, this.imageUrl, this.aspectRatio});

  factory BgImage.fromJson(Map<String, dynamic> json) {
    return BgImage(
      imageType: json['image_type'],
      imageUrl: json['image_url'],
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
    );
  }
}

class BgGradient {
  final int? angle;
  final List<String>? colors;

  BgGradient({this.angle, this.colors});

  factory BgGradient.fromJson(Map<String, dynamic> json) {
    return BgGradient(
      angle: json['angle'],
      colors: List<String>.from(json['colors'] ?? []),
    );
  }
}

