import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BounceAnimation extends StatefulWidget {
  const BounceAnimation({super.key});

  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? meninganimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 300));

    meninganimation = Tween<double>(begin: 0,end: 250 ).animate(
      CurvedAnimation(parent: animationController!, curve:const Interval(0.0,1.0,curve: Curves.linear))
    );

    animationController!.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animationController!.repeat(reverse: true);
      }
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        animationController!.forward();
      }),
      body: AnimatedBuilder(
        animation: meninganimation!,
        builder: (context,child) {
          return Container(
            margin: EdgeInsets.only(top: meninganimation!.value),
            width: 200,height: 200,
          child: Image.asset("assets/images/hojiboy.jpg"),
          );
        }
      ),
    );
  }
}