import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../pages/product_detail.dart';

class ProductListPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Explorer'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product['title']),
                  subtitle: Text('ID: ${product['id']}'),
                  leading: Image.network(product['image'], width: 50, height: 50),
                  onTap: () {
                    // Navigate to detail page with product ID
                    Get.to(() => ProductDetailPage(productId: product['id']));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
