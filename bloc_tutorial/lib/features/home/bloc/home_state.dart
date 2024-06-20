part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

// Build states
class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccesfullyState extends HomeState {
  final List<ProductModel> products;
  HomeLoadedSuccesfullyState(this.products);
}

class HomeErrorState extends HomeState {}

//Action States
class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishListActionState extends HomeActionState {}

class HomeProductItemAddedToWishlistActionState extends HomeActionState {}

class HomeProductItemRemovedFromWishlistActionState extends HomeActionState {}

class HomeProductItemAddedToCartActionState extends HomeActionState {}

class HomeProductItemRemovedFromCartActionState extends HomeActionState {}
