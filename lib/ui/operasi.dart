import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuzzy/ui/implikasi.dart';

class Operasi extends StatefulWidget {
  final List<String> input1;
  final List<String> input2;
  final List<String> output;
  final List<String> r1;
  final List<String> r2;
  final List<String> r3;
  final List<String> r4;
  final String mikroAtas1;
  final String mikroAtas2;
  final String mikroBawah1;
  final String mikroBawah2;

  Operasi({
    Key? key,
    required this.input1,
    required this.input2,
    required this.output,
    required this.r1,
    required this.r2,
    required this.r3,
    required this.r4,
    required this.mikroAtas1,
    required this.mikroAtas2,
    required this.mikroBawah1,
    required this.mikroBawah2,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OperasiScreenState();
  }
}

class OperasiScreenState extends State<Operasi> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    OperasiFuzzy operasiFuzzy1 = new OperasiFuzzy(
        widget.r1[1],
        widget.r1[3],
        widget.r1[5],
        widget.input1[2],
        widget.input1[4],
        double.parse(widget.mikroBawah1),
        double.parse(widget.mikroAtas1),
        widget.input2[2],
        widget.input2[4],
        double.parse(widget.mikroBawah2),
        double.parse(widget.mikroAtas2));
    OperasiFuzzy operasiFuzzy2 = new OperasiFuzzy(
        widget.r2[1],
        widget.r2[3],
        widget.r2[5],
        widget.input1[2],
        widget.input1[4],
        double.parse(widget.mikroBawah1),
        double.parse(widget.mikroAtas1),
        widget.input2[2],
        widget.input2[4],
        double.parse(widget.mikroBawah2),
        double.parse(widget.mikroAtas2));
    OperasiFuzzy operasiFuzzy3 = new OperasiFuzzy(
        widget.r3[1],
        widget.r3[3],
        widget.r3[5],
        widget.input1[2],
        widget.input1[4],
        double.parse(widget.mikroBawah1),
        double.parse(widget.mikroAtas1),
        widget.input2[2],
        widget.input2[4],
        double.parse(widget.mikroBawah2),
        double.parse(widget.mikroAtas2));
    OperasiFuzzy operasiFuzzy4 = new OperasiFuzzy(
        widget.r4[1],
        widget.r4[3],
        widget.r4[5],
        widget.input1[2],
        widget.input1[4],
        double.parse(widget.mikroBawah1),
        double.parse(widget.mikroAtas1),
        widget.input2[2],
        widget.input2[4],
        double.parse(widget.mikroBawah2),
        double.parse(widget.mikroAtas2));

    var rules1 = operasiFuzzy1.Hitung();
    var rules2 = operasiFuzzy2.Hitung();
    var rules3 = operasiFuzzy3.Hitung();
    var rules4 = operasiFuzzy4.Hitung();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Operasi Fuzzy'),
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
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('R1')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(rules1.toString())),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('R2')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(rules2.toString())),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('R3')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(rules3.toString())),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('R4')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(rules4.toString())),
                  )
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => Implikasi(
                      r1: widget.r1,
                      r2: widget.r2,
                      r3: widget.r3,
                      r4: widget.r4,
                      rules1: rules1,
                      rules2: rules2,
                      rules3: rules3,
                      rules4: rules4,
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

class OperasiFuzzy {
  String decision1;
  String decision2;
  String decision3;
  String bbInput1;
  String baInput1;
  double bbMikroInput1;
  double baMikroInput1;
  String bbInput2;
  String baInput2;
  double bbMikroInput2;
  double baMikroInput2;

  OperasiFuzzy(
      this.decision1,
      this.decision2,
      this.decision3,
      this.bbInput1,
      this.baInput1,
      this.bbMikroInput1,
      this.baMikroInput1,
      this.bbInput2,
      this.baInput2,
      this.bbMikroInput2,
      this.baMikroInput2);

  Hitung() {
    var result;
    List<double> _value = [];
    if (decision1 == bbInput1 && decision2 == baInput2) {
      _value = [bbMikroInput1, baMikroInput2];
      result = _value.reduce(min);
    } else if (decision1 == bbInput1 && decision2 == bbInput2) {
      _value = [bbMikroInput1, bbMikroInput2];
      result = _value.reduce(min);
    } else if (decision1 == baInput1 && decision2 == baInput2) {
      _value = [baMikroInput1, baMikroInput2];
      result = _value.reduce(min);
    } else if (decision1 == baInput1 && decision2 == bbInput2) {
      _value = [baMikroInput1, bbMikroInput2];
      result = _value.reduce(min);
    }

    return result;
  }
}
