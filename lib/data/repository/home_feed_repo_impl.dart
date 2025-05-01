import 'package:dio/dio.dart';
import '../models/HC3CardModel.dart';
import '../models/HC5CardModel.dart';
import '../models/HC6CardModel.dart';
import '../models/HC9CardModel.dart';
import '../models/home_feed_model.dart';
import 'home_feed_repository.dart';

class HomeFeedRepositoryImpl implements HomeFeedRepository {
  final Dio _dio;

  HomeFeedRepositoryImpl(this._dio);

  @override
  Future<List<HomeFeedResponse>> fetchHomeFeed() async {
    final response = await _dio.get('https://polyjuice.kong.fampay.co/mock/famapp/feed/home_section/?slugs=famx-paypage');
    return (response.data as List)
        .map((e) => HomeFeedResponse.fromJson(e))
        .toList();
  }

  List<HC3CardModel> extractHC3Cards(List<dynamic> widgets) {
    final hc3Cards = <HC3CardModel>[];

    for (var widget in widgets) {
      if (widget.designType == 'HC3') {
          hc3Cards.add(HC3CardModel.fromJson(widget.widgets));
      }
    }

    return hc3Cards;
  }

  List<HC5CardModel> extractHC5Cards(List<dynamic> widgets) {
    final hc5Cards = <HC5CardModel>[];

    for (var widget in widgets) {
      if (widget.designType == 'HC5') {
        hc5Cards.add(HC5CardModel.fromJson(widget.widgets));
      }
    }

    return hc5Cards;
  }

  List<HC6CardModel> extractHC6Cards(List<dynamic> widgets) {
    final hc6Cards = <HC6CardModel>[];

    for (var widget in widgets) {
      if (widget.designType == 'HC6') {
        hc6Cards.add(HC6CardModel.fromJson(widget.widgets));
      }
    }

    return hc6Cards;
  }

  List<HC9CardModel> extractHC9Cards(List<dynamic> widgets) {
    final hc9Cards = <HC9CardModel>[];

    for (var widget in widgets) {
      if (widget.designType == 'HC9') {
        hc9Cards.addAll(HC9CardModel.fromJsonList(widget.widgets));
      }
    }

    return hc9Cards;
  }
}
