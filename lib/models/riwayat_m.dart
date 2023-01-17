class Riwayat {
  int? id;
  int? idUser;
  int? idProduk;
  int? jumlah;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? totalH;
  int? totalB;
  String? namaProduk;
  int? hargaProduk;
  String? image;
  int? satuanProduk;

  Riwayat(
      {this.id,
      this.idUser,
      this.idProduk,
      this.jumlah,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.totalH,
      this.totalB,
      this.namaProduk,
      this.hargaProduk,
      this.image,
      this.satuanProduk});

  Riwayat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    idProduk = json['id_produk'];
    jumlah = json['jumlah'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalH = json['TotalH'];
    totalB = json['TotalB'];
    namaProduk = json['nama_produk'];
    hargaProduk = json['harga_produk'];
    image = json['image'];
    satuanProduk = json['satuan_produk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_user'] = idUser;
    data['id_produk'] = idProduk;
    data['jumlah'] = jumlah;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['TotalH'] = totalH;
    data['TotalB'] = totalB;
    data['nama_produk'] = namaProduk;
    data['harga_produk'] = hargaProduk;
    data['image'] = image;
    data['satuan_produk'] = satuanProduk;
    return data;
  }
}
