import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tokoku/controllers/cart_c.dart';
import 'package:tokoku/controllers/product_c.dart';
import 'package:tokoku/theme.dart';

import '../controllers/mainpage_c.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  int? id;
  String? nama;
  String? harga;
  String? image;
  String? jumlah;
  int? idUser;

  ProductCard({
    super.key,
    this.id,
    this.image,
    this.nama,
    this.jumlah,
    this.harga,
    this.idUser,
  });
  final prodC = Get.find<MainPageC>();
  final productC = Get.find<ProductC>();
  final cartC = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    TextEditingController namapC = TextEditingController(text: nama);
    TextEditingController hargapC = TextEditingController(text: harga);
    TextEditingController jumlahpC = TextEditingController(text: jumlah);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: subTitleColor.withOpacity(0.2),
        ),
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Stack(
        children: [
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(
                  image!,
                )),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            top: -5,
            right: -10,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                ),
              ),
            ),
          ),
          Positioned(
            top: -5,
            right: -8,
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) => Container(
                    height: 100,
                    margin: EdgeInsets.only(
                      top: defaultMargin,
                      left: defaultMargin,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => Center(
                                  child: AlertDialog(
                                title: Text(
                                  "Edit Produk",
                                  style: titleColorTextstyle.copyWith(
                                      fontSize: 16),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama Produk",
                                        style: subTitleColorTextstyle,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: titleColor.withOpacity(0.2),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: namapC,
                                          style: titleColorTextstyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: medium,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: nama,
                                            border: InputBorder.none,
                                            hintStyle:
                                                subTitleColorTextstyle.copyWith(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Jumlah Produk",
                                        style: subTitleColorTextstyle,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: titleColor.withOpacity(0.2),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: jumlahpC,
                                          style: titleColorTextstyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: medium,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: jumlah,
                                            border: InputBorder.none,
                                            hintStyle:
                                                subTitleColorTextstyle.copyWith(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Harga Produk",
                                        style: subTitleColorTextstyle,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: titleColor.withOpacity(0.2),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: hargapC,
                                          style: titleColorTextstyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: medium,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: harga,
                                            border: InputBorder.none,
                                            hintStyle:
                                                subTitleColorTextstyle.copyWith(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Foto Produk",
                                        style: subTitleColorTextstyle,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          productC.selectImage();
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    titleColor.withOpacity(0.2),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    productC.selectImage();
                                                  },
                                                  child: Text(
                                                    'Input Foto',
                                                    style:
                                                        subTitleColorTextstyle,
                                                  ),
                                                ),
                                                GetBuilder<ProductC>(
                                                  builder: (c) => c
                                                              .imagePicker !=
                                                          null
                                                      ? Container(
                                                          height: 100,
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: FileImage(
                                                                  File(
                                                                c.pickedImage
                                                                            ?.length ==
                                                                        null
                                                                    ? image!
                                                                    : c.pickedImage!
                                                                        .path,
                                                              )),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 8.0),
                                                          child: Text(
                                                            'No Image',
                                                            style:
                                                                subTitleColorTextstyle,
                                                          ),
                                                        ),
                                                ),
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      prodC.updateProduk(
                                          namapC.text,
                                          int.parse(jumlahpC.text),
                                          int.parse(hargapC.text),
                                          idUser.toString(),
                                          id.toString(),
                                          productC.pickedImage?.length == null
                                              ? image!
                                              : productC.pickedImage!.path);

                                      Get.back();
                                      Get.back();
                                    },
                                    child: Text(
                                      "Simpan",
                                      style: subTitleColorTextstyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "Close",
                                      style: titleColorTextstyle,
                                    ),
                                  )
                                ],
                              )),
                            );
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.edit),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Edit Produk",
                                style: titleColorTextstyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Center(
                                    child: Text(
                                      'Hapus',
                                      style: titleColorTextstyle.copyWith(
                                        fontWeight: medium,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  content: Text(
                                    'Apakah anda yakin untuk menghapus ?',
                                    style: subTitleColorTextstyle,
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            prodC.deleteProduct(id!.toString());
                                            Get.back();
                                          },
                                          child: Text(
                                            "ya",
                                            style: titleColorTextstyle.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            Get.back();
                                            Get.back();
                                          },
                                          child: Text(
                                            "tidak",
                                            style:
                                                titleColorTextstyle.copyWith(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: primaryColor),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Hapus Produk",
                                style: titleColorTextstyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.more_vert,
                color: titleColor,
              ),
            ),
          ),
          Positioned(
            top: 90,
            bottom: 0,
            child: Container(
              height: 110,
              width: 159,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, -10),
                    color: titleColor.withOpacity(0.15),
                  )
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    nama!.toUpperCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: titleColorTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                        .format(int.parse(" ${harga.toString()}")),
                    style: subTitleColorTextstyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green[400],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                        InkWell(
                          onTap: () {
                            cartC.inputCart(
                              id.toString(),
                              0,
                              1,
                              idUser.toString(),
                            );
                          },
                          child: Text(
                            "Add to cart",
                            style: titleColorTextstyle.copyWith(
                              color: Colors.white,
                              fontWeight: medium,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget namaBarang() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Nama Barang',
        style: titleColorTextstyle.copyWith(
          fontWeight: medium,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: titleColor.withOpacity(0.2),
          ),
        ),
        child: TextFormField(
          // controller: prodC.namapC,
          style: titleColorTextstyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
          decoration: InputDecoration(
            hintText: 'Nama Barang',
            border: InputBorder.none,
            hintStyle: subTitleColorTextstyle.copyWith(
              fontSize: 16,
            ),
          ),
        ),
      )
    ],
  );
}
