import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_cubit/features/home/service/home_service.dart';
import 'package:vexana/vexana.dart';

void main() {
  late IHomeService homeService;

  setUp(() {
    homeService = HomeService(NetworkManager(
        options: BaseOptions(baseUrl: 'https://fakestoreapi.com/')));
  });

  test('Fetch', () async {
    final response = await homeService.fetchAllProducts();

    expect(response, isNotEmpty);
  });
}
