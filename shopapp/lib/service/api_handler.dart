import 'package:dio/dio.dart';
import 'package:shopapp/models/product_model.dart';

class ApiHandler {
  Future<List<ProductModel>?> fetchProduct() async {
    final response = await Dio().get("https://fakestoreapi.com/products");
    if (response.statusCode == 200) {
      final _datas = response.data;
      print(_datas);
      if (_datas is List) {
        return _datas.map((e) => ProductModel.fromJson(e)).toList();
      }
    }
  }
}
