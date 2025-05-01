import 'hc_group_model.dart';

class HomeFeedResponse {
  final int id;
  final String slug;
  final List<HcGroupModel> hcGroups;

  HomeFeedResponse({
    required this.id,
    required this.slug,
    required this.hcGroups,
  });

  factory HomeFeedResponse.fromJson(Map<String, dynamic> json) {
    return HomeFeedResponse(
      id: json['id'],
      slug: json['slug'],
      hcGroups: (json['hc_groups'] as List)
          .map((e) => HcGroupModel.fromJson(e))
          .toList(),
    );
  }
}
