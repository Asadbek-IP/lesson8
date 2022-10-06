import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({super.key});

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation> with SingleTickerProviderStateMixin{
  AnimationController? animationController;
  Animation? meninganimation;
  AnimationStatus? animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 3));

    meninganimation = Tween(begin: 1.0,end: 2.0).animate(animationController!)

    ..addListener(() {
      setState(() {
        
      });
    })

    ..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        animationController!.repeat(reverse: true);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){animationController!.forward();}),
      body: Center(child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
      ..setEntry(3, 2, 0.002)
      ..rotateX(3.14*(meninganimation!.value)),
       child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: Icon(Icons.accessibility_rounded,size: 100,color: Colors.white,)),
      ),
      
      ),
    );
  }
}