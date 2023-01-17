import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tokoku/theme.dart';

import '../controllers/cart_c.dart';

// ignore: must_be_immutable
class CartProduk extends StatelessWidget {
  CartProduk({
    super.key,
    this.id,
    this.nama,
    this.jumlah,
    this.harga,
    this.image,
  });

  int? id;
  String? nama;
  int? jumlah;
  String? harga;
  String? image;

  final cartC = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: subTitleColor.withOpacity(0.2),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -7,
            right: -6,
            child: IconButton(
              onPressed: () {
                cartC.deleteCart(
                  id!.toString(),
                );
              },
              icon: const Icon(
                Icons.close,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10,
              top: 10,
            ),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(
                        File(image!),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nama!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: titleColorTextstyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                            .format(int.parse(" ${harga!}")),
                        style: subTitleColorTextstyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: subTitleColor.withOpacity(0.2),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          cartC.decrement(id!.toInt());
                        },
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      jumlah.toString(),
                      style: titleColorTextstyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: subTitleColor.withOpacity(0.2),
                        ),
                        color: orangeColor,
                      ),
                      child: InkWell(
                        onTap: () {
                          cartC.increment(id!.toInt());
                        },
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: greyColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
