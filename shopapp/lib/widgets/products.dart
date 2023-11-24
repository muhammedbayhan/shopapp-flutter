import 'package:flutter/material.dart';
import 'package:shopapp/constants/app_colors.dart';

class Products extends StatelessWidget {
  Products(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price});
  String imageUrl;
  String title;
  var price;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: SizedBox(
                  child: Image.network(
                    imageUrl ?? "assets/notfound.png",
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.photo_album,
                      size: 150,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
      ),
    );
  }
}
