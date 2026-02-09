import 'package:e_commerce_site/providers/favorite_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget{
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children: [
                Text("Favorites",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
          Expanded(child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Slidable(
                    endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                              onPressed: (context){
                                provider.toggleFavorite(finalList[index]);
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
                      subtitle: Text(finalList[index].description),
                      trailing: Text("\$""${finalList[index].price}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      tileColor: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                );
              }))
        ],
      )
    );
  }
}