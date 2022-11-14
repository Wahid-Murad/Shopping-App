import 'dart:io';

import 'package:ecommerce/model/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices{
static var client = http.Client();

static Future<List<Product>?> fetchProducts()async{

  // var response = await client.get("http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"); 

  String Link="http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";
  var response=await client.get(Uri.parse(Link));
  if(response.statusCode==200){
    var jsonString=response.body;
   return productFromJson(jsonString);
  }
  else{
    return null;
  }
}
}