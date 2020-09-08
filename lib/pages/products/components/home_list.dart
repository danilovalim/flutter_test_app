import 'package:avaliation_app/models/product.dart';
import 'package:avaliation_app/pages/products/products_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../products_edit_page.dart';

class HomeListComponent extends StatelessWidget {
  final List<Product> products;
  final ProductsController productsController;

  const HomeListComponent({
    Key key,
    this.products,
    this.productsController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (c, i) => SizedBox(height: 10),
        itemBuilder: (c, i) {
          Product product = products[i];

          return ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) => ProductsEditPage(
                    id: product.id,
                  ),
                ),
              );
            },
            title: Text(product.nome),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quantidade: ${product.quantidade.toStringAsFixed(0)}"),
                Text(
                  "R\$ ${product.valor.toStringAsFixed(2).replaceAll('.', ',')}",
                ),
              ],
            ),
            leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                productsController.delete(context, product);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 18,
              ),
            ),
          );
        },
      ),
    );
  }
}
