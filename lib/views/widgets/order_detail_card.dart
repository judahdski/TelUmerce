import 'package:flutter/material.dart';

import '../../const/text_theme.dart';



class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
        //  Detail pesanan
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Detail Pesanan', style: titleSmall),
                const SizedBox(height: 14.0),
                Column(
                  children: [

                  //  Nama barang + harganya
                    //  bisa pake column klo barangnya lebih dari 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                      //  Nama barang
                        Text('Tumbler', style: titleSmall),
                        //Harga barang
                        Text('Rp25.000', style: labelMedium),
                      ],
                    ),

                  // DIVIDER
                    const Divider(height: 24.0),
                  //  END DIVIDER

                  //  Total harga barang
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                      //  label
                        Text('Harga produk', style: bodySmall),
                      //  Total harga
                        Text('Rp25.000', style: labelMedium),
                      ],
                    ),

                    const SizedBox(height: 6.0),

                    //  Ongkos kirim
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        //  label
                        Text('Ongkos kirim', style: bodySmall),
                        //  Ongkos kirim
                        Text('Rp5.500', style: labelMedium),
                      ],
                    ),

                    // DIVIDER
                    const Divider(height: 24.0),
                    //  END DIVIDER

                  //  total bayar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        //label
                        Text('Total harga', style: labelMedium),
                        // total keseluruhan harga
                        Text('Rp.29.500', style: totalBayar)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        const Divider(color: Color(0xfff2f2f2), thickness: 6.0,height: 6.0),
        //  Detail pengiriman
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Detail Pengiriman', style: titleSmall),
                const SizedBox(height: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                  //  label
                    Text('Alamat penerima', style: labelSmall),
                    SizedBox(height: 8.0),
                    //  alamat user
                    Text('Komplek Graha Santika Blok C1 No.15, Jatiluhur, Jati Asih, Bekasi', style: alamatUser)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}