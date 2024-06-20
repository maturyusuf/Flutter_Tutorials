import 'package:bloc_tutorial/features/cart/ui/cart_page.dart';
import 'package:bloc_tutorial/features/home/bloc/home_bloc.dart';
import 'package:bloc_tutorial/features/home/ui/product_tile_widget.dart';
import 'package:bloc_tutorial/features/wishlist/ui/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishlistPage()));
        } else if (state is HomeProductItemAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Product Added to Cart"),
          ));
        } else if (state is HomeProductItemAddedToWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Product Added to Wishlist"),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
                body: Center(child: const CircularProgressIndicator()));
          case HomeLoadedSuccesfullyState:
            final successState = state as HomeLoadedSuccesfullyState;
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.amber,
                  title: Text("Yusuf Bloc Groceries"),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeWishlistButonNavigateEvent());
                        },
                        icon: Icon(Icons.favorite)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartButonNavigateEvent());
                        },
                        icon: Icon(Icons.shopping_bag)),
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                        productModel: successState.products[index],
                        homeBloc: homeBloc,
                      );
                    }));
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error !"),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
