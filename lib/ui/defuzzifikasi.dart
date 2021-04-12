import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_fuzzy_lib/my_fuzzy_lib.dart';

class Defuzzifikasi extends StatefulWidget {
  final double komposisiBawah;
  final double komposisiAtas;
  final List<String> output;

  Defuzzifikasi(
      {Key? key,
      required this.komposisiAtas,
      required this.komposisiBawah,
      required this.output})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DefuzzifikasiScreenState();
  }
}

class DefuzzifikasiScreenState extends State<Defuzzifikasi> {
  TextEditingController _nController = TextEditingController();
  double? hasil;
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Defuzzifikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(
              child: TextField(
                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Jumlah Angka Random',
                ),
                controller: _nController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  int sigmaBawah = 0;
                  int sigmaAtas = 0;
                  Random random = new Random();
                  for (var i = 0; i < int.parse(_nController.text); i++) {
                    var _randomBawah = random.nextInt(
                            int.parse(widget.output[5]) -
                                int.parse(widget.output[3])) +
                        int.parse(widget.output[3]);
                    var _randomAtas = random.nextInt(
                            int.parse(widget.output[5]) -
                                int.parse(widget.output[3])) +
                        int.parse(widget.output[3]);
                    sigmaBawah = sigmaBawah + _randomBawah;
                    sigmaAtas = sigmaAtas + _randomAtas;
                  }

                  Centroid centroid = new Centroid(
                      sigmaBawah,
                      sigmaAtas,
                      widget.komposisiBawah,
                      widget.komposisiAtas,
                      int.parse(_nController.text),
                      int.parse(_nController.text));
                  setState(() {
                    hasil = centroid.hitungCentroid();
                    _isVisible = true;
                  });
                },
                child: Text('Hitung'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Visibility(
                  visible: _isVisible,
                  child: Text(
                    'Jadi ${widget.output[0]} yang diperlukan sebanyak ${hasil?.toStringAsFixed(3)} ${widget.output[6]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
