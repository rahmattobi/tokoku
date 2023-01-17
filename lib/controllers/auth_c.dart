import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/user_m.dart';
import '../routes/route_name.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> registKey = GlobalKey<FormState>();
  TextEditingController? nameC;
  TextEditingController? passC;
  TextEditingController? emailC;

  String baseUrl = 'http://10.0.2.2:8000/api/auth';
  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    passC = TextEditingController();
    emailC = TextEditingController();
  }

  String? validatedEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Format email tidak valid !!";
    }
    return null;
  }

  // String? validatedPassword(String value) {
  //   if (value.length <= 6) {
  //     return "Password harus lebih dari 6 Character";
  //   }
  //   return null;
  // }

  void checkRegister() {
    final isValid = registKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      registKey.currentState!.save();
    }
  }

  Future<void> login(
    String? email,
    String? password,
  ) async {
    try {
      var url = '$baseUrl/login';
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'email': email,
        'password': password,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        UserModel user = UserModel.fromJson(data);
        Get.offAndToNamed(RouteNames.mainPage, arguments: user);
      } else {
        throw Exception('Gagal Login');
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        "Gagal Login !!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> register(
    String? name,
    String? email,
    String? password,
  ) async {
    try {
      var url = '$baseUrl/register';
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      // print(response.body);

      if (response.statusCode == 200) {
        Get.snackbar(
          "Berhasil",
          "Berhasil Login !!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAndToNamed(RouteNames.loginPage);
      } else {
        throw Exception('Gagal Register');
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Gagal Register'),
            contentPadding: const EdgeInsets.all(20),
            children: [
              Text(
                e.toString(),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void onClose() {
    nameC!.dispose();
    passC!.dispose();
    emailC!.dispose();
    super.onClose();
  }
}
