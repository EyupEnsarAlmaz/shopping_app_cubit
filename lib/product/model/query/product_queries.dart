enum ProductQueries { limit }

extension ProductQueriesExtension on ProductQueries {
  MapEntry<String, String> ToMapEntery(String value) {
    switch (this) {
      case ProductQueries.limit:
        return MapEntry('limit', value);
    }
  }
}
