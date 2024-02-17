import 'package:flutter/material.dart';

abstract class Grade{

  Widget get head;
  Widget get body;

  List<Map> get scalons;

  Map getScalonAtY(int y);


}