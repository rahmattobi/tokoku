import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokoku/controllers/product_c.dart';
import 'package:tokoku/models/user_m.dart';
import 'package:tokoku/theme.dart';

// ignore: must_be_immutable
class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final productC = Get.find<ProductC>();
  UserModel user = Get.arguments;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        child: Text(
          'Input Data Produk',
          style: titleColorTextstyle.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget namaProduk() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Produk',
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
                controller: productC.namapC,
                style: titleColorTextstyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  hintText: 'Nama Produk',
                  border: InputBorder.none,
                  hintStyle: subTitleColorTextstyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget satuanProduk() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Satuan Produk',
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
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: productC.jumlahpC,
                style: titleColorTextstyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  hintText: 'Satuan Produk',
                  border: InputBorder.none,
                  hintStyle: subTitleColorTextstyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget hargaProduk() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Harga Produk',
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
                controller: productC.hargapC,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: titleColorTextstyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  hintText: 'Harga Produk',
                  border: InputBorder.none,
                  hintStyle: subTitleColorTextstyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget gambarProduk() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foto Produk',
              style: titleColorTextstyle.copyWith(
                fontWeight: medium,
              ),
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
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: titleColor.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          productC.selectImage();
                        },
                        child: Text(
                          'Input Foto',
                          style: subTitleColorTextstyle,
                        ),
                      ),
                      GetBuilder<ProductC>(
                        builder: (c) => c.pickedImage != null
                            ? Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                      File(productC.pickedImage!.path),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'No Image',
                                  style: subTitleColorTextstyle,
                                ),
                              ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      );
    }

    Widget submitButton() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        height: 60,
        decoration: BoxDecoration(
          color: orangeColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton(
          onPressed: () {
            if (productC.pickedImage?.length != null &&
                productC.namapC!.text != '' &&
                productC.hargapC!.text != '' &&
                productC.jumlahpC!.text != '') {
              productC.inputproduk(
                  productC.namapC!.text,
                  int.parse(productC.jumlahpC!.text),
                  int.parse(productC.hargapC!.text),
                  productC.pickedImage!.path,
                  user.id.toString());
            } else {
              Get.snackbar(
                "Error",
                "Inputan Tidak boleh Kosong !!",
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          },
          child: Center(
            child: Text(
              'INPUT PRODUK',
              style: subTitleColorTextstyle.copyWith(
                fontWeight: bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: greyColor,
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          header(),
          namaProduk(),
          satuanProduk(),
          hargaProduk(),
          gambarProduk(),
          submitButton(),
        ],
      ),
    );
  }
}
