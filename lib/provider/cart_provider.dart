import 'package:flutter/material.dart';
import 'package:newshoppingapp/model/product_model.dart';

class CartProvider extends ChangeNotifier {
  // creating empty list for adding items
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  // by using this we will get subtotal of product
  double getSubtotal() {
    double subtotal = 0;
    for (var cartItem in _cartItems) {
      subtotal += cartItem.product.price * cartItem.quantity;
    }
    return subtotal;
  }

  // for shipping charge
  double getShippingCharge() {
    double volumetricWeight = 0;
    for (var cartItem in _cartItems) {
      volumetricWeight += cartItem.product.volumetricWeight * cartItem.quantity;
    }
    return 80 * volumetricWeight;
  }

  // grandtotal function
  double getGrandTotal() {
    double subtotal = getSubtotal();
    double shippingCharge = getShippingCharge();
    return subtotal + shippingCharge + 50; // min shipping charge of 50rs.
  }

  //adding item we use this function
  void addToCart(MyProduct product, int quantity) {
    _cartItems.add(CartItem(product: product, quantity: quantity));
    notifyListeners();
  }

  //updating product quantity
  void updateQuantity(int index, int newQuantity) {
    _cartItems[index].quantity = newQuantity;
    notifyListeners();
  }

  //removing product from cart
  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}
