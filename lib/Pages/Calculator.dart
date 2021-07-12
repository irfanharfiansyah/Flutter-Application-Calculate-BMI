import 'package:calculate_bmi/Pages/result.dart';
import 'package:calculate_bmi/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'loading.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int nilai = 0;
  double getHeight = 0;
  double getWeight = 0;
  bool loading = false;

//Method sebagai perubahan kondisi nilai index pada button saat di tombol
  void changeIndex(int index) {
    setState(() {
      nilai = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Menambahkan sebuah kondisi jika loading true maka akan tampil loading jika false maka langsung tampil kondisi pada scaffold
    return loading
        ? Loading()
        : Container(
            child: Scaffold(
              backgroundColor: Color(0xffF7F8FB),
              resizeToAvoidBottomInset: false,
              resizeToAvoidBottomPadding: false,

              // Menambahkan sebuah App bar dengan Title dan Icon
              appBar: AppBar(
                leading: Icon(Icons.calculate_outlined, color: Colors.white54),
                title: Text(
                  "BMI Calculator",
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white54),
                ),
                backgroundColor: blue1,
                elevation: 0,
                //Menambahkan Button icon
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black26,
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Menambahkan sebuah logo dan text
                            Container(
                                margin: EdgeInsets.only(bottom: 20, top: 20),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/logo1.png')))),
                            //  Menambahkan text di bawah logo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Know Your",
                                  style: textB.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  "BMI",
                                  style: textB.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ]),
                      SizedBox(
                        height: 70,
                      ),
                      // Menambahkan button pilihan gender
                      Row(
                        children: [
                          radioButton("Man", Colors.blue[400], 0),
                          Container(
                            width: 60,
                            height: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/gender.png'))),
                          ),
                          radioButton("Woman", Colors.pink[400], 1),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Your Height",
                        style: textA.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10),
                      // Menambahkan sebuah Text input number untuk tinggi
                      TextField(
                        onChanged: (txt) {
                          setState(() {
                            getHeight = double.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Height",
                          suffix: Text(
                            "Cm",
                            style: textA.copyWith(fontSize: 15),
                          ),
                          hintStyle: TextStyle(fontSize: 10),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      // Menambahkan sebuah Text input number untuk Berat
                      Text(
                        "Your Weight",
                        style: textA.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (txt) {
                          setState(() {
                            getWeight = double.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Weight",
                          suffix: Text(
                            "Kg",
                            style: textA.copyWith(fontSize: 15),
                          ),
                          hintStyle: TextStyle(fontSize: 10),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      // Menambahkan button calculate output
                      Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        margin: EdgeInsets.only(top: 70),
                        child: ButtonTheme(
                          minWidth: double.infinity,
                          height: 80,
                          child: RaisedButton(
                            onPressed: () {
                              // jika button di click maka akan mengubah kondisi variabel loading menjadi true
                              setState(() => loading = true);
                              // Menambahkan waktu tampilnya animation loading dengan waktu 3 detik setelah itu kondisi variabel loading kembali false
                              Future.delayed(Duration(milliseconds: 3000), () {
                                setState(() {
                                  loading = false;
                                });
                              });
                              // menambahkan navigator untuk berpindah halaman pada halaman result
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Result(
                                      height: getHeight, weight: getWeight),
                                ),
                              );
                            },
                            // styling dari button
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Color(0xFF3E4979),
                            child: Text("Calculate",
                                style: textA.copyWith(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 3)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  // Widget Button untuk memilih jenis kelamin
  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          height: 80,
          child: FlatButton(
            //Fungsi untuk perubahan warna button sesuai kondisi nilai index
            color: nilai == index ? color : Colors.grey[200],

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onPressed: () {
              changeIndex(index);
            },

            child: Text(value,
                style: textA.copyWith(
                    //Fungsi untuk perubahan warna tulisan pada button sesuai kondisi nilai index
                    color: nilai == index ? Colors.white : color,
                    fontSize: 19,
                    fontWeight: FontWeight.bold)),
          )),
    );
  }
}
// karya cipta 2. panduan
