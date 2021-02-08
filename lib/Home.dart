import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";
  void _calcular(){

    double precoAlcool = double.tryParse( _controllerAlcool.text );
    double precoGasolina = double.tryParse( _controllerGasolina.text );
    if( precoAlcool == null || precoGasolina == null ){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando ponto ao invés de virgula";
      });
    }else{
      if((precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.deepOrange,
        body: Container(alignment: Alignment(0.0, 0.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green[300],Colors.white, Colors.deepOrange[300]])),
              child: Container(
                padding: EdgeInsets.all(32),
                child: SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
                        child: Image.asset("Images/Gasolinepump.png"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Saiba qual é a melhor opção para abastecer o seu carro",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Preço Alcool, ex: 1.59"
                        ),
                        style: TextStyle(
                            fontSize: 22
                        ),
                        controller: _controllerAlcool,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Preço Gasolina, ex: 3.99"
                        ),
                        style: TextStyle(
                            fontSize: 22
                        ),
                        controller: _controllerGasolina,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:10),
                        child: RaisedButton(
                          color: Colors.black45,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Calcular",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: _calcular,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          _textoResultado,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
           );
  }
}