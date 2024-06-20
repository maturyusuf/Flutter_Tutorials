import 'package:bloc_tutorial/features/home/bloc/home_bloc.dart';
import 'package:bloc_tutorial/features/home/models/home_product_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black54),
                image: DecorationImage(
                    image: NetworkImage(productModel.image),
                    fit: BoxFit.cover)),
          ),
          Text(productModel.name),
          Text(productModel.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("\$${productModel.price}"),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishlistButonClickedEvent(
                        clickedProduct: productModel));
                  },
                  icon: Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(
                        clickedProduct: productModel));
                  },
                  icon: Icon(Icons.shopping_bag)),
            ],
          )
        ],
      ),
    );
  }
}
