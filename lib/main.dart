import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Calculatornator());

class Calculatornator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculate(),
    );
  }
}

class Calculate extends StatefulWidget {
  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
String x ;
String y ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text('Calculatonator_0.0.1', style: TextStyle(fontSize: 55, color: Colors.deepOrange),),
          TextField(
            decoration: InputDecoration(labelText: '1-st number', prefixIcon: Icon(Icons.add_circle)),
          onChanged: (String n){
              x = n;
            },
            ),
          TextField(
            decoration: InputDecoration(labelText: '2-nd nubmer', prefixIcon: Icon(Icons.add_circle)),
          onChanged: (String n){
            y = n;
          },
          ),
          FlatButton(child: Text('X', style: TextStyle(fontSize: 30),), onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => Results(y: this.y, x: this.x, r: 1)));
          },),
            FlatButton(child: Text('+', style: TextStyle(fontSize: 30),), onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => Results(y: this.y, x: this.x, r: 2)));
            },),
            FlatButton(child: Text('-', style: TextStyle(fontSize: 30),), onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => Results(y: this.y, x: this.x, r: 3)));
            },),
            FlatButton(child: Text('/', style: TextStyle(fontSize: 30),), onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => Results(y: this.y, x: this.x, r: 4)));

          },),
        ],
        ),
      )
    );
  }
}
class Results extends StatefulWidget {
  final String x, y;
  final int r;
  String string;
  @override
  Results({this.x, this.y, this.r}) {
    double n;
    String s;
    int res = this.r;

    switch (res) {
      case 1:
        n = double.parse(this.x) * double.parse(this.y);
        s = "X";
        break;
      case 2:
        n = double.parse(this.x) + double.parse(this.y);
        s = "+";
        break;
      case 3:
        n = double.parse(this.x) - double.parse(this.y);
        s = "-";
        break;
      case 4:
        n = double.parse(this.x) / double.parse(this.y);
        s = "/";
        break;
        }    
    string = this.x+" " + s+" " + this.y +" "+ "="+" " + n.toString();
  }
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
         mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(this.widget.string, style: TextStyle(fontSize: 35),
              )
            ],
          ), 
         );
  }
}