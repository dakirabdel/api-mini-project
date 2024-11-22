import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/ProductProvider.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    // productProvider.fetchProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text(productProvider.products.length.toString()),
      ),
      body: productProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          final product = productProvider.products[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: product["imageUrl"] != null
                  ? Image.network(
                "https://www.gamintg.com/${product['imageUrl']}",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
                  : Icon(Icons.image_not_supported),
              title: Text(product['title']),
              subtitle: Text(
                product['description'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}
