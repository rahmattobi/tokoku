import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tokoku/controllers/riwayat_c.dart';
import 'package:tokoku/models/riwayat_m.dart';
import 'package:tokoku/theme.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: 18,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          children: [
            // const Icon(Icons.arrow_back),
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                'Riwayat Pembelian',
                style: titleColorTextstyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin - 10,
          right: defaultMargin - 10,
        ),
        child: GetBuilder<RiwayatC>(
          builder: (c) {
            return FutureBuilder<List<Riwayat>?>(
              future: c.getRiwayat(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('data Kosong'),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Riwayat riwayat = snapshot.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Center(
                          child: Text('${index + 1}'),
                        ),
                      ),
                      title: Text(
                        riwayat.namaProduk.toString(),
                        style: titleColorTextstyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      subtitle: Text(
                          "Jumlah Barang ${riwayat.jumlah.toString()}",
                          style: subTitleColorTextstyle,),
                      trailing: Text(
                        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                            .format(int.parse(
                                " ${riwayat.hargaProduk.toString()}")),
                        style: subTitleColorTextstyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
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
      body: Column(
        children: [
          header(),
          Expanded(
            child: content(),
          ),
        ],
      ),
    );
  }
}
