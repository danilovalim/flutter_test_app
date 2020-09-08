import 'package:avaliation_app/models/api_response.dart';
import 'package:avaliation_app/models/product.dart';
import 'package:avaliation_app/pages/products/products_new_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/custom_search_field.dart';
import 'components/home_list.dart';
import 'products_controller.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  ProductsController _productsController;
  List<Product> products;
  bool isLoading = true;

  getProducts() async {
    ApiResponse response = await _productsController.getAll();

    setState(() {
      products = response.data;
      isLoading = false;
    });
  }

  getProductById(int id) async {
    ApiResponse response = await _productsController.getById(id);

    setState(() {
      if (response.success) {
        products.add(response.data);
        isLoading = false;
      } else {
        isLoading = false;
        products = null;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _productsController = new ProductsController();
    products = List<Product>();

    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {},
        child: Center(
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) => ProductsNewPage(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: size.height * .2,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Produtos",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * .08,
                    ),
                  ),
                  CustomSearchField(
                    hintText: "Buscar por id...",
                    size: size,
                    onChanged: (value) {
                      setState(() {
                        products = [];
                        isLoading = true;
                      });

                      if (value.length > 0) {
                        getProductById(int.parse(value));
                      } else {
                        getProducts();
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.teal,
                          ),
                        ),
                      )
                    : products == null
                        ? Center(
                            child: Text("Nenhum produto encontrado!"),
                          )
                        : HomeListComponent(
                            products: products,
                            productsController: _productsController,
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container custom_search_field(Size size) {
    return Container(
      width: size.width * .9,
      height: size.height * .05,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            products = [];
            isLoading = true;
          });

          if (value.length > 0) {
            getProductById(int.parse(value));
          } else {
            getProducts();
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Buscar por id...",
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
