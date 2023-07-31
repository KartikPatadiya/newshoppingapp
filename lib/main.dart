import 'package:flutter/material.dart';
import 'package:newshoppingapp/provider/cart_provider.dart';
import 'package:newshoppingapp/screens/MyHomePage.dart';
import 'package:newshoppingapp/screens/add_to_cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // useMaterial3: true,
            ),
        home: const MyHomePage(),
        // initialRoute: const MyHomePage(),
        routes: {
          '/home': (context) => MyHomePage(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
