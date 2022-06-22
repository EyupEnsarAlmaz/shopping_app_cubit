// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.items,
      this.isLoading,
      this.categories,
      this.isInitial = false,
      this.selectItems});

  final List<ProductModel>? items;
  final List<ProductModel>? selectItems;
  final bool? isLoading;
  final List<String>? categories;
  final bool isInitial;

  @override
  List<Object?> get props => [items, isLoading, categories, selectItems];

  HomeState copyWith({
    List<ProductModel>? items,
    List<ProductModel>? selectItems,
    bool? isLoading,
    List<String>? categories,
  }) {
    return HomeState(
      selectItems: selectItems ?? this.selectItems,
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
    );
  }
}
