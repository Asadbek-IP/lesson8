import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lesson8/bounce_animation.dart';
import 'package:lesson8/puls_animation.dart';

class NavigationRailPage extends StatefulWidget {
  const NavigationRailPage({super.key});

  @override
  State<NavigationRailPage> createState() => _NavigationRailPageState();
}

class _NavigationRailPageState extends State<NavigationRailPage> {
 
  int? hozirgiIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        NavigationRail(
          labelType: NavigationRailLabelType.selected,
          destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.stacked_bar_chart), label: Text("Static")),
            NavigationRailDestination(
                icon: Icon(Icons.star), label: Text("Star")),
            NavigationRailDestination(
                icon: Icon(Icons.save_rounded), label: Text("Save")),
          ],
          onDestinationSelected: (index) {
           setState(() {
              hozirgiIndex = index;
           });
          },
          selectedIndex: hozirgiIndex,
        ),
        VerticalDivider(),
        Center(
          child: Text("Hozirgi index: $hozirgiIndex"),
        )
      ]),
    );
  }
}
