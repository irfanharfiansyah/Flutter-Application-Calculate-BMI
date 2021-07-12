import 'package:calculate_bmi/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Result extends StatelessWidget {
  Result({@required this.height, this.weight});
  final double height;
  final double weight;
  @override
  Widget build(BuildContext context) {
    // rumus penghitung BMI
    double bmi = weight / pow(height / 100, 2);
    String hasil;

    // Menggunakan pengkondisian sesuai output nantinya
    if (bmi >= 28) {
      hasil = "Obese";
    } else if (bmi >= 23) {
      hasil = "Overweight";
    } else if (bmi >= 17.5) {
      hasil = "Normal";
    } else {
      hasil = "Underweight";
    }
    return Scaffold(
      body: Stack(
        children: [
          // Menambahkan background image
          Container(
            height: 900,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/cloud.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo1.png'))),
                ),
                Text(
                  "RESULT",
                  style: textA.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white54),
                ),
                SizedBox(height: 100),
                // Menampilkan status hasil perhitungan
                Text(
                  hasil,
                  style: textA.copyWith(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                // Menampilkan hasil perhitungan
                Text(
                  bmi.toStringAsFixed(1),
                  style: textB.copyWith(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
                Text(
                  'Normal BMI Range',
                  style: textA.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '17,5 -  22.9 ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Menambahklan sebuah button dengan posisi bottom untuk kembali ke halaman sebelumnya
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        child: RaisedButton(
          color: blue1,
          child: Text(
            'BACK TO CALCULATE',
            style: textA.copyWith(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
