import 'package:flutter/material.dart';
import 'package:shopapp/models/product_model.dart';
import 'package:shopapp/views/product_detail.dart';
import 'package:page_transition/page_transition.dart';

class ProductsView extends StatelessWidget {
  ProductsView({
    super.key,
    required List<ProductModel>? products,
  }) : _products = products;

  final List<ProductModel>? _products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ALL PRODUCTS"),),
      body: ListView.builder(
          itemCount: _products?.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(foregroundImage: NetworkImage("${_products?[index].image}")),
              title: Column(
                children: [
                  Text("${_products?[index].title}",maxLines: 1, overflow: TextOverflow.ellipsis,),
                  Text("${_products?[index].price}",style: TextStyle(color: Colors.green)),
                ],
              ),
              trailing:
                  IconButton(onPressed: () {
                     Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: ProductDetail(
                                    imageUrl: "${_products?[index].image}",
                                    title:  "${_products?[index].title}",
                                    price:  "${_products?[index].price}",
                                    desc:  "${_products?[index].description}")));
                  }, icon: Icon(Icons.chevron_right)),
            );
          }),
    );
  }
}
