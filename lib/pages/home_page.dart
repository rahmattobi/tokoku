import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tokoku/controllers/mainpage_c.dart';
import 'package:tokoku/models/product_m.dart';
import 'package:tokoku/models/user_m.dart';

import 'package:tokoku/theme.dart';
import 'package:tokoku/widgets/empty_produk.dart';
import 'package:tokoku/widgets/produk_card.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserModel user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 50,
          bottom: 20,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name!,
                    style: titleColorTextstyle.copyWith(
                      fontSize: 22,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Selamat Datang di Tokoku',
                    style: titleColorTextstyle,
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/ic_man.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget search() {
      return Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: 60,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: titleColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                style: titleColorTextstyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  hintText: 'Cari Produk',
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

    Widget titleproduk() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Text(
          'Produk Tokoku',
          style: titleColorTextstyle.copyWith(
            fontWeight: bold,
            fontSize: 22,
          ),
        ),
      );
    }

    Widget produk() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: GetBuilder<MainPageC>(
          builder: (c) {
            return FutureBuilder<List<Product>?>(
              future: c.getAllProduct(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.data!.isEmpty) {
                  return const EmptyProduk();
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 220,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Product product = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) => Container(
                            height: height,
                            margin: EdgeInsets.only(
                              top: defaultMargin,
                              left: defaultMargin,
                              right: defaultMargin,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: FileImage(
                                          File(product.image.toString())),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      product.namaProduk!.toUpperCase(),
                                      style: titleColorTextstyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: bold,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'id_ID', symbol: 'Rp ')
                                          .format(int.parse(
                                              " ${product.hargaProduk.toString()}")),
                                      style: primTextstyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    Text(
                                      'Jumlah Barang ${product.jumlahProduk} Bh',
                                      style: titleColorTextstyle.copyWith(
                                        fontWeight: light,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Add to cart',
                                                style: subTitleColorTextstyle
                                                    .copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      child: user.id == product.idUser
                          ? ProductCard(
                              id: product.id,
                              image: product.image!,
                              nama: product.namaProduk,
                              jumlah: product.jumlahProduk.toString(),
                              harga: product.hargaProduk.toString(),
                              idUser: user.id,
                            )
                          : Container(),
                    );
                  },
                );
              },
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: greyColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          search(),
          titleproduk(),
          Expanded(
            child: produk(),
          ),
        ],
      ),
    );
  }
}
