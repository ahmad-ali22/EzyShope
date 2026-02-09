import 'package:e_commerce_site/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartDetails extends StatefulWidget{
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    _buildProductQuantity(IconData icon, int index){
      return GestureDetector(
        onTap: (){
          setState(() {
            icon == Icons.add
                ? provider.increamentQuantity(index)
                : provider.decreamentQuantity(index);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red[800]
          ),
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: Colors.red[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
        body: Column(
          children: [
            Expanded(child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Slidable(
                      endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context){
                                finalList[index].quantity = 1;
                                finalList.removeAt(index);
                                setState(() {});
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: "Delete",
                            )
                          ]),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red[100],
                          radius: 30,
                          child: Image.asset(finalList[index].image),
                        ),
                        title: Text(finalList[index].name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        subtitle: Text("\$""${finalList[index].price}"),
                        trailing: Column(
                          children: [
                            _buildProductQuantity(Icons.add, index),
                            Text("${finalList[index].quantity}", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                            _buildProductQuantity(Icons.remove, index)
                          ],
                        ),
                        tileColor: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                  );
                })),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${provider.getTotalPrice().toStringAsFixed(3)}",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  ElevatedButton.icon(onPressed: (){},
                    icon: Icon(Icons.send),
                    label: Text("Check out"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[800],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}