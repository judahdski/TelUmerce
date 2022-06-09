import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/text_theme.dart';

class TimeCounter extends StatefulWidget {
  const TimeCounter({Key? key}) : super(key: key);

  static const maxTime = 59;

  @override
  State<TimeCounter> createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  //style
  final TextStyle timeLabel = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w600, color: Color(0xffe83232));

  //variable
  int minutes = TimeCounter.maxTime;
  int seconds = TimeCounter.maxTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        if (minutes > 0) {
          setState(() {
            minutes--;
            seconds = TimeCounter.maxTime;
          });
        } else {
          timesUp();
        }
      }
    });
  }

  void timesUp() {
    timer?.cancel();

    //  do something..
    if (kDebugMode) {
      print('status pesanan berubah jadi dibatalkan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      smallMobile: Container(
        padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 10.0),
        margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(1, 2),
                  blurRadius: 6.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Batas Akhir Pembayaran', style: bodySmall),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Minggu, 15 Mei 2022 20:37', style: labelMedium),
                Text(
                    '00:${(minutes < 10) ? '0$minutes' : minutes}:${(seconds < 10) ? '0$seconds' : seconds}',
                    style: timeLabel),
              ],
            )
          ],
        ),
      ),
      mediumMobile: Container(
        padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 12.0),
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(1, 2),
                  blurRadius: 6.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Batas Akhir Pembayaran', style: bodyMedium),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Minggu, 15 Mei 2022 20:37', style: labelLarge),
                Text(
                    '00:${(minutes < 10) ? '0$minutes' : minutes} : ${(seconds < 10) ? '0$seconds' : seconds}',
                    style: timeLabel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
