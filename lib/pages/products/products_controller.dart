import 'package:avaliation_app/models/api_response.dart';
import 'package:avaliation_app/models/product.dart';
import 'package:avaliation_app/repositories/product_repository.dart';
import 'package:avaliation_app/shared/utils/notifications_service.dart';
import 'package:flutter/material.dart';

class ProductsController {
  ProductRepository _productRepository;

  ProductsController() {
    _productRepository = new ProductRepository();
  }

  Future<ApiResponse> getAll() async {
    return await _productRepository.getAll();
  }

  Future<ApiResponse> getById(int id) async {
    return await _productRepository.getById(id);
  }

  void create(BuildContext context, Product product) async {
    var progressDialog = NotificationsService.showLoadingDialog(
        context, 'Cadastrando produto...');
    progressDialog.show();

    ApiResponse response = await _productRepository.create(product);

    await Future.delayed(Duration(seconds: 2));

    progressDialog.hide();

    response.success
        ? NotificationsService.showToastMessage(
            context, Colors.green, 'Produto cadastrado com sucesso!')
        : NotificationsService.showToastMessage(
            context, Colors.red, 'Não foi possível cadastrar o produto!');
  }

  void update(BuildContext context, Product product) async {
    var progressDialog = NotificationsService.showLoadingDialog(
        context, 'Atualizando produto...');
    progressDialog.show();

    ApiResponse response = await _productRepository.update(product);

    await Future.delayed(Duration(seconds: 2));

    progressDialog.hide();

    response.success
        ? NotificationsService.showToastMessage(
            context, Colors.green, 'Produto atualizado com sucesso!')
        : NotificationsService.showToastMessage(
            context, Colors.red, 'Não foi possível alterar o produto!');
  }

  void delete(BuildContext context, Product product) async {
    _confirmDelete(context, product);
  }

  _confirmDelete(BuildContext context, Product product) {
    NotificationsService.showConfirmationDialog(
      context,
      'Atenção!',
      'Deseja remover esse produto?',
      () {
        Navigator.of(context).pop();

        _deleteProduct(context, product);
      },
    );
  }

  _deleteProduct(BuildContext context, Product product) async {
    var progressDialog =
        NotificationsService.showLoadingDialog(context, 'Removendo produto...');
    progressDialog.show();

    ApiResponse response = await _productRepository.delete(product);

    await Future.delayed(Duration(seconds: 2));

    progressDialog.hide();

    response.success
        ? NotificationsService.showToastMessage(
            context, Colors.green, 'Produto removido com sucesso!')
        : NotificationsService.showToastMessage(
            context, Colors.red, 'Não foi possível remover o produto!');
  }
}
