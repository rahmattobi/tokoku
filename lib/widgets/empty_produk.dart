import 'package:flutter/material.dart';
import 'package:tokoku/theme.dart';

class EmptyProduk extends StatelessWidget {
  const EmptyProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ic_emptylist.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Produk kosong, Silahkan inputkan terlebih dahulu',
            style: subTitleColorTextstyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
