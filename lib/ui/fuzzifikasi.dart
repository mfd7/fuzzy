import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'operasi.dart';

class Fuzzifikasi extends StatefulWidget {
  final String mikroAtas1;
  final String mikroAtas2;
  final String mikroBawah1;
  final String mikroBawah2;
  final List<String> input1;
  final List<String> input2;
  final List<String> output;
  final String variable1;
  final String variable2;
  final List<String> r1;
  final List<String> r2;
  final List<String> r3;
  final List<String> r4;

  Fuzzifikasi(
      {Key? key,
      required this.mikroAtas1,
      required this.mikroAtas2,
      required this.mikroBawah1,
      required this.mikroBawah2,
      required this.input1,
      required this.input2,
      required this.output,
      required this.variable1,
      required this.variable2,
      required this.r1,
      required this.r2,
      required this.r3,
      required this.r4})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new FuzzifikasiScreenState();
  }
}

class FuzzifikasiScreenState extends State<Fuzzifikasi> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Fuzzifikasi'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                TableRow(children: [
                  ColoredBox(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: new Text(
                        'Variable',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                    ),
                  ),
                  ColoredBox(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: new Text(
                        'uBawah',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                    ),
                  ),
                  ColoredBox(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: new Text(
                        'uAtas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.variable1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.mikroBawah1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.mikroAtas1)),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.variable2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.mikroBawah2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(widget.mikroAtas2)),
                  )
                ])
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfCartesianChart(
                title: ChartTitle(text: widget.input1[0]),
                legend: Legend(isVisible: true),
                series: <ChartSeries>[
                  LineSeries<InputData, double>(
                      name: widget.input1[4],
                      dataSource: _chartI1Bawah,
                      xValueMapper: (InputData bawah, _) => bawah.bawah,
                      yValueMapper: (InputData atas, _) => atas.atas),
                  LineSeries<InputData, double>(
                      name: widget.input1[2],
                      dataSource: _chartI1Atas,
                      xValueMapper: (InputData bawah, _) => bawah.bawah,
                      yValueMapper: (InputData atas, _) => atas.atas),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfCartesianChart(
                title: ChartTitle(text: widget.input2[0]),
                legend: Legend(isVisible: true),
                series: <ChartSeries>[
                  LineSeries<InputData, double>(
                      name: widget.input2[4],
                      dataSource: _chartI2Bawah,
                      xValueMapper: (InputData bawah, _) => bawah.bawah,
                      yValueMapper: (InputData atas, _) => atas.atas),
                  LineSeries<InputData, double>(
                      name: widget.input2[2],
                      dataSource: _chartI2Atas,
                      xValueMapper: (InputData bawah, _) => bawah.bawah,
                      yValueMapper: (InputData atas, _) => atas.atas),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfCartesianChart(
                title: ChartTitle(text: widget.output[0]),
                legend: Legend(isVisible: true),
                series: <ChartSeries>[
                  LineSeries<InputData, double>(
                      name: widget.output[4],
                      dataSource: _chartOutputBawah,
                      xValueMapper: (InputData bawah, _) => bawah.bawah,
                      yValueMapper: (InputData atas, _) => atas.atas),
                  LineSeries<InputData, double>(
                      name: widget.output[2],
                      dataSource: _chartOutputAtas,
                      xValueMapper: (InputData bawah, _) => bawah.bawah,
                      yValueMapper: (InputData atas, _) => atas.atas),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => Operasi(
                      input1: widget.input1,
                      input2: widget.input2,
                      output: widget.output,
                      r1: widget.r1,
                      r2: widget.r2,
                      r3: widget.r3,
                      r4: widget.r4,
                      mikroBawah1: widget.mikroBawah1,
                      mikroBawah2: widget.mikroBawah2,
                      mikroAtas1: widget.mikroAtas1,
                      mikroAtas2: widget.mikroAtas2,
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

  @override
  void initState() {
    _chartI1Bawah = getChartI1Bawah();
    _chartI1Atas = getChartI1Atas();
    _chartI2Bawah = getChartI2Bawah();
    _chartI2Atas = getChartI2Atas();
    _chartOutputBawah = getChartOutputBawah();
    _chartOutputAtas = getChartOutputAtas();
    super.initState();
  }

  late List<InputData> _chartI1Bawah;
  late List<InputData> _chartI1Atas;
  late List<InputData> _chartI2Bawah;
  late List<InputData> _chartI2Atas;
  late List<InputData> _chartOutputBawah;
  late List<InputData> _chartOutputAtas;

  List<InputData> getChartI1Bawah() {
    final List<InputData> chartData = [
      InputData(double.parse(widget.input1[3]), 0),
      InputData(double.parse(widget.input1[5]), 1),
    ];
    return chartData;
  }

  List<InputData> getChartI1Atas() {
    final List<InputData> chartData = [
      InputData(double.parse(widget.input1[3]), 1),
      InputData(double.parse(widget.input1[5]), 0),
    ];
    return chartData;
  }

  List<InputData> getChartI2Bawah() {
    final List<InputData> chartData = [
      InputData(double.parse(widget.input2[3]), 0),
      InputData(double.parse(widget.input2[5]), 1),
    ];
    return chartData;
  }

  List<InputData> getChartI2Atas() {
    final List<InputData> chartData = [
      InputData(double.parse(widget.input2[3]), 1),
      InputData(double.parse(widget.input2[5]), 0),
    ];
    return chartData;
  }

  List<InputData> getChartOutputBawah() {
    final List<InputData> chartData = [
      InputData(double.parse(widget.output[3]), 0),
      InputData(double.parse(widget.output[5]), 1),
    ];
    return chartData;
  }

  List<InputData> getChartOutputAtas() {
    final List<InputData> chartData = [
      InputData(double.parse(widget.output[3]), 1),
      InputData(double.parse(widget.output[5]), 0),
    ];
    return chartData;
  }
}

class InputData {
  final double bawah;
  final double atas;

  InputData(this.bawah, this.atas);
}
