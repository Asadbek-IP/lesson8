import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({super.key});

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<Offset>? meninganimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 1200));
    meninganimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.5,0.0)
    ).animate(CurvedAnimation(parent: animationController!, curve: Curves.elasticIn));

    animationController!.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animationController!.repeat();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        animationController!.forward();
      },child: Icon(Icons.play_arrow),),
      body: Center(child: 
      
      SlideTransition(
        position: meninganimation!,
        child: Container(
              width:200,
              height: 300,
              child: Image.asset('assets/images/hojiboy.jpg'),),
      ),),
    );
  }
}