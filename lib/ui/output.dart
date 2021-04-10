import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuzzy/ui/fuzzyinit.dart';

class Output extends StatefulWidget{

  final List<String> input1;
  final List<String> input2;

  Output({Key? key, required this.input1, required this.input2}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OutputScreenState();
  }

}

class OutputScreenState extends State<Output>{
  TextEditingController _namaVar = TextEditingController();
  TextEditingController _bbNama = TextEditingController();
  TextEditingController _bbValue = TextEditingController();
  TextEditingController _baNama = TextEditingController();
  TextEditingController _baValue = TextEditingController();
  TextEditingController _satuanVar = TextEditingController();

  List<String> _output = [];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Output'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: 'Nama Variable', border: OutlineInputBorder()),
              controller: _namaVar,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: 'Variable Batas Bawah',
                  border: OutlineInputBorder()),
              controller: _bbNama,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: 'Nilai Batas Bawah', border: OutlineInputBorder()),
              controller: _bbValue,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: 'Variable Batas Atas',
                  border: OutlineInputBorder()),
              controller: _baNama,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: 'Nilai Batas Atas', border: OutlineInputBorder()),
              controller: _baValue,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: 'Satuan', border: OutlineInputBorder()),
              controller: _satuanVar,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _output.add(_namaVar.text);
                _output.add('Output');
                _output.add(_bbNama.text);
                _output.add(_bbValue.text);
                _output.add(_baNama.text);
                _output.add(_baValue.text);
                _output.add(_satuanVar.text);
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FuzzyInit(input1: widget.input1, input2: widget.input2, output: _output),
                );
                Navigator.of(context).push(route);
              },
              child: Text('NEXT'),
            ),
          )
        ],
      ),
    );
  }

}