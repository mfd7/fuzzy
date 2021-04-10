import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'output.dart';

class Input2 extends StatefulWidget {
  final List<String> input1;

  Input2({Key? key, required this.input1}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new Input2ScreenState();
  }
}

class Input2ScreenState extends State<Input2> {
  TextEditingController _namaVar = TextEditingController();
  TextEditingController _bbNama = TextEditingController();
  TextEditingController _bbValue = TextEditingController();
  TextEditingController _baNama = TextEditingController();
  TextEditingController _baValue = TextEditingController();
  TextEditingController _satuanVar = TextEditingController();

  List<String> _input2 = [];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Input ke-2'),
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
                _input2.add(_namaVar.text);
                _input2.add('Input');
                _input2.add(_bbNama.text);
                _input2.add(_bbValue.text);
                _input2.add(_baNama.text);
                _input2.add(_baValue.text);
                _input2.add(_satuanVar.text);
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) => Output(
                    input1: widget.input1, input2: _input2),
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
