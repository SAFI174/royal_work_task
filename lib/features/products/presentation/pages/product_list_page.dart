import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_task/core/app_router.dart';
import 'package:royal_task/core/widgets/loader_widget.dart';
import 'package:royal_task/features/auth/presentation/cubits/auth/auth_bloc.dart';
import 'package:royal_task/init_dependency.dart';

import '../blocs/product/product_bloc.dart';
import '../widgets/product_card.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});
  Future<void> _refreshProducts(BuildContext context) async {
    context
        .read<ProductBloc>()
        .add(const ProductEvent.getProducts(isRefresh: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(AppRoutes.cart.name);
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                serviceLocator<AuthBloc>().add(const AuthEvent.signOut());
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return _refreshProducts(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (user) {
                    return ListTile(
                      title: Text('Hello: ${user.name}'),
                    );
                  },
                  orElse: () {
                    return const SizedBox.shrink();
                  },
                );
              },
            ),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Loader(),
                    loading: () => const Loader(),
                    loadFailed: (message) =>
                        Center(child: Text('Error: $message')),
                    loaded: (products, hasMore) {
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
                          padding: const EdgeInsets.all(8.0),
                          crossAxisCount: 2,
                          itemCount: products.length,
                          builder: (context, index) {
                            return ProductCard(product: products[index]);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
