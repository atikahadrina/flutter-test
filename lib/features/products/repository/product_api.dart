import 'package:dio/dio.dart';
import 'package:product_cart_app/features/products/model/product_model.dart';

class ProductRepository {
  final Dio dio = Dio();
  final baseUrl = "https://fakestoreapi.com";
  final options = Options(headers: {'Content-Type': 'application/json'});

  Future<List<Product>?> getProductList() async {
    final endpoint = '$baseUrl/products';

    try {
      final response =
          await dio.get<List<dynamic>>(endpoint, options: options);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data ?? <dynamic>[];
        
        return data
            .map((item) =>
                Product.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to fetch product list: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception(
        'Error request: ${e.response?.statusCode}, Error message: ${e.message}',
      );
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<List<Product>?> getProductsByCategory (String? category) async {
    final endpoint = '$baseUrl/products/category/$category';

    try {
      final response =
          await dio.get<List<dynamic>>(endpoint, options: options);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data ?? <dynamic>[];
        
        return data
            .map((item) =>
                Product.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to fetch product list: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception(
        'Error request: ${e.response?.statusCode}, Error message: ${e.message}',
      );
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<Product?> getProductbyID(int? id) async {
    final endpoint = '$baseUrl/products/$id';

    try {
      final response =
          await dio.get<Map<String, dynamic>>(endpoint, options: options);

      if (response.statusCode == 200) {
        if (response.data == null) return null;
        return Product.fromJson(response.data!);
      } else {
        throw Exception('Failed to fetch product detail: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception(
        'Error request: ${e.response?.statusCode}, Error message: ${e.message}',
      );
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
