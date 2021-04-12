import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:my_fuzzy_lib/my_fuzzy_lib.dart';

import 'fuzzyinitfile.dart';

class File extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FileScreenState();
  }
}

class FileScreenState extends State<File> {
  String? _path = '-';
  bool _pickFileInProgress = false;
  String? _data;
  Map<int, String> _splitted = {};
  List<String> _splittedInput1 = [];
  List<String> _splittedInput2 = [];
  List<String> _splittedOutput = [];
  List<String> _rules1 = [];
  List<String> _rules2 = [];
  List<String> _rules3 = [];
  List<String> _rules4 = [];
  String? _soal1;
  String? _soal2;
  bool _isVisible = false;

  fetchFileData() async {
    String _loadedData = await rootBundle.loadString('assets/mesincuci.txt');
    setState(() {
      _data = _loadedData;
    });

    var split = _data?.split('?');
    _splitted = {for (int i = 0; i < split!.length; i++) i: split[i]};
    for (var i = 0; i <= 6; i++) {
      _splittedInput1.add(_splitted[i]!);
    }
    for (var i = 7; i <= 13; i++) {
      _splittedInput2.add(_splitted[i]!);
    }
    for (var i = 14; i <= 20; i++) {
      _splittedOutput.add(_splitted[i]!);
    }
    for (var i = 21; i <= 26; i++) {
      _rules1.add(_splitted[i]!);
    }
    for (var i = 27; i <= 32; i++) {
      _rules2.add(_splitted[i]!);
    }
    for (var i = 33; i <= 38; i++) {
      _rules3.add(_splitted[i]!);
    }
    for (var i = 39; i <= 44; i++) {
      _rules4.add(_splitted[i]!);
    }
    _soal1 = _splitted[45];
    _soal2 = _splitted[46];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Pilih File'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                width: 80,
                height: 80,
                child: MaterialButton(
                  shape: CircleBorder(
                      side: BorderSide(
                          width: 2,
                          color: Colors.blue,
                          style: BorderStyle.solid)),
                  color: Colors.blue,
                  onPressed: _pickFileInProgress ? null : _pickDocument,
                  child: Text(
                    'Pilih File',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '$_path',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                      onPressed: (){
                        fetchFileData();
                        setState(() {
                          _isVisible = true;
                        });
                      },
                      child: Text('Load'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Visibility(
                    visible: _isVisible,
                    child: Text(
                      'Load Success',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              var per1 = new Perhitungan(int.parse(_splittedInput1[5]),
                  int.parse(_splittedInput1[3]), int.parse(_soal1!));
              var mikroBawah1 = per1.generatemikroBawah(
                  per1.bainput, per1.soalinput, per1.bbinput);
              var mikroAtas1 = per1.generatemikroAtas(
                  per1.bainput, per1.soalinput, per1.bbinput);
              var per2 = new Perhitungan(int.parse(_splittedInput2[5]),
                  int.parse(_splittedInput2[3]), int.parse(_soal2!));
              var mikroBawah2 = per2.generatemikroBawah(
                  per2.bainput, per2.soalinput, per2.bbinput);
              var mikroAtas2 = per2.generatemikroAtas(
                  per2.bainput, per2.soalinput, per2.bbinput);
              var route = new MaterialPageRoute(
                builder: (BuildContext context) => FuzzyInitFile(
                  input1: _splittedInput1,
                  input2: _splittedInput2,
                  output: _splittedOutput,
                  rules1: _rules1,
                  rules2: _rules2,
                  rules3: _rules3,
                  rules4: _rules4,
                  mikroBawah1: mikroBawah1.toString(),
                  mikroBawah2: mikroBawah2.toString(),
                  mikroAtas1: mikroAtas1.toString(),
                  mikroAtas2: mikroAtas2.toString(),
                ),
              );
              Navigator.of(context).push(route);
            },
            child: Text('NEXT')),
      ),
    );
  }

  _pickDocument() async {
    String? result;
    try {
      setState(() {
        _path = '-';
        _pickFileInProgress = true;
      });

      FlutterDocumentPickerParams params = FlutterDocumentPickerParams();

      result = await FlutterDocumentPicker.openDocument(params: params);
    } catch (e) {
      print(e);
      result = 'Error: $e';
    } finally {
      setState(() {
        _pickFileInProgress = false;
      });
    }

    setState(() {
      _path = result;
    });
  }
}
