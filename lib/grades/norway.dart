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
    {"h":26, "v":231, "label":"5-"},
    {"h":26, "v":256, "label":"5"},
    {"h":26, "v":280, "label":"5+"},
    {"h":28, "v":305, "label":"6-"},
    {"h":34, "v":332, "label":"6"},
    {"h":42, "v":365, "label":"6+"},
    {"h":38, "v":406, "label":"7-"},
    {"h":37, "v":443, "label":"7"},
    {"h":39, "v":479, "label":"7+"},
    {"h":39, "v":517, "label":"8-"},
    {"h":40, "v":555, "label":"8"},
    {"h":38, "v":633, "label":"8+"},
    {"h":40, "v":594, "label":"9-"},
    {"h":39, "v":670, "label":"9"},
    {"h":37, "v":708, "label":"9+"},
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

  

}