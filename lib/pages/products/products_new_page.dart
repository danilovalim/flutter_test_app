import 'package:avaliation_app/models/product.dart';
import 'package:avaliation_app/pages/products/products_controller.dart';
import 'package:flutter/material.dart';
import 'components/custom_button.dart';
import 'components/custom_form.dart';
import 'components/custom_textfield.dart';

class ProductsNewPage extends StatefulWidget {
  @override
  _ProductsNewPageState createState() => _ProductsNewPageState();
}

class _ProductsNewPageState extends State<ProductsNewPage> {
  TextEditingController nameController, quantityController, valueController;
  ProductsController _productsController;
  bool isLoading = false;

  create() {
    FocusScope.of(context).requestFocus(new FocusNode());

    var product = new Product();
    product.nome = nameController.text;
    product.quantidade = double.parse(quantityController.text);
    product.valor = double.parse(valueController.text);

    _productsController.create(context, product);
  }

  @override
  void initState() {
    super.initState();

    _productsController = new ProductsController();

    nameController = new TextEditingController();
    quantityController = new TextEditingController();
    valueController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = (size.height - MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Novo produto"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: height,
            child: CustomForm(
              customButton: CustomButton(
                backGroundColor: Colors.teal,
                textColor: Colors.white,
                text: "CADASTRAR",
                width: size.width * .5,
                onSubmit: () {
                  create();
                },
              ),
              fields: [
                CustomTextField(
                  controller: nameController,
                  inputType: TextInputType.text,
                  labelText: 'Nome',
                ),
                CustomTextField(
                  controller: quantityController,
                  inputType: TextInputType.number,
                  labelText: 'Quantidade',
                ),
                CustomTextField(
                  controller: valueController,
                  inputType: TextInputType.number,
                  labelText: 'Valor',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
