import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../models/product_m.dart';

class ProductC extends GetxController {
  TextEditingController? namapC;
  TextEditingController? hargapC;
  TextEditingController? jumlahpC;
  String baseUrl = 'http://10.0.2.2:8000/api';
  ImagePicker? imagePicker;

  XFile? pickedImage;

  void selectImage() async {
    try {
      final dataImage =
          await imagePicker!.pickImage(source: ImageSource.gallery);
      if (dataImage != null) {
        pickedImage = dataImage;
      }
      update();
    } catch (e) {
      pickedImage = null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    imagePicker = ImagePicker();
    namapC = TextEditingController();
    hargapC = TextEditingController();
    jumlahpC = TextEditingController();
  }

  Future<Product?> inputproduk(
    String? namaProduk,
    int? jumlahProduk,
    int? hargaProduk,
    String? imageProduk,
    String? idUser,
  ) async {
    try {
      var url = '$baseUrl/produk';
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'nama_produk': namaProduk,
        'satuan_produk': jumlahProduk,
        'harga_produk': hargaProduk,
        'image': imageProduk,
        'id_user': idUser
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        clearText();
        pickedImage = null;
        update();
        Get.snackbar(
          "Berhasil",
          "Berhasil menambahkan Produk !!",
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
        "Gagal Input Produk !!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    return null;
  }

  @override
  void onClose() {
    namapC?.dispose();
    hargapC?.dispose();
    jumlahpC?.dispose();
    super.onClose();
  }

  void clearText() {
    namapC?.clear();
    hargapC?.clear();
    jumlahpC?.clear();
  }
}
