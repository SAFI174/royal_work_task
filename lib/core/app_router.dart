import 'package:go_router/go_router.dart';
import 'package:royal_task/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:royal_task/features/cart/presentation/pages/cart_product_list_page.dart';
import 'package:royal_task/features/products/presentation/pages/product_list_page.dart';

import 'utils/stream_to_listenable.dart';
import '../features/auth/presentation/pages/signin_page.dart';
import '../features/auth/presentation/pages/signup_page.dart';
import '../features/products/presentation/pages/product_details_page.dart';

enum AppRoutes {
  signin('/sign-in', 'sign-in'),
  signup('/sign-up', 'sign-up'),
  home('/', 'products'),
  cart('cart', 'cart'),
  productDetails('product-details/:id', 'product-details');

  const AppRoutes(this.path, this.name);

  final String path;
  final String name;
}

class AppRouter {
  final AppUserCubit appUserCubit;
  AppRouter(this.appUserCubit);

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: StreamToListenable([appUserCubit.stream]),
    // initialLocation: AppRoutes.HOME_ROUTE,
    routes: [
      GoRoute(
          name: AppRoutes.home.name,
          path: AppRoutes.home.path,
          builder: (context, state) => const ProductListPage(),
          routes: [
            GoRoute(
              name: AppRoutes.productDetails.name,
              path: AppRoutes.productDetails.path,
              builder: (context, state) {
                final productId = state.pathParameters['id']!;
                return ProductDetailsPage(
                  productId: int.tryParse(productId) ?? -1,
                );
              },
            ),
            GoRoute(
              name: AppRoutes.cart.name,
              path: AppRoutes.cart.path,
              builder: (context, state) => const CartProductListPage(),
            ),
          ]),
      GoRoute(
        name: AppRoutes.signup.name,
        path: AppRoutes.signup.path,
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        name: AppRoutes.signin.name,
        path: AppRoutes.signin.path,
        builder: (context, state) => const SigninPage(),
      ),
    ],
    redirect: (context, state) {
      final isLoggedIn = appUserCubit.isUserLoggedIn();
      final isSigningIn = state.matchedLocation == AppRoutes.signin.path ||
          state.matchedLocation == AppRoutes.signup.path;
      if (isLoggedIn && isSigningIn) {
        return AppRoutes.home.path;
      }
      if (!isLoggedIn && !isSigningIn) {
        return AppRoutes.signin.path;
      }

      return null;
    },
  );
}
