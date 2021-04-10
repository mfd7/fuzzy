import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuzzy/ui/input2.dart';

class Manual extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ManualScreenState();
  }
}

class ManualScreenState extends State<Manual> {
  TextEditingController _namaVar = TextEditingController();
  TextEditingController _bbNama = TextEditingController();
  TextEditingController _bbValue = TextEditingController();
  TextEditingController _baNama = TextEditingController();
  TextEditingController _baValue = TextEditingController();
  TextEditingController _satuanVar = TextEditingController();

  List<String> _input1 = [];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Input ke-1'),
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
                _input1.add(_namaVar.text);
                _input1.add('Input');
                _input1.add(_bbNama.text);
                _input1.add(_bbValue.text);
                _input1.add(_baNama.text);
                _input1.add(_baValue.text);
                _input1.add(_satuanVar.text);
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) => Input2(input1: _input1),
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
