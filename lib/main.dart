import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_task/core/app_router.dart';
import 'package:royal_task/core/theme/theme.dart';
import 'package:royal_task/features/auth/presentation/cubits/auth/auth_bloc.dart';
import 'package:royal_task/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:royal_task/features/products/presentation/blocs/product/product_bloc.dart';
import 'package:royal_task/init_dependency.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependency();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    serviceLocator<AuthBloc>().add(const AuthEvent.getUserInfo());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
        BlocProvider(
            create: (context) => serviceLocator<ProductBloc>()
              ..add(const ProductEvent.getProducts(isRefresh: false))),
        BlocProvider(
            create: (context) => serviceLocator<CartBloc>()
              ..add(const CartEvent.getCartItems())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.darkTheme,
        routerConfig: serviceLocator<AppRouter>().router,
      ),
    );
  }
}
