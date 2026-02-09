import 'package:e_commerce_site/pages/cart_details.dart';
import 'package:e_commerce_site/pages/favorite_screen.dart';
import 'package:e_commerce_site/pages/home_screen.dart';
import 'package:e_commerce_site/pages/profile_screen.dart';
import 'package:e_commerce_site/providers/cart_provider.dart';
import 'package:e_commerce_site/providers/favorite_provider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider())
      ],
    child: MaterialApp(
    title: 'EzyShope',
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: const MyHomePage(),
    debugShowCheckedModeBanner: false,
  ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];
  int currentIndex = 0;

  // Override Starting Here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,


      // AppBar Starting here
      appBar: AppBar(
        title: const Text("EzyShope", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red[800],
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartDetails()));
          },
              icon: const Icon(Icons.add_shopping_cart, color: Colors.white,)),
        ],
      ),



        // SystemUiMode Activated here
        onDrawerChanged: (isOpened){
        if(isOpened){
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        } else{
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        }
        },



        // Drawer Starting Here
        drawer: NavigationDrawer(
        onDestinationSelected: (value){
          currentIndex = value;
          setState(() {

          });
          _scaffoldKey.currentState?.closeDrawer();
        },
          selectedIndex: currentIndex,
          children: const [
        DrawerHeader(child: Center(child: Column(
          children: [
            Text("EzyShope", style: TextStyle(fontSize: 30,),),
            Text("You all in one store")
          ],
        ))),
        NavigationDrawerDestination(icon: Icon(Icons.home), label: Text("Home"),),
        NavigationDrawerDestination(icon: Icon(Icons.favorite_border), label: Text("Favorites")),
        NavigationDrawerDestination(icon: Icon(Icons.add_shopping_cart), label: Text("Carts")),
        Divider(),
        NavigationDrawerDestination(icon: Icon(Icons.settings), label: Text("Settings")),
        NavigationDrawerDestination(icon: Icon(Icons.help_outline), label: Text("Help & feedback"))
      ]),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (value){
      //     setState(() {
      //       currentIndex = value;
      //     });
      //
      //   },
      //   selectedItemColor: Colors.red[800],
      //   unselectedItemColor: Colors.grey,
      //   items: const [
      //     BottomNavigationBarItem(
      //         label: "Home",
      //         icon: Icon(Icons.home_filled)
      //     ),
      //     BottomNavigationBarItem(
      //         label: "Favorite",
      //         icon: Icon(Icons.favorite)
      //     ),
      //     BottomNavigationBarItem(
      //         label: "Profile",
      //         icon: Icon(Icons.person)
      //     ),
      //   ],
      // ),



        // BottomNavigationVar Starting Here
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: Colors.grey[300],
            labelTextStyle: WidgetStateProperty.resolveWith((states){
              if(states.contains(WidgetState.selected)){
                return const TextStyle(fontWeight: FontWeight.bold, color: Colors.red);
              } else{
                return const TextStyle();
              }
            }),
            iconTheme: WidgetStateProperty.resolveWith((states){
              if(states.contains(WidgetState.selected)){
                return const IconThemeData(color: Colors.white);
              } else{
                return const IconThemeData(color: Colors.black);
              }
            }),
            indicatorColor: Colors.red,
          ),
          child: NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: (value){
              setState(() {
                currentIndex = value;
              });
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_filled), label: "Home"),
              NavigationDestination(icon: Icon(Icons.favorite_outline), selectedIcon: Icon(Icons.favorite), label: "Favorite"),
              NavigationDestination(icon: Icon(Icons.person_2_outlined), selectedIcon: Icon(Icons.person), label: "Profile")
            ]),
        ),



        //Body Starting Here
      body: screens[currentIndex]
    );
  }
}
