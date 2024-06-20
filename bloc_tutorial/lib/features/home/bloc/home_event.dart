part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeProductWishlistButonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;

  HomeProductWishlistButonClickedEvent({required this.clickedProduct});
}

class HomeWishlistButonNavigateEvent extends HomeEvent {}

class HomeCartButonNavigateEvent extends HomeEvent {}
