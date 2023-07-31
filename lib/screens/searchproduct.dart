import 'package:flutter/material.dart';
import 'package:newshoppingapp/model/product_model.dart';

class SearchProduct extends StatefulWidget {
  SearchProduct({Key? key}) : super(key: key);

  @override
  _SearchProductState createState() => new _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  TextEditingController editingController = TextEditingController();
  MyProduct? product;

  var items = <String>[];

  @override
  void initState() {
    items != product;
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = product!
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 54, 77, 124),
        title: new Text('Search'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  MyProduct productt = productList[index];
                  return ListTile(
                    //image of product
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          productt.imagePath,
                          fit: BoxFit.cover,
                        )),
                    //name of product
                    title: Text(productt.name),
                    // sku of product
                    subtitle: Text(
                        'SKU: ${productt.sku}\nCategory: ${productt.category}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
