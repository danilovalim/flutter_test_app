import 'package:avaliation_app/models/api_response.dart';
import 'package:avaliation_app/models/product.dart';
import 'package:avaliation_app/repositories/interfaces/i_product_repository.dart';
import 'package:dio/dio.dart';

class ProductRepository implements IProductRepository {
  String apiBaseURL = 'https://desafio-apirest-produtos.herokuapp.com/api/';

  @override
  Future<ApiResponse> getAll() async {
    var response = new ApiResponse();
    response.data = new List<Product>();

    var result = await Dio().get(apiBaseURL + 'produtos');

    if (result.statusCode == 200) {
      response.success = true;
      response.data = List<Product>.from(
        (result.data as List).map(
          (product) => Product.fromJson(product),
        ),
      );
    }

    return response;
  }

  @override
  Future<ApiResponse> getById(int id) async {
    var response = new ApiResponse();

    var result = await Dio().get(apiBaseURL + 'produto/$id');

    if (result.statusCode == 200) {
      if (result.data != '') {
        response.success = true;
        response.data = Product.fromJson(result.data);
      }
    }

    return response;
  }

  @override
  Future<ApiResponse> create(Product product) async {
    var response = new ApiResponse();

    try {
      var result = await Dio().post(apiBaseURL + 'produto', data: product);

      if (result.statusCode == 200) {
        response.success = true;
      }
    } catch (e) {
      response.error = e;
    }

    return response;
  }

  @override
  Future<ApiResponse> update(Product product) async {
    var response = new ApiResponse();

    try {
      var result = await Dio().put(apiBaseURL + 'produto', data: product);

      if (result.statusCode == 200) {
        response.success = true;
      }
    } catch (e) {
      response.error = e;
    }

    return response;
  }

  @override
  Future<ApiResponse> delete(Product product) async {
    var response = new ApiResponse();

    try {
      var result = await Dio().delete(apiBaseURL + 'produto', data: product);

      if (result.statusCode == 200) {
        response.success = true;
      }
    } catch (e) {
      response.error = e;
    }

    return response;
  }
}
