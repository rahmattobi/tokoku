import 'package:flutter/material.dart';
import 'package:tokoku/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ic_emptycart.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Keranjang Belanja kosong \n Silahkan Order terlebih dahulu',
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
