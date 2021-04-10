import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'komposisiaturan.dart';

class Implikasi extends StatefulWidget {
  final List<String> r1;
  final List<String> r2;
  final List<String> r3;
  final List<String> r4;
  final double rules1;
  final double rules2;
  final double rules3;
  final double rules4;
  final List<String> output;

  Implikasi({
    Key? key,
    required this.r1,
    required this.r2,
    required this.r3,
    required this.r4,
    required this.rules1,
    required this.rules2,
    required this.rules3,
    required this.rules4,
    required this.output
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ImplikasiScreenState();
  }
}

class ImplikasiScreenState extends State<Implikasi> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Implikasi'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                TableRow(children: [
                  ColoredBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: new Text(
                        'Rules',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                    ),
                    color: Colors.blue,
                  ),
                  ColoredBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: new Text(
                        'Hasil',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                    ),
                    color: Colors.blue,
                  ),
                  ColoredBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: new Text(
                        widget.r1[4],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                    ),
                    color: Colors.blue,
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('R1')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.rules1.toString())),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.r1[5])),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('R2')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.rules2.toString())),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.r2[5])),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('R3')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.rules3.toString())),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.r3[5])),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('R4')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.rules4.toString())),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.r4[5])),
                  ),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Komposisi komposisi = new Komposisi(widget.output[2], widget.output[4], widget.r1[5], widget.r2[5], widget.r3[5], widget.r4[5], widget.rules1, widget.rules2, widget.rules3, widget.rules4);
                  var komposisiBawah = komposisi.hitungBawah();
                  var komposisiAtas = komposisi.hitungAtas();
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => KomposisiAturan(
                      komposisiAtas: komposisiAtas,
                      komposisiBawah: komposisiBawah,
                      output: widget.output,
                    ),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text('NEXT')),
          ),
        ],
      ),
    );
  }
}

class Komposisi{
  String bbOutput;
  String baOutput;
  String decisionRules1;
  String decisionRules2;
  String decisionRules3;
  String decisionRules4;
  double implikasiRules1;
  double implikasiRules2;
  double implikasiRules3;
  double implikasiRules4;


  Komposisi(this.bbOutput, this.baOutput, this.decisionRules1,
      this.decisionRules2, this.decisionRules3, this.decisionRules4,
      this.implikasiRules1, this.implikasiRules2, this.implikasiRules3,
      this.implikasiRules4);

  hitungBawah(){
    List<double> _bawah = [];

    if(decisionRules1 == bbOutput){
      _bawah.add(implikasiRules1);
    }
    if(decisionRules2 == bbOutput){
      _bawah.add(implikasiRules2);
    }
    if(decisionRules3 == bbOutput){
      _bawah.add(implikasiRules3);
    }
    if(decisionRules4 == bbOutput){
      _bawah.add(implikasiRules4);
    }

    var result = _bawah.reduce(max);
    return result;
  }

  hitungAtas(){
    List<double> _atas = [];

    if(decisionRules1 == baOutput){
      _atas.add(implikasiRules1);
    }
    if(decisionRules2 == baOutput){
      _atas.add(implikasiRules2);
    }
    if(decisionRules3 == baOutput){
      _atas.add(implikasiRules3);
    }
    if(decisionRules4 == baOutput){
      _atas.add(implikasiRules4);
    }

    var result = _atas.reduce(max);
    return result;
  }


}
