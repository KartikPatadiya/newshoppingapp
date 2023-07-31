import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newshoppingapp/model/product_model.dart';
import 'package:newshoppingapp/provider/cart_provider.dart';
import 'package:newshoppingapp/screens/searchproduct.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 54, 77, 124),
        title: const Text('Product List'),
        actions: [
          //search icon
          InkWell(
            onTap: () => const SearchProduct(),
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0, top: 3),
              child: Icon(
                CupertinoIcons.search,
                color: Colors.white,
                // size: 38,
              ),
            ),
          ),
          //add to cart icon
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/cart');
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0, top: 3),
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
                // size: 38,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          //card of product
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                MyProduct product = productList[index];
                return Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: ListTile(
                        //image of product
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.cover,
                            )),
                        //name of product
                        title: Text(product.name),
                        // sku of product
                        subtitle: Text(
                            'SKU: ${product.sku}\nCategory: ${product.category}'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //add to card button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 54, 77, 124),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                //by clicking this button AddToCartDialog open
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      AddToCartDialog(product: product),
                                );
                              },
                              child: const Text('Add to Cart'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddToCartDialog extends StatefulWidget {
  final MyProduct product;

  const AddToCartDialog({super.key, required this.product});

  @override
  // ignore: library_private_types_in_public_api
  _AddToCartDialogState createState() => _AddToCartDialogState();
}

class _AddToCartDialogState extends State<AddToCartDialog> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text('Add to Cart'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //product name
          Text('Product: ${widget.product.name}'),
          const SizedBox(height: 8),
          //product price
          Text('Price: ₹${widget.product.price.toStringAsFixed(2)}'),
          const SizedBox(height: 16),
          const Text('Quantity:'),
          Row(
            children: [
              //remove button
              IconButton(
                icon: const Icon(
                  Icons.remove_circle,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  setState(() {
                    if (_quantity > 1) {
                      _quantity--;
                    }
                  });
                },
              ),
              //product quantity
              Text(_quantity.toString()),
              // add button
              IconButton(
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.green,
                ),
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        //cancel button for canceling item and clossing dialog
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
        // adding product into add to card page (adding product)
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 54, 77, 124),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            //checking product quantity min and max
            if (_quantity >= widget.product.minQty &&
                _quantity <= widget.product.maxQty) {
              Provider.of<CartProvider>(context, listen: false)
                  .addToCart(widget.product, _quantity);
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Invalid quantity!')),
              );
            }
          },
          //text of button
          child: const Text('Add to Cart'),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
