import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shopping_app_cubit/features/home/model/product_model.dart';
import 'package:shopping_app_cubit/product/padding/page_padding.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.model}) : super(key: key);

  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return SizedBox();
    }
    return Padding(
        padding: const PagePadding.all(),
        child: Card(
          child: ListTile(
            title: SizedBox(
                height: context.dynamicHeight(0.5),
                child: Image.network(model?.image ?? "")),
            subtitle: Text(model.toString()),
          ),
        ));
  }
}
