import 'package:flutter/material.dart';

class Products extends StatelessWidget {
   Products({super.key,required this.imageUrl,required this.title,required this.price});
  String imageUrl;
  String title;
  var price;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          child: FadeInImage(
      image: NetworkImage(imageUrl),
      placeholder: AssetImage(
          "assets/notfound.png"),
      imageErrorBuilder:
          (context, error, stackTrace) {
        return Image.asset(
            'assets/notfound.png',
            fit: BoxFit.cover);
      },
      fit: BoxFit.fitWidth,
    )
          ),
          Text(
            title,
            maxLines: 1,overflow: TextOverflow.ellipsis,
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
