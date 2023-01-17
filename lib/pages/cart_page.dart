import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:tokoku/controllers/cart_c.dart';
import 'package:tokoku/models/cart_m.dart';
import 'package:tokoku/theme.dart';
import 'package:tokoku/widgets/empty_cart.dart';
import '../widgets/cart_produk.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List<String?> listJmlBarang = [];
    List<String?> listTotHarga = [];
    var cartC = Get.find<CartController>();
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
          bottom: 20,
        ),
        child: Text(
          'Keranjang Belanja',
          style: titleColorTextstyle.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        height: height * 0.50,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: GetBuilder<CartController>(
          builder: (c) {
            return FutureBuilder<List<Cart>?>(
              future: c.getAllCart(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData) {
                  return const EmptyCart();
                }
                if (snapshot.data!.isEmpty) {
                  return const EmptyCart();
                }

                for (var i = 0; i < snapshot.data!.length; i++) {
                  Cart data = snapshot.data![i];
                  listJmlBarang.add(data.jumlah.toString());
                }
                if (listJmlBarang.isNotEmpty) {
                  listJmlBarang.clear();
                  listTotHarga.clear();
                  for (var i = 0; i < snapshot.data!.length; i++) {
                    Cart data = snapshot.data![i];
                    // total barang
                    listJmlBarang.add(data.jumlah.toString());
                    // total harga
                    var totHargaBarang = data.jumlah! * data.hargaProduk!;
                    listTotHarga.add(totHargaBarang.toString());
                  }
                  // menambahkan semua list jumlah barang

                  c.totBarang = listJmlBarang.fold(
                    0,
                    (p, c) =>
                        int.parse(p.toString()) +
                        int.parse(
                          c.toString(),
                        ),
                  );

                  // menambahkan semua list harga
                  c.totHarga = listTotHarga.fold(
                    0,
                    (p, c) =>
                        int.parse(p.toString()) +
                        int.parse(
                          c.toString(),
                        ),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Cart cart = snapshot.data![index];
                    return CartProduk(
                      id: cart.id,
                      nama: cart.namaProduk,
                      jumlah: cart.jumlah,
                      harga: cart.hargaProduk.toString(),
                      image: cart.image,
                    );
                  },
                );
              },
            );
          },
        ),
      );
    }

    Widget billDetails() {
      return Container(
        margin: EdgeInsets.only(
          right: defaultMargin,
          left: defaultMargin,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: GetBuilder<CartController>(
          builder: (c) {
            return FutureBuilder<List<Cart>?>(
                future: c.getAllCart(),
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tagihan Belanja',
                        style: titleColorTextstyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Total Barang',
                            style: subTitleColorTextstyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                          )),
                          Text(
                            snapshot.data == null || snapshot.data!.isEmpty
                                ? 0.toString()
                                : '${c.totBarang.toString()} Buah',
                            style: titleColorTextstyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Total Harga',
                            style: subTitleColorTextstyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                          )),
                          Text(
                            snapshot.data == null || snapshot.data!.isEmpty
                                ? 0.toString()
                                : c.totHarga.toString(),
                            style: titleColorTextstyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Total',
                              style: primTextstyle.copyWith(
                                fontWeight: bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            snapshot.data == null || snapshot.data!.isEmpty
                                ? 0.toString()
                                : c.totHarga.toString(),
                            style: primTextstyle.copyWith(
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: defaultMargin,
                        ),
                        height: 60,
                        decoration: BoxDecoration(
                          color: orangeColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            snapshot.data == null || snapshot.data!.isEmpty
                                ? Get.snackbar(
                                    "Gagal",
                                    "Keranjang Belanja Kosong !!",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  )
                                : showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0),
                                      ),
                                    ),
                                    builder: (context) => Container(
                                      height: 150,
                                      margin: EdgeInsets.only(
                                        top: defaultMargin,
                                        left: defaultMargin,
                                        right: defaultMargin,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Anda Yakin Untuk Checkout ?',
                                            style: titleColorTextstyle.copyWith(
                                                fontSize: 18,
                                                fontWeight: semiBold),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          ConfirmationSlider(
                                            text: 'Slide untuk Checkout',
                                            foregroundColor: primaryColor,
                                            backgroundColorEnd: primaryColor,
                                            onConfirmation: () {
                                              cartC.checkout(
                                                c.totBarang,
                                                c.totHarga,
                                              );
                                              // cartC.updateCart();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                          },
                          child: Center(
                            child: Text(
                              'CHECKOUT',
                              style: subTitleColorTextstyle.copyWith(
                                fontWeight: bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: greyColor,
      body: ListView(
        children: [
          header(),
          content(),
          billDetails(),
        ],
      ),
    );
  }
}
