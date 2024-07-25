import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../blocs/product/product_bloc.dart';
import 'product_card.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                context
                    .read<ProductBloc>()
                    .add(const ProductEvent.loadMoreProducts());
                return true;
              }
              return false;
            },
            child: AutoHeightGridView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(15.0),
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 20,
              itemCount: products.length,
              builder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
