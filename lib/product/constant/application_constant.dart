class ApplicationConstant {
  static ApplicationConstant? _instace;
  static ApplicationConstant get instance {
    _instace ??= ApplicationConstant._init();
    return _instace!;
  }

  ApplicationConstant._init();

  final String baseUrl = 'https://fakestoreapi.com/';
}
