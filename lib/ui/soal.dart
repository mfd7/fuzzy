import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuzzy/ui/fuzzifikasi.dart';
import 'package:my_fuzzy_lib/my_fuzzy_lib.dart';

class Soal extends StatefulWidget {
  final List<String> input1;
  final List<String> input2;
  final List<String> output;
  final List<String> r1;
  final List<String> r2;
  final List<String> r3;
  final List<String> r4;

  Soal(
      {Key? key,
      required this.input1,
      required this.input2,
      required this.output,
      required this.r1,
      required this.r2,
      required this.r3,
      required this.r4})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new SoalScreenState();
  }
}

class SoalScreenState extends State<Soal> {
  List<TextEditingController> _variable = [];
  TextEditingController _soal1 = TextEditingController();
  TextEditingController _soal2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    for (var i = 0; i < 3; i++) {
      _variable.add(new TextEditingController());
    }
    _variable[0].text = widget.input1[0];
    _variable[1].text = widget.input2[0];
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Soal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              childAspectRatio: 16/9,
              children: [
                Center(
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    readOnly: true,
                    controller: _variable[0],
                  ),
                ),
                Center(
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: _soal1,
                  ),
                ),
              ],
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              childAspectRatio: 16/9,
              children: [
                Center(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: _variable[1],
                  ),
                ),
                Center(
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: _soal2,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    var per1 = new Perhitungan(int.parse(widget.input1[5]),
                        int.parse(widget.input1[3]), int.parse(_soal1.text));
                    var mikroBawah1 = per1.generatemikroBawah(
                        per1.bainput, per1.soalinput, per1.bbinput);
                    var mikroAtas1 = per1.generatemikroAtas(
                        per1.bainput, per1.soalinput, per1.bbinput);
                    var per2 = new Perhitungan(int.parse(widget.input2[5]),
                        int.parse(widget.input2[3]), int.parse(_soal2.text));
                    var mikroBawah2 = per2.generatemikroBawah(
                        per2.bainput, per2.soalinput, per2.bbinput);
                    var mikroAtas2 = per2.generatemikroAtas(
                        per2.bainput, per2.soalinput, per2.bbinput);
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) => Fuzzifikasi(
                        mikroBawah1: mikroBawah1.toString(),
                        mikroBawah2: mikroBawah2.toString(),
                        mikroAtas1: mikroAtas1.toString(),
                        mikroAtas2: mikroAtas2.toString(),
                        input1: widget.input1,
                        input2: widget.input2,
                        output: widget.output,
                        variable1: _variable[0].text,
                        variable2: _variable[1].text,
                        r1: widget.r1,
                        r2: widget.r2,
                        r3: widget.r3,
                        r4: widget.r4,
                      ),
                    );
                    Navigator.of(context).push(route);
                  },
                  child: Text('NEXT')),
            ),
          ],
        ),
      ),
    );
  }
}
