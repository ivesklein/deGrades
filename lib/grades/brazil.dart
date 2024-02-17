import 'package:degrades/grades/grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BraGrade extends Grade{

  @override
  Widget get head => SvgPicture.asset(
    "assets/braH.svg", semanticsLabel: 'brazil head'
  );
  
  @override
  Widget get body => SvgPicture.asset(
    "assets/braB.svg", semanticsLabel: 'brazil body'
  );

  @override
  final List<Map> _scalons = [
    //{"h": 251, "y": 0, "label": "-"},
    {"h":13, "y":263, "label":"4"},
    {"h":13, "y":275, "label":"4+"},
    {"h":13, "y":287, "label":"5"},
    {"h":13, "y":298, "label":"5+"},
    {"h":34, "y":310, "label":"6a"},
    {"h":25, "y":343, "label":"6b"},
    {"h":36, "y":367, "label":"6c"},
    {"h":36, "y":402, "label":"7a"},
    {"h":24, "y":437, "label":"7b"},
    {"h":35, "y":460, "label":"7c"},
    {"h":26, "y":494, "label":"8a"},
    {"h":24, "y":519, "label":"8b"},
    {"h":24, "y":542, "label":"8c"},
    {"h":23, "y":565, "label":"9a"},
    {"h":25, "y":587, "label":"9b"},
    {"h":25, "y":611, "label":"9c"},
    {"h":24, "y":635, "label":"10a"},
    {"h":24, "y":658, "label":"10b"},
    {"h":24, "y":681, "label":"10c"},
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