import 'package:e_commerce_site/models/my_product.dart';
import 'package:e_commerce_site/pages/details_screen.dart';
import 'package:e_commerce_site/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Our Products",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProductCategory(index: 0, name: "All Products"),
                _buildProductCategory(index: 1, name: "Jackets"),
                _buildProductCategory(index: 2, name: "Sneakers")
              ],
            ),
            SizedBox(height: 20,),
            isSelected == 0 ? _buildAllProducts() : isSelected == 1 ? _buildJackets() : _buildSneaker()
          ],
        ),
      );
  }



  _buildProductCategory({required int index, required String name }) => GestureDetector(
    onTap: (){
      setState(() {
        isSelected = index;
      });
    },
    child: Container(
      height: 40,
      width: 100,
      margin: EdgeInsets.only(top: 10, right: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected == index ? Colors.red[800] : Colors.red[200]
      ),
      child: Text(name, style: TextStyle(color: Colors.white),),
    ),
  );


  _buildAllProducts() => Expanded(
    child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          childAspectRatio: 100/140,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.allProducts.length,
        itemBuilder: (context, index){
          final allProducts = MyProducts.allProducts[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => DetailsScreen(product: allProducts)));
            },
              child: ProductCard(product: allProducts));
        }),
  );

  _buildJackets() => Expanded(
    child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 100/140,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.jacketList.length,
        itemBuilder: (context, index){
          final jacketList = MyProducts.jacketList[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => DetailsScreen(product: jacketList)));
            },
              child: ProductCard(product: jacketList));
        }),
  );

  _buildSneaker() => Expanded(
    child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 100/140,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.sneakersList.length,
        itemBuilder: (context, index){
          final sneakerList = MyProducts.sneakersList[index];
          return GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) => DetailsScreen(product: sneakerList)));
              },
              child: ProductCard(product: sneakerList));
        }),
  );
}