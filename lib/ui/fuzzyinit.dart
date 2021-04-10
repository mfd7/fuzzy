import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuzzy/ui/rules.dart';

class FuzzyInit extends StatefulWidget {
  final List<String> input1;
  final List<String> input2;
  final List<String> output;

  FuzzyInit(
      {Key? key,
      required this.input1,
      required this.input2,
      required this.output})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new FuzzyInitScreenState();
  }
}

class FuzzyInitScreenState extends State<FuzzyInit> {
  final input1 = <Padding>[];
  final input2 = <Padding>[];
  final output = <Padding>[];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    for (var i = 0; i < widget.input1.length; i++) {
      input1.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: new Text(widget.input1[i])),
      ));
      input2.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: new Text(widget.input2[i])),
      ));
      output.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: new Text(widget.output[i])),
      ));
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tabel Inisialisasi'),
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
                        'Variable',
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
                        'Type',
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
                        'BB-Nama',
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
                        'BB-Value',
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
                        'BA-Nama',
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
                        'BA-Value',
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
                        'Satuan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                    ),
                    color: Colors.blue,
                  ),
                ]),
                TableRow(children: input1),
                TableRow(children: input2),
                TableRow(children: output),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => Rules(
                      input1: widget.input1,
                      input2: widget.input2,
                      output: widget.output
                    ),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text('NEXT')),
          )
        ],
      ),
    );
  }
}
