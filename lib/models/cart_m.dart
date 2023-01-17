// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  Cart({
    this.id,
    this.idUser,
    this.idProduk,
    this.jumlah,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.namaProduk,
    this.satuanProduk,
    this.hargaProduk,
    this.image,
  });

  int? id;
  int? idUser;
  int? idProduk;
  int? jumlah;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? namaProduk;
  int? satuanProduk;
  int? hargaProduk;
  String? image;

  factory Cart.fromJson(Map<String, dynamic>? json) => Cart(
        id: json?["id"],
        idUser: json?["id_user"],
        idProduk: json?["id_produk"],
        jumlah: json?["jumlah"],
        status: json?["status"],
        createdAt: DateTime.parse(json?["created_at"]),
        updatedAt: DateTime.parse(json?["updated_at"]),
        namaProduk: json?["nama_produk"],
        satuanProduk: json?["satuan_produk"],
        hargaProduk: json?["harga_produk"],
        image: json?["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "jumlah": jumlah,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "nama_produk": namaProduk,
        "satuan_produk": satuanProduk,
        "harga_produk": hargaProduk,
        "image": image,
      };
}
