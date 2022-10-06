import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lesson8/bounce_animation.dart';
import 'package:lesson8/flip_animation.dart';
import 'package:lesson8/puls_animation.dart';
import 'package:lesson8/slide_animation.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FlipAnimation(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
 AnimationController? _animationController;
  Animation<double>? meningAnimatsiyam;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 2400));
    meningAnimatsiyam = CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);
  } 

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        
        onPressed: (){
        setState(() {
          _animationController!.forward();
          
        });
      },
      child: Icon(Icons.play_arrow),
      ),
      body: Center(child: FadeTransition(
        alwaysIncludeSemantics: true,
        opacity: meningAnimatsiyam!,
        child: Container(
          width:200,
          height: 300,
          child: Image.asset('assets/images/hojiboy.jpg'),),
      )),
    );
  }
}