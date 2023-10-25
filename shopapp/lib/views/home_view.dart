import 'package:flutter/material.dart';
import 'package:shopapp/constants/app_colors.dart';
import 'package:shopapp/models/product_model.dart';
import 'package:shopapp/service/api_handler.dart';
import 'package:shopapp/views/product_detail.dart';
import 'package:shopapp/views/products_view.dart';
import 'package:shopapp/widgets/products.dart';
import 'package:shopapp/widgets/sales.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:page_transition/page_transition.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ProductModel>? _products;
  final ApiHandler _apiHandler = ApiHandler();
  @override
  void initState() {
    fetchProduct();
    super.initState();
  }

  Future<void> fetchProduct() async {
    _products = await _apiHandler.fetchProduct();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Shop App"),
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.grid_view_rounded)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.groups_2)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
          
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: "Search",
              filled: true,
            
              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.iconsColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Sales();
              },
              itemCount: 3,
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.grey)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("See All Product"),
              CircleAvatar(
                  backgroundColor: Colors.red,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: ProductsView(
                                  products: _products,
                                )));
                      },
                      icon: Icon(Icons.chevron_right))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: _products?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 3 / 4),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Products(
                        imageUrl: "${_products?[index].image}",
                        title: "${_products?[index].title}",
                        price: "${_products?[index].price}",
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: ProductDetail(
                                    imageUrl: "${_products?[index].image}",
                                    title:  "${_products?[index].title}",
                                    price:  "${_products?[index].price}",
                                    desc:  "${_products?[index].description}")));
                      },
                    );
                  })),
        ]),
      ),
    );
  }
}
