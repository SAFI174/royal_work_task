import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_task/core/app_router.dart';
import 'package:royal_task/core/extentions/extentions.dart';
import 'package:royal_task/core/theme/app_colors.dart';
import 'package:royal_task/core/widgets/loader_widget.dart';
import 'package:royal_task/features/auth/presentation/cubits/auth/auth_bloc.dart';
import 'package:royal_task/init_dependency.dart';
import '../blocs/product/product_bloc.dart';
import '../painters/background_painter.dart';
import '../widgets/app_bar_action.dart';
import '../widgets/products_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Future<void> _refreshProducts(BuildContext context) async {
    context
        .read<ProductBloc>()
        .add(const ProductEvent.getProducts(isRefresh: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Choose Your Bike',
          style: context.textTheme.titleLarge,
        ),
        actions: [
          AppBarAction(
            onTap: () {
              serviceLocator<AuthBloc>().add(const AuthEvent.signOut());
            },
            icon: const Icon(
              Icons.exit_to_app_outlined,
              color: AppColors.whiteColor,
            ),
          ),
          10.sbw,
          AppBarAction(
            onTap: () {
              context.pushNamed(AppRoutes.cart.name);
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.whiteColor,
            ),
          ),
          10.sbw,
        ],
      ),
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: RefreshIndicator.adaptive(
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
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Loader(),
                    loading: () => const Expanded(child: Loader()),
                    loadFailed: (message) =>
                        Center(child: Text('Error: $message')),
                    loaded: (products, hasMore) {
                      return ProductGridView(products: products);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
