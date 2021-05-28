import 'networking.dart';

NetworkHelper networkHelper = NetworkHelper();

class SearchCard {
  String initialSearch;
  List<String> mostPopularSearches;

  SearchCard({
    this.initialSearch,
    this.mostPopularSearches,
  });

  factory SearchCard.fromJson(Map<String, dynamic> json) {
    return SearchCard(
      initialSearch: json['search'] as String,
      mostPopularSearches: json['results'] as List,
    );
  }
}
