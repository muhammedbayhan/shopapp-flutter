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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 10,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    child: Container(
                      color: Colors.grey.shade300,
                      child: Image.network(
                    imageUrl ?? "assets/notfound.png",
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.photo_album,
                      size: 150,
                    ),
                  ),
                      
                    ))),
            Expanded(flex: 1, child: Text(title)),
            Expanded(
                flex: 1,
                child: Container(
              
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Text("$price\$",style: Theme.of(context).textTheme.headlineSmall,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 50,
                      child: ElevatedButton(onPressed: () {}, child: Text("data")))
                  ]),
                ))
          ],
        ));
  }
}
