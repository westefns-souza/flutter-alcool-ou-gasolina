import 'package:flutter/material.dart';
import 'package:flutter_alcool_ou_gasolina/widgets/logo.widget.dart';
import 'package:flutter_alcool_ou_gasolina/widgets/submit-form.widget.dart';
import 'package:flutter_alcool_ou_gasolina/widgets/success.widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: [
          Logo(),
          _completed
              ? Success(
                  reset: reset,
                  result: _resultText,
                )
              : SubmitForm(
                  alcCtrl: _alcCtrl,
                  gasCtrl: _gasCtrl,
                  submitFunc: calculate,
                  busy: _busy,
                ),
        ],
      ),
    );
  }

  Future calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina!";
        } else {
          _resultText = "Compensa utilizar álcool";
        }

        _completed = true;
        _busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _gasCtrl = new MoneyMaskedTextController();
      _alcCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
