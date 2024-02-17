
import 'package:degrades/grades/grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FreGrade extends Grade{

  @override
  Widget get head => SvgPicture.asset(
    "assets/freH.svg", semanticsLabel: 'french head'
  );
  
  @override
  Widget get body => SvgPicture.asset(
    "assets/freB.svg", semanticsLabel: 'french body'
  );

  final List<Map> _scalons = [
    //{"h": 251, "y": 0, "label": "-"},
      {"h": 21, "y": 250, "label": "4"},
      {"h": 22, "y": 270, "label": "4+"},
      {"h": 23, "y": 291, "label": "5"},
      {"h": 23, "y": 313, "label": "5+"},
      {"h": 25, "y": 335, "label": "6a"},
      {"h": 25, "y": 359, "label": "6a+"},
      {"h": 23, "y": 383, "label": "6b"},
      {"h": 23, "y": 405, "label": "6b+"},
      {"h": 25, "y": 427, "label": "6c"},
      {"h": 24, "y": 451, "label": "6c+"},
      {"h": 24, "y": 474, "label": "7a"},
      {"h": 23, "y": 497, "label": "7a+"},
      {"h": 24, "y": 519, "label": "7b"},
      {"h": 24, "y": 542, "label": "7b+"},
      {"h": 25, "y": 565, "label": "7c"},
      {"h": 23, "y": 589, "label": "7c+"},
      {"h": 25, "y": 611, "label": "8a"},
      {"h": 24, "y": 635, "label": "8a+"},
      {"h": 24, "y": 658, "label": "8b"},
      {"h": 24, "y": 681, "label": "8b+"},
      {"h": 24, "y": 704, "label": "8c"},
      {"h": 24, "y": 727, "label": "8c+"},
      {"h": 24, "y": 750, "label": "9a"},
      {"h": 24, "y": 773, "label": "9a+"},
      {"h": 25, "y": 796, "label": "9b"},
      {"h": 25, "y": 820, "label": "9b+"},
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