import 'package:degrades/grades/grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SAFGrade extends Grade{

  @override
  Widget get head => SvgPicture.asset(
    "assets/safH.svg", semanticsLabel: 'safemite head'
  );
  
  @override
  Widget get body => SvgPicture.asset(
    "assets/safB.svg", semanticsLabel: 'safemite body'
  );

  @override
  final List<Map> _scalons = [
    {"h":18, "y":239, "label":"13"},
    {"h":17, "y":256, "label":"14"},
    {"h":19, "y":272, "label":"15"},
    {"h":20, "y":289, "label":"16"},
    {"h":25, "y":308, "label":"17"},
    {"h":25, "y":332, "label":"18"},
    {"h":25, "y":354, "label":"19"},
    {"h":24, "y":378, "label":"20"},
    {"h":25, "y":401, "label":"21"},
    {"h":25, "y":425, "label":"22"},
    {"h":25, "y":448, "label":"23"},
    {"h":24, "y":472, "label":"24"},
    {"h":24, "y":495, "label":"25"},
    {"h":26, "y":518, "label":"26"},
    {"h":24, "y":543, "label":"27"},
    {"h":25, "y":566, "label":"28"},
    {"h":24, "y":590, "label":"29"},
    {"h":25, "y":613, "label":"30"},
    {"h":25, "y":636, "label":"31"},
    {"h":24, "y":660, "label":"32"},
    {"h":24, "y":683, "label":"33"},
    {"h":24, "y":706, "label":"34"},
    {"h":25, "y":729, "label":"35"},
    {"h":25, "y":753, "label":"36"},
    {"h":24, "y":777, "label":"37"},
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
  String name = "South Africa";

  @override
  Color color = Color.fromRGBO(0, 122, 77, 1);

}