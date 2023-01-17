import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../models/cart_m.dart';

class CartController extends GetxController {
  String baseUrl = 'http://10.0.2.2:8000/api/cart';
  String baseUrls = 'http://10.0.2.2:8000/api/checkout';
  String bsurl = 'http://10.0.2.2:8000/api/checkout-detail';
  int? totBarang = 0;
  int? totHarga = 0;

  Future increment(int id) async {
    Uri url = Uri.parse('$baseUrl/$id');

    var res = await http.get(url);
    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    if (data['id'] == id) {
      data['jumlah'] = (data['jumlah'])! + 1;

      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'jumlah': data['jumlah'],
        'status': data['status'],
      });

      await http.put(
        url,
        headers: headers,
        body: body,
      );
      update();
    }
  }

  Future decrement(int id) async {
    Uri url = Uri.parse('$baseUrl/$id');

    var res = await http.get(url);
    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    if (data['jumlah'] > 1 && data['id'] == id) {
      data['jumlah'] = (data['jumlah'])! - 1;

      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'jumlah': data['jumlah'],
        'status': data['status'],
      });

      await http.put(
        url,
        headers: headers,
        body: body,
      );
      update();
    } else {
      Get.snackbar("Gagal", "Tidak bisa memesan Produk kurang dari 1",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future inputCart(
    String? idProduk,
    int? status,
    int? jumlah,
    String? idUser,
  ) async {
    try {
      var url = baseUrl;
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'id_user': idUser,
        'id_produk': idProduk,
        'jumlah': jumlah,
        'status': status,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        update();
        Get.snackbar(
          "Berhasil",
          "Berhasil menambahkan Produk ke keranjang !!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        throw Exception('Gagal input produk');
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        "Gagal menambahkan Produk ke keranjang !!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<List<Cart>?> getAllCart() async {
    Uri url = Uri.parse(baseUrl);

    var res = await http.get(url);

    List data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    return data.map((e) => Cart.fromJson(e)).toList();
  }

  Future deleteCart(String id) async {
    Uri url = Uri.parse('$baseUrl/$id');

    var res = await http.delete(url);
    if (res.statusCode == 200) {
      update();
      Get.snackbar(
        "Berhasil",
        "Berhasil Menghapus Cart",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Error",
        "Gagal Menghapus Cart !!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future updateCart() async {
    try {
      var urls = bsurl;
      var headers = {'Content-Type': 'application/json'};
      var resp = await http.get(
        Uri.parse(urls),
      );

      List data = jsonDecode(resp.body);

      for (var i = 0; i < data.length; i++) {
        Uri url = Uri.parse('$baseUrl/${json.decode(resp.body)[i]}');

        var responses = await http.get(url);
        Map<String, dynamic> data =
            (jsonDecode(responses.body) as Map<String, dynamic>)["data"];

        var body = jsonEncode({
          'jumlah': data['jumlah'],
          'status': 1,
        });

        await http.put(
          url,
          headers: headers,
          body: body,
        );
      }
      update();
    } catch (e) {
      throw Exception('Gagal Update Cart');
    }
  }

  Future checkout(
    int? totalB,
    int? totalH,
  ) async {
    try {
      var url = baseUrls;
      var urls = bsurl;
      var headers = {'Content-Type': 'application/json'};

      var body = jsonEncode({
        'totalB': totalB,
        'totalH': totalH,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      var res = await http.post(
        Uri.parse(urls),
        headers: headers,
      );

      var resp = await http.get(
        Uri.parse(urls),
      );

      List data = jsonDecode(resp.body);

      for (var i = 0; i < data.length; i++) {
        Uri url = Uri.parse('$baseUrl/${json.decode(resp.body)[i]}');

        var responses = await http.get(url);
        Map<String, dynamic> data =
            (jsonDecode(responses.body) as Map<String, dynamic>)["data"];

        var body = jsonEncode({
          'jumlah': data['jumlah'],
          'status': 1,
        });

        await http.put(
          url,
          headers: headers,
          body: body,
        );
      }
      update();

      if (response.statusCode == 200 && res.statusCode == 200) {
        update();
        showDialog(
          context: Get.context!,
          builder: (context) {
            Future.delayed(const Duration(seconds: 5), () {
              Get.back();
              Get.back();
            });
            return Lottie.asset('assets/success.json');
          },
        );
      } else {
        throw Exception('Gagal Checkout');
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        "Gagal Checkout Barang !!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
