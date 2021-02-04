import 'package:flutter/material.dart';
import 'package:flutter_alcool_ou_gasolina/widgets/input.widget.dart';
import 'package:flutter_alcool_ou_gasolina/widgets/loading-button.widget.dart';
import 'package:flutter_alcool_ou_gasolina/widgets/logo.widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: [
          Logo(),
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Compensa utilizar álcool",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40,
                    fontFamily: "Big Shoulders Display",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                LoadingButton(
                  busy: false,
                  func: () {},
                  text: "CALCULAR NOVAMENTE",
                  invert: true,
                ),
              ],
            ),
          ),
          Input(
            label: "Gasolina",
            ctrl: _gasCtrl,
          ),
          Input(
            label: "Álcool",
            ctrl: _alcCtrl,
          ),
          LoadingButton(
            busy: true,
            func: () {},
            text: "CALCULAR",
            invert: false,
          ),
        ],
      ),
    );
  }
}
