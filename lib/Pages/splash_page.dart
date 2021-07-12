import 'package:flutter/material.dart';
import 'package:calculate_bmi/Pages/Calculator.dart';
import '../theme.dart';

class SplashPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Menambahkan image logo
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/logo1.png'))),
          ),
          SizedBox(height: 10),
          Text("Calculator",
              style: textB.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic)),
          SizedBox(height: 70),
          // Menambahkan asset image
          Container(
            width: 270,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bmi2.png'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Calculate Your',
                style:
                    textA.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 4,
              ),
              Text("BMI",
                  style: textA.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            'Find out your body mass index\n based on your height and weight',
            textAlign: TextAlign.center,
            style: textA.copyWith(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(
            height: 120,
          ),
          Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: ButtonTheme(
              height: 60,
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  // Ketika button di klik pergi ke halaman Calculator
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiCalculator(),
                    ),
                  );
                },
                // Menjadikan button terdapat border radius
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0xFF3E4979),
                child: Text("Get Started",
                    style: textA.copyWith(fontSize: 25, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
