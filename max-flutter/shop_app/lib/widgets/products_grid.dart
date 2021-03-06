import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../screens/product_detail.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorites;

  ProductsGrid({@required this.showOnlyFavorites});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products =
        showOnlyFavorites ? productsData.favorites : productsData.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(ProductDetail.routeName, arguments: products[i].id),
        child: ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(),
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
