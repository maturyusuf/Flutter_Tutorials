import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/cart_items.dart';
import 'package:bloc_tutorial/data/grocery_data.dart';
import 'package:bloc_tutorial/data/wishlist_items.dart';
import 'package:bloc_tutorial/features/home/models/home_product_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeProductWishlistButonClickedEvent>(
        homeProductWishlistButonClickedEvent);

    on<HomeWishlistButonNavigateEvent>(homeWishlistButonNavigateEvent);
    on<HomeCartButonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    print("Home initial event is done");
    emit(HomeLoadingState());
    Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccesfullyState(GroceryData.groceryProducts
        .map((e) => ProductModel(
            id: e["id"],
            name: e["name"],
            description: e["description"],
            price: e["price"].toString(),
            image: e["imageUrl"]))
        .toList()));
  }
}

FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
  print("Cart Clicked!");
  CartItems.cartItems.add(event.clickedProduct);
  emit(HomeProductItemAddedToCartActionState());
}

FutureOr<void> homeProductWishlistButonClickedEvent(
    HomeProductWishlistButonClickedEvent event, Emitter<HomeState> emit) {
  print("Wishlist Clicked!");
  WishlistItems.wishlistItems.add(event.clickedProduct);
  emit(HomeProductItemAddedToWishlistActionState());
}

FutureOr<void> homeWishlistButonNavigateEvent(
    HomeWishlistButonNavigateEvent event, Emitter<HomeState> emit) {
  print("Wishlist Navigate Clicked!");
  emit(HomeNavigateToWishlistPageActionState());
}

FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButonNavigateEvent event, Emitter<HomeState> emit) {
  print("Cart Navigate Clicked!");
  emit(HomeNavigateToCartPageActionState());
}
