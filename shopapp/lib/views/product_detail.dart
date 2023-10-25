import 'package:flutter/material.dart';
import 'package:shopapp/constants/app_colors.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.desc});
  String imageUrl;
  String title;
  var price;
  String desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(39, 155, 152, 152),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(
                            MediaQuery.of(context).size.width * 0.5, 30),
                        bottomRight: Radius.elliptical(
                            MediaQuery.of(context).size.width * 0.5, 30),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl
                            // "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D",
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.scaffoldColor,
                      child: Text(
                        "$price\$",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "$title",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(218, 179, 153, 6),
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(218, 179, 153, 6),
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(218, 179, 153, 6),
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(218, 179, 153, 6),
                          ),
                        ],
                      ),
                      Text(desc),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(onPressed: () {}, child: Text("+"),style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),),
                          Text("2"),
                          ElevatedButton(onPressed: () {}, child: Text("-"),style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),),
                          SizedBox(),
                          SizedBox(),
                          SizedBox(),
                          ElevatedButton(
                              onPressed: () {}, child: Text("Add to cart")),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
