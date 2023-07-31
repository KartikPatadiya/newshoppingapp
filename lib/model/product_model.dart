class MyProduct {
  final int id;
  final String name;
  final String sku;
  final double price;
  final double length;
  final double width;
  final double height;
  final double volumetricWeight;
  final String category;
  final String imagePath;
  final int minQty;
  final int maxQty;

  MyProduct({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,
    required this.length,
    required this.width,
    required this.height,
    required this.volumetricWeight,
    required this.category,
    required this.imagePath,
    required this.minQty,
    required this.maxQty,
  });

  where(Function(dynamic user) param0) {}
}

List<MyProduct> productList = [
  MyProduct(
    id: 1,
    name: "Noise ColorFit Pulse 2 Max",
    sku: "SKU001",
    price: 1799,
    length: 15,
    width: 10,
    height: 5,
    volumetricWeight: (15 * 10 * 5) / 5000,
    category: "Smart Watch",
    imagePath: "assets/noice.png",
    minQty: 1,
    maxQty: 100,
  ),
  MyProduct(
    id: 2,
    name: "OnePlus Buds pro 2",
    sku: "SKU002",
    price: 11999,
    length: 20,
    width: 15,
    height: 8,
    volumetricWeight: (20 * 15 * 8) / 5000,
    category: "Earbuds",
    imagePath: "assets/OnePlusbuds.jpeg",
    minQty: 1,
    maxQty: 10,
  ),
  MyProduct(
    id: 3,
    name: "iPhone 14 Pro Max",
    sku: "SKU003",
    price: 149900,
    length: 15,
    width: 10,
    height: 5,
    volumetricWeight: (15 * 10 * 5) / 5000,
    category: "Phone",
    imagePath: "assets/iphone14promax.jpg",
    minQty: 1,
    maxQty: 10,
  ),
  MyProduct(
    id: 4,
    name: "Samsung Galaxy S23 Ultra",
    sku: "SKU004",
    price: 124999,
    length: 20,
    width: 15,
    height: 8,
    volumetricWeight: (20 * 15 * 8) / 5000,
    category: "Phone",
    imagePath: "assets/galaxy_s23.webp",
    minQty: 1,
    maxQty: 10,
  ),
  MyProduct(
    id: 5,
    name: "OnePlus 11",
    sku: "SKU005",
    price: 56999,
    length: 20,
    width: 15,
    height: 8,
    volumetricWeight: (20 * 15 * 8) / 5000,
    category: "Phone",
    imagePath: "assets/oneplus11.jpeg",
    minQty: 1,
    maxQty: 10,
  ),
];

//sending all product data into carditem
class CartItem {
  final MyProduct product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
