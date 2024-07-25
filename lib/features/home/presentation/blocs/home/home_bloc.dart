import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_task/features/home/domain/usecases/get_categories_usecae.dart';
import 'package:royal_task/features/home/domain/usecases/get_products_usecase.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/entities/product.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Use case for fetching products
  final GetProductsUsecase getProductsUsecase;
  final GetCategoriesUsecae getCategoriesUsecae;

  // Constructor initializes the use case and sets the initial state
  HomeBloc(this.getProductsUsecase, this.getCategoriesUsecae)
      : super(const HomeState.initial()) {
    // Event handlers
    on<_GetHomeData>(_getHomeData);
    on<_LoadMoreProducts>(_loadMoreProducts);
  }

  // List to store products
  List<Product> products = [];
  // Number of products to fetch in one batch
  final int limit = 15;
  // Offset for pagination
  int offset = 0;

  // Handler for fetching products
  Future<void> _getHomeData(_GetHomeData event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading()); // Emit loading state
    if (event.isRefresh) {
      offset = 0;
    }
    // Fetch products and categories
    final productResult = await getProductsUsecase(event.isRefresh);
    final categoriesResult = await getCategoriesUsecae(event.isRefresh);
    // Handle products result
    productResult.fold(
      (error) => emit(HomeState.loadFailed(
          message: error.message)), // Emit error state for products
      (fetchedProducts) {
        products = fetchedProducts;

        // Handle categories result
        categoriesResult.fold(
          (error) => emit(HomeState.loadFailed(
              message: error.message)), // Emit error state for categories
          (categories) {
            // Emit loaded state with both products and categories
            emit(
              HomeState.loaded(
                products: _getNextChunk(),
                categories: categories,
                hasMoreProducts: true,
              ),
            );
          },
        );
      },
    );
  }

  // Get a product by its ID
  Product getProductById(int productId) {
    return products.firstWhere(
      (product) => product.id == productId,
    );
  }

  // Handler for loading more products
  Future<void> _loadMoreProducts(
      _LoadMoreProducts event, Emitter<HomeState> emit) async {
    state.whenOrNull(
      loading: () {
        return; // Do nothing if currently loading
      },
      loadFailed: (message) {
        return; // Do nothing if loading failed
      },
      loaded: (products, hasMore, categories) {
        if (!hasMore) {
          return; // No more products to load
        }
        final nextChunkProducts = _getNextChunk(); // Get next chunk of products
        if (nextChunkProducts.isEmpty || nextChunkProducts.length < limit) {
          // Emit loaded state with no more products if the chunk is empty or smaller than the limit
          return emit(
            HomeState.loaded(
              products: products + nextChunkProducts,
              hasMoreProducts: false,
              categories: categories,
            ),
          );
        }
        // Emit loaded state with more products available
        emit(
          HomeState.loaded(
            products: products + nextChunkProducts,
            hasMoreProducts: true,
            categories: categories,
          ),
        );
      },
    );
  }

  // Get the next chunk of products based on the offset
  List<Product> _getNextChunk() {
    final start = offset;
    final end =
        (start + limit > products.length) ? products.length : start + limit;
    offset = end; // Update the offset

    return products.sublist(start, end); // Return the sublist of products
  }
}
