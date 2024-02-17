
import 'package:degrades/grades/french.dart';
import 'package:degrades/grades/grade.dart';
import 'package:degrades/grades/yosemite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ScrollController _controller = ScrollController();

  final offsetFirst = 40;

  List<Grade> grades = [
    YosGrade(),
    FreGrade(),
  ];

  Map scalon = {
    "label": "--",
    "h": 30
  };

  int selectedScale = 0;

  @override
  void initState() {

    scalon = grades[selectedScale].scalons.first;
    super.initState();

    Future.delayed(Durations.short1, () {
      centerScroll();
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
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              width: double.infinity,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 150,
                height: 150,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(scalon["label"], style: TextStyle(fontSize: 32), textAlign: TextAlign.center,),
                
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 3
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),

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
