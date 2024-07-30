import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stackflutterex/models/productmodel/product.dart';
import 'package:stackflutterex/models/productmodel/productmodel.dart';

class Apiservice {
  Future<List<Product>?> fetchdata() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/products"));
    var jsonn = jsonDecode(response.body);
    var res = Productmodel.fromJson(jsonn);
    var list = res.products;
    return list;
  }
}
