import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../product/network/product_network_manager.dart';
import '../../../product/widget/loading_center.dart';
import '../../../product/widget/product_card.dart';
import '../../../product/widget/product_dropdown_widget.dart';
import '../cubit/home_cubit.dart';
import '../service/home_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 300) {}
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeService(ProductNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          actions: [_loadingCenter()],
          title: _ProductDropdown(),
          centerTitle: false,
        ),
        body: _bodyListview(),
      ),
    );
  }

  Widget _ProductDropdown() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ProductDropDown(
          items: state.categories ?? [],
          onSelected: (String data) {
            context.read<HomeCubit>().selectedCategories(data);
          },
        );
      },
    );
  }

  Widget _bodyListview() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.isInitial) {}
      },
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.selectItems?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ProductCard(model: state.selectItems?[index]),
                  state.selectItems.isNotNullOrEmpty &&
                          index == state.selectItems!.length - 1
                      ? const loadingCenter()
                      : const SizedBox(),
                ],
              );
            });
      },
    );
  }

  Widget _loadingCenter() {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state ? 1 : 0,
          duration: context.durationLow,
          child: const loadingCenter(),
        );
      },
    );
  }
}
