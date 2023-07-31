import 'package:flutter/material.dart';
import 'package:newshoppingapp/model/product_model.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  MyProduct? myProduct;
  bool isChanged = false;
  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = myProduct as List<Map<String, dynamic>>;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = myProduct as List<Map<String, dynamic>>;
    } else {
      results = myProduct!
          .where((product) => product["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextField(
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
              labelText: 'Search', suffixIcon: Icon(Icons.search)),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: _foundUsers.isNotEmpty
              ? ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(_foundUsers[index]["id"]),
                    color: Colors.amberAccent,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Text(
                        _foundUsers[index]["id"].toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(_foundUsers[index]['name']),
                      subtitle:
                          Text('${_foundUsers[index]["age"].toString()} '),
                    ),
                  ),
                )
              : const Text(
                  'No results found',
                  style: TextStyle(fontSize: 24),
                ),
        ),
      ],
    );
  }
}
