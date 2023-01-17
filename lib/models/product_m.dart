// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.idUser,
    this.image,
    this.namaProduk,
    this.hargaProduk,
    this.jumlahProduk,
    this.id,
  });

  int? idUser;
  String? image;
  String? namaProduk;
  int? hargaProduk;
  int? jumlahProduk;
  int? id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        idUser: json["id_user"],
        image: json["image"],
        namaProduk: json["nama_produk"],
        hargaProduk: json["harga_produk"],
        jumlahProduk: json["satuan_produk"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "image": image,
        "nama_produk": namaProduk,
        "harga_produk": hargaProduk,
        "satuan_produk": jumlahProduk,
        "id": id,
      };
}
