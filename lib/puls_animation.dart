import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PulsAnimation extends StatefulWidget {
  const PulsAnimation({super.key});

  @override
  State<PulsAnimation> createState() => _PulsAnimationState();
}

class _PulsAnimationState extends State<PulsAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? meninganimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 1));

    meninganimation = Tween<Size>(begin: Size(100, 100), end: Size(300, 300))
        .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.linear));

        animationController!.addStatusListener((status) {
          if(status==AnimationStatus.completed){
            animationController!.repeat();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        animationController!.forward();
        print(animationController!.status);      }),
      body: Center(
        child: AnimatedBuilder(
          animation: meninganimation!,
          builder: ((context, child) => Container(
                width: meninganimation!.value.width,
                height: meninganimation!.value.height,
                child: Image.asset('assets/images/hojiboy.jpg'),
              )),
        ),
      ),
    );
  }
}
