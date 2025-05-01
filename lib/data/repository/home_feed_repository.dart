import '../models/home_feed_model.dart';

abstract class HomeFeedRepository {
  Future<List<HomeFeedResponse>> fetchHomeFeed();
}
