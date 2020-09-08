import 'package:avaliation_app/models/api_response.dart';
import 'package:avaliation_app/models/product.dart';

abstract class IProductRepository {
  Future<ApiResponse> create(Product product);
  Future<ApiResponse> update(Product product);
  Future<ApiResponse> getById(int id);
  Future<ApiResponse> getAll();
  Future<ApiResponse> delete(Product product);
}
