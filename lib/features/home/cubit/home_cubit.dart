import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_cubit/features/home/model/product_model.dart';
import 'package:shopping_app_cubit/features/home/service/home_service.dart';
import 'package:collection/collection.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeService) : super(HomeState(isInitial: true)) {
    initialComplete();
  }
  final IHomeService homeService;

  Future<void> initialComplete() async {
    await Future.microtask(() => {emit(HomeState(isInitial: true))});
    await Future.wait([fetchAllItems(), fetchAllCategories()]);
    emit(state.copyWith(selectItems: state.items));
  }

  void selectedCategories(String data) {
    emit(state.copyWith(
        selectItems: state.items
            ?.where((element) => element.category == data)
            .toList()));
  }

  Future<void> fetchAllItems() async {
    _changeloading();
    final response = await homeService.fetchAllProducts();
    emit(state.copyWith(items: response ?? []));
    _changeloading();
  }

  void _changeloading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }

  Future<void> fetchAllCategories() async {
    final response = await homeService.fetchAllCategories();
    emit(state.copyWith(categories: response));
  }
}
