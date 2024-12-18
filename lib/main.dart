import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/product_list.dart';

void main() {
  runApp(ProductExplorerApp());
}

class ProductExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Product Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListPage(),
    );
  }
}
