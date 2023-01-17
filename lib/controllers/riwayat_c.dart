import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/riwayat_m.dart';

class RiwayatC extends GetxController {
  String baseUrls = 'http://10.0.2.2:8000/api/checkout';

  Future<List<Riwayat>?> getRiwayat() async {
    Uri url = Uri.parse(baseUrls);

    var res = await http.get(url);

    List data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    return data.map((e) => Riwayat.fromJson(e)).toList();
  }
}
