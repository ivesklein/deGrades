
import 'package:degrades/grades/grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YosGrade extends Grade{

  @override
  Widget get head => SvgPicture.asset(
    "assets/yosH.svg", semanticsLabel: 'yosemite head'
  );
  
  @override
  Widget get body => SvgPicture.asset(
    "assets/yosB.svg", semanticsLabel: 'yosemite body'
  );

  @override
  final List<Map> _scalons = [
    //{"h": 251, "y": 0, "label": "-"},
    {"h": 21, "y": 250, "label": "5.7"},
    {"h": 22, "y": 270, "label": "5.8"},
    {"h": 23, "y": 291, "label": "5.9"},
    {"h": 23, "y": 313, "label": "5.10a"},
    {"h": 25, "y": 335, "label": "5.10b"},
    {"h": 25, "y": 359, "label": "5.10c"},
    {"h": 23, "y": 383, "label": "5.10d"},
    {"h": 23, "y": 405, "label": "5.11a"},
    {"h": 25, "y": 427, "label": "5.11b"},
    {"h": 24, "y": 451, "label": "5.11c"},
    {"h": 24, "y": 474, "label": "5.11d"},
    {"h": 23, "y": 497, "label": "5.12a"},
    {"h": 24, "y": 519, "label": "5.12b"},
    {"h": 24, "y": 542, "label": "5.12c"},
    {"h": 25, "y": 565, "label": "5.12d"},
    {"h": 23, "y": 589, "label": "5.13a"},
    {"h": 25, "y": 611, "label": "5.13b"},
    {"h": 24, "y": 635, "label": "5.13c"},
    {"h": 24, "y": 658, "label": "5.13d"},
    {"h": 24, "y": 681, "label": "5.14a"},
    {"h": 24, "y": 704, "label": "5.14b"},
    {"h": 24, "y": 727, "label": "5.14c"},
    {"h": 24, "y": 750, "label": "5.14d"},
    {"h": 24, "y": 773, "label": "5.15a"},
    {"h": 25, "y": 796, "label": "5.15b"},
    {"h": 25, "y": 820, "label": "5.15c"},
    //{"h": 300, "y": 845, "label": "+"},
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