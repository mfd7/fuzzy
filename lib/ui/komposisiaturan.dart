import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuzzy/ui/defuzzifikasi.dart';

class KomposisiAturan extends StatefulWidget{
  final double komposisiBawah;
  final double komposisiAtas;
  final List<String> output;

  KomposisiAturan({
    Key? key,
    required this.komposisiAtas,
    required this.komposisiBawah,
    required this.output
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return KomposisiAturanScreenState();
  }

}

class KomposisiAturanScreenState extends State<KomposisiAturan>{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Komposisi Aturan'),
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
                            widget.output[2],
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
                            widget.output[4],
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
                    child: Center(child: Text(widget.komposisiBawah.toString())),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.komposisiAtas.toString())),
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
                    builder: (BuildContext context) => Defuzzifikasi(
                      komposisiAtas: widget.komposisiAtas,
                      komposisiBawah: widget.komposisiBawah,
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

