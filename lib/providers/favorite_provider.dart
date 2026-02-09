import 'dart:convert';

import 'package:e_commerce_site/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier{
  final List<Product> _favorites = [];
  List<Product> get favorites => _favorites;

  FavoriteProvider(){
    loadFavorites();
  }

  Future<void> toggleFavorite(Product product) async {
    if(_favorites.contains(product)){
      _favorites.remove(product);
    }
    else{
      _favorites.add(product);
    }
    await saveFavorites();
    notifyListeners();
  }
  bool isExist(Product product){
    final isExist = _favorites.contains(product);
    return isExist;
  }
  static FavoriteProvider of(
      BuildContext context, {
        bool listen = true
      }) {
    return Provider.of<FavoriteProvider>(
      context,
    listen: listen
    );
  }

  Future<void> saveFavorites() async{
    final prefs = await SharedPreferences.getInstance();
    List<String> productList = _favorites.map((p) => jsonEncode(p.toJson())).toList();
    prefs.setStringList("favorites", productList);
  }

  Future<void> loadFavorites() async{
    final prefs = await SharedPreferences.getInstance();
    List<String>? productList = prefs.getStringList("favorites");
    if(productList != null){
      _favorites.clear();
      _favorites.addAll(productList.map((p) => Product.fromJson(jsonDecode(p))));
    }
  }
}