import 'package:flutter/material.dart';
import 'package:newshoppingapp/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // storing and calling fuction from cart provider
    var cartProvider = Provider.of<CartProvider>(context);
    var cartItems = cartProvider.cartItems;
    var subtotal = cartProvider.getSubtotal();
    var shippingCharge = cartProvider.getShippingCharge();
    var grandTotal = cartProvider.getGrandTotal();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: const Color.fromARGB(255, 54, 77, 124),
      ),
      body:
          //checking if card has data we display product data else is empty we display cart is empty
          cartItems.isEmpty
              ? const Center(child: Text('Cart is empty'))
              : Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          var cartItem = cartItems[index];
                          return Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              //image of product
                              leading: Image.asset(cartItem.product.imagePath),
                              //name of product
                              title: Text(cartItem.product.name),
                              // price of product
                              subtitle: Text(
                                'Price: ₹${cartItem.product.price.toStringAsFixed(2)} '
                                '| Quantity: ${cartItem.quantity}',
                              ),
                              //delete icon
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  cartProvider.removeFromCart(index);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // subtotal text
                    ctmText('Subtotal: ₹${subtotal.toStringAsFixed(2)}'),
                    // shippingCharge text
                    ctmText(
                        'Shipping Charge: ₹${shippingCharge.toStringAsFixed(2)}'),
                    // Grand Total text
                    ctmText('Grand Total: ₹${grandTotal.toStringAsFixed(2)}'),
                  ],
                ),
    );
  }

  ctmText(nameAndPrice) {
    return ListTile(
      title: Text(nameAndPrice),
    );
  }
}
