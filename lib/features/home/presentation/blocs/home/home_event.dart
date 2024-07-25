part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getHomeData({required bool isRefresh}) = _GetHomeData;
  const factory HomeEvent.loadMoreProducts() = _LoadMoreProducts;
}