import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_task/features/products/domain/usecases/get_products_usecase.dart';
import '../../../domain/entities/product.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // Use case for fetching products
  final GetProductsUsecase getProductsUsecase;

  // Constructor initializes the use case and sets the initial state
  ProductBloc(this.getProductsUsecase) : super(const ProductState.initial()) {
    // Event handlers
    on<_GetProducts>(_getProducts);
    on<_LoadMoreProducts>(_loadMoreProducts);
  }

  // List to store products
  List<Product> products = [];
  // Number of products to fetch in one batch
  final int limit = 10;
  // Offset for pagination
  int offset = 0;

  // Handler for fetching products
  Future<void> _getProducts(
      _GetProducts event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading()); // Emit loading state
    final result = await getProductsUsecase(event.isRefresh); // Fetch products
    result.fold(
      (error) => emit(
          ProductState.loadFailed(message: error.message)), // Emit error state
      (products) {
        // Add fetched products to the list
        this.products.addAll(products);
        // Emit loaded state with the current batch of products
        emit(ProductState.loaded(products: _getNextChunk(), hasMore: true));
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
      _LoadMoreProducts event, Emitter<ProductState> emit) async {
    state.whenOrNull(
      loading: () {
        return; // Do nothing if currently loading
      },
      loadFailed: (message) {
        return; // Do nothing if loading failed
      },
      loaded: (products, hasMore) {
        if (!hasMore) {
          return; // No more products to load
        }
        final nextChunkProducts = _getNextChunk(); // Get next chunk of products
        if (nextChunkProducts.isEmpty || nextChunkProducts.length < limit) {
          // Emit loaded state with no more products if the chunk is empty or smaller than the limit
          return emit(
            ProductState.loaded(
              products: products + nextChunkProducts,
              hasMore: false,
            ),
          );
        }
        // Emit loaded state with more products available
        emit(
          ProductState.loaded(
            products: products + nextChunkProducts,
            hasMore: true,
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
