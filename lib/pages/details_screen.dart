import 'package:e_commerce_site/models/product.dart';
import 'package:e_commerce_site/pages/cart_details.dart';
import 'package:e_commerce_site/providers/cart_provider.dart';
import 'package:e_commerce_site/widgets/available_size.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget{

  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.red[800],
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          SizedBox(height: 36,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(product.image, fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(height: 36,),
          Container(
            height: 400,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
              )
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text("\$""${product.price}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 14,),
                Text(product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 15
                  ),
                ),
                SizedBox(height: 14,),
                const Row(
                  children: [
                    Text("Available Size",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                      ),),
                  ],
                ),
                SizedBox(height: 8,),
                const Row(
                  children: [
                    AvailableSize(size: "US 6"),
                    AvailableSize(size: "US 7"),
                    AvailableSize(size: "US 8"),
                    AvailableSize(size: "US 9")
                  ],
                ),
                SizedBox(height: 14,),
                const Row(
                  children: [
                    Text("Available Colors",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                  ],
                ),
                SizedBox(height: 8,),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(width: 8,),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(width: 8,),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.yellow,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height/10,
          decoration: BoxDecoration(
            color: Colors.red[800],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$""${product.price}",
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
              ElevatedButton.icon(onPressed: (){
                provider.toggleProduct(product);
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartDetails()));
              },
                  icon: const Icon(Icons.send),
                  label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}