import 'package:avaliation_app/models/api_response.dart';
import 'package:avaliation_app/models/product.dart';
import 'package:avaliation_app/pages/products/components/custom_button.dart';
import 'package:avaliation_app/pages/products/products_controller.dart';
import 'package:flutter/material.dart';
import 'components/custom_form.dart';
import 'components/custom_textfield.dart';

class ProductsEditPage extends StatefulWidget {
  final int id;

  ProductsEditPage({
    this.id,
  });

  @override
  _ProductsEditPageState createState() => _ProductsEditPageState();
}

class _ProductsEditPageState extends State<ProductsEditPage> {
  ProductsController _productsController;
  Product product;
  TextEditingController nameController, quantityController, valueController;

  getProduct() async {
    ApiResponse response = await _productsController.getById(widget.id);

    if (response.success) {
      setState(() {
        product = response.data;
        nameController.text = product.nome;
        quantityController.text = product.quantidade.toString();
        valueController.text = product.valor.toString();
      });
    }
  }

  update() {
    FocusScope.of(context).requestFocus(new FocusNode());

    product.nome = nameController.text;
    product.quantidade = double.parse(quantityController.text);
    product.valor = double.parse(valueController.text);

    _productsController.update(context, product);
  }

  @override
  void initState() {
    super.initState();

    _productsController = new ProductsController();

    nameController = new TextEditingController();
    quantityController = new TextEditingController();
    valueController = new TextEditingController();

    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = (size.height - MediaQuery.of(context).padding.top);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Editar produto"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: height,
            child: CustomForm(
              customButton: CustomButton(
                backGroundColor: Colors.teal,
                textColor: Colors.white,
                text: "SALVAR",
                width: size.width * .5,
                onSubmit: () {
                  update();
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
