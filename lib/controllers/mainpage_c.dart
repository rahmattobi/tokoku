import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product_m.dart';

class MainPageC extends GetxController {
  final tabIndex = 0.obs;
  TextEditingController? namapC;
  TextEditingController? hargapC;
  TextEditingController? jumlahpC;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  String baseUrl = 'http://10.0.2.2:8000/api/produk';

  Future<List<Product>?> getAllProduct() async {
    Uri url = Uri.parse(baseUrl);

    var res = await http.get(url);

    List data = (jsonDecode(res.body) as Map<String, dynamic>)["data"]["data"];

    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future deleteProduct(String id) async {
    Uri url = Uri.parse('$baseUrl/$id');

    var res = await http.delete(url);
    if (res.statusCode == 200) {
      Get.snackbar(
        "Berhasil",
        "Berhasil Menghapus Produk",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      update();
    } else {
      Get.snackbar(
        "Error",
        "Gagal Menghapus Produk !!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> updateProduk(
    String? namaProduk,
    int? jumlahProduk,
    int? hargaProduk,
    String? idUser,
    String? idProduk,
    String? imageProduk,
  ) async {
    try {
      var url = Uri.parse('$baseUrl/$idProduk');

      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'nama_produk': namaProduk,
        'satuan_produk': jumlahProduk,
        'harga_produk': hargaProduk,
        'image': imageProduk,
        'id_user': idUser
      });

      await http.put(
        url,
        headers: headers,
        body: body,
      );

      Get.snackbar(
        "Berhasil",
        "Berhasil Update Produk !!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      update();
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        "Gagal Update Produk !!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    namapC?.dispose();
    hargapC?.dispose();
    jumlahpC?.dispose();
    super.dispose();
  }
}
