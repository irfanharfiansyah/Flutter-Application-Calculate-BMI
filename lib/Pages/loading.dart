import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:calculate_bmi/theme.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8FB),
      body: Stack(fit: StackFit.expand, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Loading..",
                style:
                    textA.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(height: 40),
            // Menambahkan animation loading dari package spinKit
            SpinKitWave(
              size: 90,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                      color:
                          index.isEven ? Color(0xFF3E4979) : Colors.blueAccent),
                );
              },
            ),
          ],
        ),
      ]),
    );
  }
}
