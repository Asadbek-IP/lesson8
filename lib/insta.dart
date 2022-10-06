import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Insta extends StatefulWidget {
  const Insta({super.key});

  @override
  State<Insta> createState() => _InstaState();
}

class _InstaState extends State<Insta> {
  final TextEditingController _controller = TextEditingController();
   

  bool xatoBormi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Instagram",style: TextStyle(fontSize: 40),),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  errorText: xatoBormi?"Xato Email":null,
                  labelText: "Email"
                ),
              ),
               TextField(
                decoration: InputDecoration(
                  labelText: "Parol"
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  if(_controller.text.contains("@")){
                    xatoBormi = false;
                  }else{
                    xatoBormi = true;
                  }
                  
                });
              }, child: Text("Kirish")),
            ],
          ),
        ),
      ),
    );
  }
}