import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:royal_task/core/app_router.dart';
import 'package:royal_task/core/network/api_client.dart';
import 'package:royal_task/core/network/network_info.dart';
import 'package:royal_task/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:royal_task/features/auth/data/datasources/remote/firebase_auth_remote_datasource.dart';
import 'package:royal_task/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:royal_task/features/auth/domain/repositories/auth_repo.dart';
import 'package:royal_task/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:royal_task/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:royal_task/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:royal_task/features/auth/domain/usecases/signout_usecase.dart';
import 'package:royal_task/features/auth/domain/usecases/user_stream_usecase.dart';
import 'package:royal_task/features/auth/presentation/cubits/auth/auth_bloc.dart';
import 'package:royal_task/features/cart/data/datasoruce/cart_local_data_source.dart';
import 'package:royal_task/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:royal_task/features/cart/domain/repositories/cart_repo.dart';
import 'package:royal_task/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:royal_task/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:royal_task/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:royal_task/features/products/data/datasources/products_local_datasource.dart';
import 'package:royal_task/features/products/domain/repositories/product_repo.dart';
import 'package:royal_task/features/products/domain/usecases/get_products_usecase.dart';
import 'package:royal_task/features/products/presentation/blocs/product/product_bloc.dart';

import 'core/common/cubit/app_user/app_user_cubit.dart';
import 'features/cart/domain/usecases/save_cart_usecase.dart';
import 'features/products/data/datasources/products_remote_datasoruce.dart';
import 'features/products/data/repositories/product_repo_impl.dart';
import 'firebase_options.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependency() async {
  serviceLocator.registerFactory(
    () => InternetConnection(),
  );
  await initApiClient();
  await initFirebase();
  await initAuthFeature();
  await initRoutes();
  await initProductsFeature();
  await initCart();
}

Future<void> initCart() async {
  GetStorage.init('cart');
  serviceLocator.registerFactory<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(box: GetStorage('cart')),
  );
  serviceLocator.registerFactory<CartRepo>(
    () => CartRepoImpl(cartLocalDataSource: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => SaveCartUsecase(cartRepo: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => ClearCartUsecase(cartRepo: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => GetCartItemsUsecase(cartRepo: serviceLocator()),
  );
  serviceLocator.registerSingleton(
      CartBloc(serviceLocator(), serviceLocator(), serviceLocator()));
}

Future<void> initApiClient() async {
  serviceLocator.registerSingleton(Dio());
  serviceLocator.registerSingleton(ApiClient(dio: serviceLocator()));
}

Future<void> initProductsFeature() async {
  GetStorage.init('products');
  serviceLocator.registerFactory<ProductsRemoteDataSoruce>(
    () => ProductsRemoteDataSoruceImpl(apiClient: serviceLocator()),
  );
  serviceLocator.registerFactory<ProductsLocalDataSoruce>(
    () => ProductsLocalDataSourceImpl(box: GetStorage('products')),
  );
  serviceLocator.registerFactory<NetworkInfo>(
    () => NetworkInfoImpl(internetConnection: serviceLocator()),
  );
  serviceLocator.registerFactory<ProductRepo>(() => ProductRepoImpl(
        productsRemoteDataSoruce: serviceLocator(),
        networkInfo: serviceLocator(),
        productsLocalDataSoruce: serviceLocator(),
      ));
  serviceLocator.registerFactory(
    () => GetProductsUsecase(productRepo: serviceLocator()),
  );
  serviceLocator.registerSingleton(ProductBloc(serviceLocator()));
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> initRoutes() async {
  serviceLocator.registerSingleton(AppRouter(serviceLocator()));
}

Future<void> initAuthFeature() async {
  serviceLocator.registerFactory<AuthRemoteDatasource>(() =>
      FirebaseAuthRemoteDatasource(
          firebaseAuth: FirebaseAuth.instance,
          firebaseFirestore: FirebaseFirestore.instance));
  serviceLocator.registerFactory<AuthRepo>(
    () => AuthRepoImpl(authRemoteDatasource: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => SignInUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => SignUpUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => GetUserInfoUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UserStreamUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => SignoutUsecase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => AppUserCubit(),
  );

  serviceLocator.registerSingleton(
    AuthBloc(
      signoutUsecase: serviceLocator(),
      userStreamUsecase: serviceLocator(),
      appUserCubit: serviceLocator(),
      getCurrentUserUsecase: serviceLocator(),
      signinUsecase: serviceLocator(),
      signupUsecase: serviceLocator(),
    ),
  );
}
