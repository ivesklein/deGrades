
import 'dart:ffi';

import 'package:degrades/grades/australian.dart';
import 'package:degrades/grades/brazil.dart';
import 'package:degrades/grades/french.dart';
import 'package:degrades/grades/grade.dart';
import 'package:degrades/grades/norway.dart';
import 'package:degrades/grades/southafrica.dart';
import 'package:degrades/grades/yosemite.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ScrollController _controller = ScrollController();

  final offsetFirst = 40;

  List<Grade> allGrades = [
    YosGrade(),
    FreGrade(),
    BraGrade(),
    AusGrade(),
    NorGrade(),
    SAFGrade(),
  ];

  List<Grade> grades = [
    YosGrade(),
    FreGrade(),
    BraGrade(),
    AusGrade(),
  ];

  Map scalon = {
    "label": "--",
    "h": 30
  };

  int selectedScale = 0;

  late SharedPreferences prefs;

  @override
  void initState() {

    grades = [
      allGrades[0],
      allGrades[1],
      allGrades[2],
      allGrades[3],
    ];

    scalon = grades[selectedScale].scalons.first;
    super.initState();

    Future.delayed(Duration.zero, () async {
      prefs = await SharedPreferences.getInstance();
      print(prefs.getStringList('grades'));
      final List<int> items = (prefs.getStringList('grades')??[]).map((e) => int.parse(e)).toList();

      if(items.isEmpty){
        List<String> saveItems = ["0","1","2","3"];
        await prefs.setStringList('grades', saveItems);
      }else{
        List<Grade> prelist = items.map((e) => allGrades[e]).toList();
        grades = prelist;
        scalon = grades[selectedScale].scalons.first;
      }

      scalon = grades[selectedScale].scalons.first;

      Future.delayed(Durations.short1, () {
        centerScroll();
      },);

    },);

    _controller.addListener(() {

      setState(() {
        scalon = grades[selectedScale].getScalonAtY(_controller.offset.floor()+offsetFirst);
      });

    });

  }

  void centerScroll() async{
    int pos = _controller.offset.floor();
    int target = scalon["y"];

    print("[scroll] pos:${pos} target:${target}");

    if(pos!=target-50){
      print("going");
      //_controller.animateTo(_controller.offset-target.toDouble(), duration: Duration(milliseconds: 200), curve: Curves.linear);
      Future.delayed(Durations.short1, () async {
        await _controller.animateTo((target-50), duration: const Duration(milliseconds: 100), curve: Curves.ease);  
        print("done?");
      },);
      
      
    }
  }

  selectGrade(Grade e) {
    int pos = grades.indexOf(e);
    setState(() {
      selectedScale = pos;
      scalon = grades[selectedScale].getScalonAtY(_controller.offset.floor()+offsetFirst);
    });
    centerScroll();
  }

  void toggleGrade(bool show, Grade grade) async{
    if(show){
      if(grades.length<4){
        grades.add(grade);
      }
    }else{
      if(grades.length>1){
        grades.removeWhere((e) => e==grade);
        if(grades.length<=selectedScale){
          selectedScale--;
        }
        
        scalon = grades[selectedScale].getScalonAtY(_controller.offset.floor()+offsetFirst);
        centerScroll();

      }
    }

    List<String> saveItems = [];
    //check all list and save index
    allGrades.forEach((element) {
      if(grades.contains(element)){
        saveItems.add(allGrades.indexOf(element).toString());
      }
    });
    await prefs.setStringList('grades', saveItems);

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(actions: [

      MenuAnchor(
        builder: (BuildContext context, MenuController controller, Widget? child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.settings),
              tooltip: 'Show menu',
            );
          },
          menuChildren: allGrades.map((e) => MenuItemButton(child: Row(
            children: [
              Checkbox(
                tristate: true,
                value:  grades.contains(e),
                onChanged: (bool? value) {
                  print(value);
                  toggleGrade(value??false, e);
                },

              ),
              Text(e.name),
            ],
          ),)).toList(),
        ),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 150,
                height: 150,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(scalon["label"], style: TextStyle(fontSize: 32), textAlign: TextAlign.center,),
                
                decoration: BoxDecoration(
                  color: grades[selectedScale].color,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 3
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  gradient: RadialGradient(
                    colors: [
                      grades[selectedScale].color,
                      Colors.black,
                    ],
                    focalRadius: 50,
                    radius: 1
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        ...grades.map((e) => GestureDetector(onTap: (){selectGrade(e);},child: e.head,)).toList()
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0, left: 7+selectedScale*85), 
                    child: Container(
                      width: 91,
                      height: 23,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                    ),
                  )
                ],
              ),
              
            ),
            Expanded(child: Stack(
              children: [
                Container(
                  //color: Theme.of(context).colorScheme.tertiary,
                  child:  NotificationListener(
                    child: ListView(
                      controller: _controller,
                      children: [
                        Container(width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              ...grades.map((e) => e.body).toList()
                            ],
                          ),
                        ),
                      ],
                    ),
                    onNotification: (notification) {
                      if (notification is ScrollEndNotification) {
                        centerScroll();
                      }
                      return true;
                    },
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 10, right: 10), 
                  child: Container(
                    width: double.infinity,
                    height: (scalon["h"] as int).toDouble(),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ), 
    );
  }
  
}
