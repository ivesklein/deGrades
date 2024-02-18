import 'package:degrades/grades/grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NorGrade extends Grade{

  @override
  Widget get head => SvgPicture.asset(
    "assets/norH.svg", semanticsLabel: 'norway head'
  );
  
  @override
  Widget get body => SvgPicture.asset(
    "assets/norB.svg", semanticsLabel: 'norway body'
  );

  @override
  final List<Map> _scalons = [
    {"h":26, "y":231, "label":"5-"},
    {"h":26, "y":256, "label":"5"},
    {"h":26, "y":280, "label":"5+"},
    {"h":28, "y":305, "label":"6-"},
    {"h":34, "y":332, "label":"6"},
    {"h":42, "y":365, "label":"6+"},
    {"h":38, "y":406, "label":"7-"},
    {"h":37, "y":443, "label":"7"},
    {"h":39, "y":479, "label":"7+"},
    {"h":39, "y":517, "label":"8-"},
    {"h":40, "y":555, "label":"8"},
    {"h":38, "y":633, "label":"8+"},
    {"h":40, "y":594, "label":"9-"},
    {"h":39, "y":670, "label":"9"},
    {"h":37, "y":708, "label":"9+"},
  ];
  
  @override
  Map getScalonAtY(int y) {
    Map scalon = _scalons.first;
    
    for (Map e in _scalons) {
      if (e["y"] >= y) {
        scalon = e;
        break;
      }
    }

    if (y >= _scalons.last["y"]) {
      scalon = _scalons.last;
    }

    return scalon;
  }
  
  @override
  List<Map> get scalons => _scalons;

  @override
  String name = "Norway";

  @override
  Color color = Color.fromRGBO(80, 97, 255, 1);

}