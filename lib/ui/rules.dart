import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuzzy/ui/soal.dart';

class Rules extends StatefulWidget {
  final List<String> input1;
  final List<String> input2;
  final List<String> output;

  Rules(
      {Key? key,
      required this.input1,
      required this.input2,
      required this.output})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RulesScreenState();
  }
}

class RulesScreenState extends State<Rules> {
  List<TextEditingController> _index = [];
  List<TextEditingController> _input1 = [];
  List<TextEditingController> _input2 = [];
  List<TextEditingController> _output = [];
  String? _batasInput1r1;
  String? _batasInput1r2;
  String? _batasInput1r3;
  String? _batasInput1r4;
  List<String> _batasInput1list = [];
  String? _batasInput2r1;
  String? _batasInput2r2;
  String? _batasInput2r3;
  String? _batasInput2r4;
  List<String> _batasInput2list = [];
  String? _batasOutputr1;
  String? _batasOutputr2;
  String? _batasOutputr3;
  String? _batasOutputr4;
  List<String> _batasOutputlist = [];
  List<String> _rules1 = [];
  List<String> _rules2 = [];
  List<String> _rules3 = [];
  List<String> _rules4 = [];

  @override
  void initState() {
    _batasInput1list.add(widget.input1[2]);
    _batasInput1list.add(widget.input1[4]);
    _batasInput1r1 = _batasInput1list[0];
    _batasInput1r2 = _batasInput1list[0];
    _batasInput1r3 = _batasInput1list[0];
    _batasInput1r4 = _batasInput1list[0];
    _batasInput2list.add(widget.input2[2]);
    _batasInput2list.add(widget.input2[4]);
    _batasInput2r1 = _batasInput2list[0];
    _batasInput2r2 = _batasInput2list[0];
    _batasInput2r3 = _batasInput2list[0];
    _batasInput2r4 = _batasInput2list[0];
    _batasOutputlist.add(widget.output[2]);
    _batasOutputlist.add(widget.output[4]);
    _batasOutputr1 = _batasOutputlist[0];
    _batasOutputr2 = _batasOutputlist[0];
    _batasOutputr3 = _batasOutputlist[0];
    _batasOutputr4 = _batasOutputlist[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    for (var i = 1; i <= 4; i++) {
      _index.add(new TextEditingController());
      _index[i - 1].text = 'R' + i.toString();
    }

    for (var i = 0; i <= 6; i++) {
      _input1.add(new TextEditingController());
      _input1[i].text = widget.input1[i];
      _input2.add(new TextEditingController());
      _input2[i].text = widget.input2[i];
      _output.add(new TextEditingController());
      _output[i].text = widget.output[i];
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Rules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              'Rules 1',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                childAspectRatio: 16/9,
                children: [
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _input1[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasInput1r1,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasInput1r1 = newValue.toString();
                      });
                    },
                    items: _batasInput1list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _input2[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasInput2r1,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasInput2r1 = newValue.toString();
                      });
                    },
                    items: _batasInput2list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _output[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasOutputr1,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasOutputr1 = newValue.toString();
                      });
                    },
                    items: _batasOutputlist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                ],
              ),
            ),
            Text(
              'Rules 2',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                childAspectRatio: 16/9,
                children: [
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _input1[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasInput1r2,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasInput1r2 = newValue.toString();
                      });
                    },
                    items: _batasInput1list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _input2[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasInput2r2,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasInput2r2 = newValue.toString();
                      });
                    },
                    items: _batasInput2list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _output[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasOutputr2,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasOutputr2 = newValue.toString();
                      });
                    },
                    items: _batasOutputlist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                ],
              ),
            ),
            Text(
              'Rules 3',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                childAspectRatio: 16/9,
                children: [
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _input1[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasInput1r3,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasInput1r3 = newValue.toString();
                      });
                    },
                    items: _batasInput1list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _input2[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasInput2r3,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasInput2r3 = newValue.toString();
                      });
                    },
                    items: _batasInput2list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _output[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasOutputr3,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasOutputr3 = newValue.toString();
                      });
                    },
                    items: _batasOutputlist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                ],
              ),
            ),
            Text(
              'Rules 4',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                childAspectRatio: 16/9,
                children: [
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _input1[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasInput1r4,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasInput1r4 = newValue.toString();
                      });
                    },
                    items: _batasInput1list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _input2[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasInput2r4,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasInput2r4 = newValue.toString();
                      });
                    },
                    items: _batasInput2list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                  Center(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: _output[0],
                      readOnly: true,
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _batasOutputr4,
                    onChanged: (String? newValue) {
                      setState(() {
                        _batasOutputr4 = newValue.toString();
                      });
                    },
                    items: _batasOutputlist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    _rules1.add(_input1[0].text);
                    _rules1.add(_batasInput1r1!);
                    _rules1.add(_input2[0].text);
                    _rules1.add(_batasInput2r1!);
                    _rules1.add(_output[0].text);
                    _rules1.add(_batasOutputr1!);
                    _rules2.add(_input1[0].text);
                    _rules2.add(_batasInput1r2!);
                    _rules2.add(_input2[0].text);
                    _rules2.add(_batasInput2r2!);
                    _rules2.add(_output[0].text);
                    _rules2.add(_batasOutputr2!);
                    _rules3.add(_input1[0].text);
                    _rules3.add(_batasInput1r3!);
                    _rules3.add(_input2[0].text);
                    _rules3.add(_batasInput2r3!);
                    _rules3.add(_output[0].text);
                    _rules3.add(_batasOutputr3!);
                    _rules4.add(_input1[0].text);
                    _rules4.add(_batasInput1r4!);
                    _rules4.add(_input2[0].text);
                    _rules4.add(_batasInput2r4!);
                    _rules4.add(_output[0].text);
                    _rules4.add(_batasOutputr4!);

                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) => Soal(
                        input1: widget.input1,
                        input2: widget.input2,
                        output: widget.output,
                        r1: _rules1,
                        r2: _rules2,
                        r3: _rules3,
                        r4: _rules4,
                      ),
                    );
                    Navigator.of(context).push(route);
                  },
                  child: Text('NEXT')),
            )
          ],
        ),
      ),
    );
  }
}


