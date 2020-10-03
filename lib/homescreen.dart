import 'package:flutter/material.dart';
import 'dart:math';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  int left=1;
  int right=1;
AnimationController _controller;
CurvedAnimation animation;
  @override
  void initState() {
    super.initState();
    animate();
  }
animate(){
  _controller=AnimationController(duration:Duration(seconds:1),vsync: this);
    animation = CurvedAnimation(parent: _controller,curve: Curves.bounceOut);
    animation.addListener(() {
      setState(() {
        
      });
      print(_controller.value);
    });
    animation.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        setState(() {
      left = Random().nextInt(6) + 1;
      right = Random().nextInt(6) + 1;
    });
         print('completed');
         _controller.reverse();
      }
    });
}

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  void roll() {
_controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dicee"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Image(height: 200-animation.value*200,
                      image: AssetImage('assets/images/dice-png-$left.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image(height:200- animation.value*200,
                      image: AssetImage('assets/images/dice-png-$right.png'),
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
                  onPressed: roll,
                  child: Text("Roll"),
                ),
          ],
        ),
      ),
    );
  }
}
