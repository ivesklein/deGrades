
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();


    _controller.addListener(() {
      print(_controller.offset);
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
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                width: 150,
                height: 150,
                padding: EdgeInsets.all(10),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                   SvgPicture.asset(
                    "assets/yosH.svg", semanticsLabel: 'yosemite head'
                  ),
                ],
              ),
            ),
            Expanded(child: Container(
              color: Theme.of(context).colorScheme.tertiary,
              child:  ListView(
                controller: _controller,
                children: [
                  Container(width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/yosB.svg",
                          semanticsLabel: 'yosemite'
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ))
          ],
        ),
      ), 
    );
  }
}
