

import 'package:degrades/grades/grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AusGrade extends Grade{

  @override
  Widget get head => SvgPicture.asset(
    "assets/ausH.svg", semanticsLabel: 'aus head'
  );
  
  @override
  Widget get body => SvgPicture.asset(
    "assets/ausB.svg", semanticsLabel: 'aus body'
  );

  @override
  final List<Map> _scalons = [
    {"h":21, "y":251, "label": "15"},
    {"h":22, "y":271, "label": "16"},
    {"h":23, "y":292, "label": "17"},
    {"h":23, "y":314, "label": "18"},
    {"h":25, "y":336, "label": "19"},
    {"h":25, "y":360, "label": "20"},
    {"h":23, "y":384, "label": "21"},
    {"h":23, "y":406, "label": "22"},
    {"h":32, "y":428, "label": "23"},
    {"h":32, "y":458, "label": "24"},
    {"h":33, "y":488, "label": "25"},
    {"h":33, "y":520, "label": "26"},
    {"h":33, "y":552, "label": "27"},
    {"h":29, "y":584, "label": "28"},
    {"h":25, "y":612, "label": "29"},
    {"h":24, "y":636, "label": "30"},
    {"h":24, "y":659, "label": "31"},
    {"h":24, "y":682, "label": "32"},
    {"h":24, "y":705, "label": "33"},
    {"h":24, "y":728, "label": "34"},
    {"h":24, "y":751, "label": "35"},
    {"h":24, "y":774, "label": "36"},
    {"h":25, "y":797, "label": "37"},
    {"h":25, "y":821, "label": "38"},
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