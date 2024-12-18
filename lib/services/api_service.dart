import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://fakestoreapi.com';

  // Fetch list of products
  Future<List<dynamic>> fetchProducts() async {
    final response = await _dio.get('$baseUrl/products');
    return response.data;
  }

  // Fetch product details by ID
  Future<Map<String, dynamic>> fetchProductById(int id) async {
    final response = await _dio.get('$baseUrl/products/$id');
    return response.data;
  }
}
