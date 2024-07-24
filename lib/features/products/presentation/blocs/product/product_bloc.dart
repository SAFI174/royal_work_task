import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_task/features/products/domain/usecases/get_products_usecase.dart';
import '../../../domain/entities/product.dart';
part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUsecase getProductsUsecase;

  ProductBloc(this.getProductsUsecase) : super(const ProductState.initial()) {
    on<_GetProducts>(_getProducts);
    on<_LoadMoreProducts>(_loadMoreProducts);
  }
  List<Product> products = [];
  final int limit = 10;
  int offset = 0;
  Future<void> _getProducts(
      _GetProducts event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final result = await getProductsUsecase(event.isRefresh);
    result.fold(
      (error) => emit(ProductState.loadFailed(message: error.message)),
      (products) {
        this.products.addAll(products);
        emit(ProductState.loaded(products: _getNextChunk(), hasMore: true));
      },
    );
  }

  Product getProductById(int productId) {
    return products.firstWhere(
      (product) => product.id == productId,
    );
  }

  Future<void> _loadMoreProducts(
      _LoadMoreProducts event, Emitter<ProductState> emit) async {
    state.whenOrNull(
      loading: () {
        return;
      },
      loadFailed: (message) {
        return;
      },
      loaded: (products, hasMore) {
        if (!hasMore) {
          return;
        }
        final nextChunkProducts = _getNextChunk();
        if (nextChunkProducts.isEmpty || nextChunkProducts.length < limit) {
          return emit(
            ProductState.loaded(
              products: products + nextChunkProducts,
              hasMore: false,
            ),
          );
        }
        emit(
          ProductState.loaded(
            products: products + _getNextChunk(),
            hasMore: true,
          ),
        );
      },
    );
  }

  List<Product> _getNextChunk() {
    final start = offset;
    final end =
        (start + limit > products.length) ? products.length : start + limit;
    offset = end;
    return products.sublist(start, end); // Return the chunk
  }
}
