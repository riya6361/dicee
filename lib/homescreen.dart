import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

int left=1;
int right=1;
void roll(){
  setState(() {
    left=Random().nextInt(6)+1;
    right=Random().nextInt(6)+1;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dicee")),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Image(
                    image: AssetImage('images/dice-png-$left.png'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Image(
                    image: AssetImage('images/dice-png-$right.png'),
                  ),
                ),
              )
            ],
          ),
          RaisedButton(onPressed: roll,
          child: Text("Roll",
          style: TextStyle(fontWeight: FontWeight.bold),
          )
        ,
          )
        ]),
      ),
    );
  }
}
