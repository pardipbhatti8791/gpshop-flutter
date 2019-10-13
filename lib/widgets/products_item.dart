import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Product.dart';
import 'package:shopapp/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GridTile(
      child: GestureDetector(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailsScreen.routeName, arguments: product.id);
        },
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon:
              Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
          onPressed: () => product.toggleFavoriteStatus(),
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
