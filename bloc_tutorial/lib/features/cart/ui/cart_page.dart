import 'package:bloc_tutorial/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_tutorial/features/cart/ui/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: BlocConsumer<CartBloc, CartState>(
            bloc: cartBloc,
            listener: (context, state) {},
            buildWhen: (previous, current) => current is! CartActionState,
            listenWhen: (previous, current) => current is CartActionState,
            builder: (context, state) {
              switch (state) {
                case CartSuccessState _:
                  final successState = state as CartSuccessState;
                  return ListView.builder(
                      itemCount: successState.cartedProducts.length,
                      itemBuilder: (context, index) {
                        return CartTileWidget(
                            productModel: successState.cartedProducts[index],
                            cartBloc: cartBloc);
                      });

                default:
                  return Scaffold(
                    body: Center(
                      child: Text("No item in cart!"),
                    ),
                  );
              }
            }));
  }
}
