import 'dart:convert';
import 'package:e_commerce_site/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier{
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  CartProvider(){
    loadCarts();
  }

  Future<void> toggleProduct(Product product) async {
    if(_cart.contains(product)){
      for(Product element in _cart){
        element.quantity++;
      }
    } else{
      _cart.add(product);
    }
    await saveCart();
    notifyListeners();
  }
  increamentQuantity(int index) => _cart[index].quantity++;
  decreamentQuantity(int index) => _cart[index].quantity--;

  getTotalPrice(){
    double total = 0.0;
    for(Product element in _cart){
      total += element.price * element.quantity;
    }
    return total;
  }

  static CartProvider of(
      BuildContext context, {
        bool listen = true,
      }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }

  Future<void> saveCart() async{
    final prefs = await SharedPreferences.getInstance();
    List<String> productCartList = _cart.map((p) => jsonEncode(p.toJson())).toList();
    prefs.setStringList("carts", productCartList);
  }

  Future<void> loadCarts() async{
    final prefs = await SharedPreferences.getInstance();
    List<String>? productCartList = prefs.getStringList("carts");
    if(productCartList != null){
      _cart.clear();
      _cart.addAll(productCartList.map((p) => Product.fromJson(jsonDecode(p))));
      notifyListeners();
    }
  }

}