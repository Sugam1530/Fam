import 'package:flutter/material.dart';
import '../../data/repository/home_feed_repo_impl.dart';

class HomeFeedViewModel with ChangeNotifier {
  final HomeFeedRepositoryImpl repository;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  List<dynamic> _cardsHC3 = [];
  List<dynamic> get cardsHC3 => _cardsHC3;

  List<dynamic> _cardsHC5 = [];
  List<dynamic> get cardsHC5 => _cardsHC5;

  List<dynamic> _cardsHC6 = [];
  List<dynamic> get cardsHC6 => _cardsHC6;

  List<dynamic> _cardsHC9 = [];
  List<dynamic> get cardsHC9 => _cardsHC9;

  List<dynamic> _cardsHC1 = [];
  List<dynamic> get cardsHC1 => _cardsHC1;

  HomeFeedViewModel(this.repository) {
    fetchHomeFeed();
  }

  Future<void> fetchHomeFeed() async {
    try {
      _isLoading = true;
      notifyListeners();

      final responseList = await repository.fetchHomeFeed();
      final allWidgets = responseList
          .expand((res) => res.hcGroups)
          .toList();

      _cardsHC3 = repository.extractHC3Cards(allWidgets);
      _cardsHC5 = repository.extractHC5Cards(allWidgets);
      _cardsHC6 = repository.extractHC6Cards(allWidgets);
      _cardsHC9 = repository.extractHC9Cards(allWidgets);
      _cardsHC1 = repository.extractHC1Cards(allWidgets);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
