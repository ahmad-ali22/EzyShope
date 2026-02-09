import 'package:e_commerce_site/models/product.dart';
import 'package:e_commerce_site/providers/favorite_provider.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget{

  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  provider.toggleFavorite(widget.product);
                  setState(() {

                  });
                },
                  child: Icon(
                    provider.isExist(widget.product) ?
                    Icons.favorite : Icons.favorite_outline_rounded,
                    color: Colors.red[800],)),
            ],
          ),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.product.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            widget.product.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            widget.product.category,
            style: TextStyle(
              fontSize: 14,
              color: Colors.red[800]
            ),
          ),
          Text(
            "\$" "${widget.product.price}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}