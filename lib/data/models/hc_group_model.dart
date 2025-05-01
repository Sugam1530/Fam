class HcGroupModel {
  final List<dynamic> widgets;
  final String designType;

  HcGroupModel({required this.widgets, required this.designType});

  factory HcGroupModel.fromJson(Map<String, dynamic> json) {
    return HcGroupModel(
      widgets: json['cards'] ?? [],
      designType: json['design_type'] ?? '',
    );
  }
}
