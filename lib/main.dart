import 'package:flutter/material.dart';

import 'dart:developer';

//import 'dart:ffi';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.blueGrey,

//colorScheme: ColorScheme.light(brightness: Brightness.dark ) ,

        primarySwatch: Colors.green,
      ),
      title: 'Calculator',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnum;
  // ignore: non_constant_identifier_names
  late int Secondnum;
  String texttodisplay = "";
  late String res;
  late String operatortoperform;

  var child;

  // ignore: prefer_typing_uninitialized_variables
  var backgroundColor;

  void btnclicked(String btnval) {
    log("clckd button $btnval");
    if (btnval == "C") {
      texttodisplay = "";

      firstnum = 0;
      Secondnum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);

      res = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      Secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        //backgroundColor: Colors.orange;

        res = (firstnum + Secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - Secondnum).toString();
      }
      if (operatortoperform == "x") {
        res = (firstnum * Secondnum).toString();
      }
      if (operatortoperform == "/") {
        //var textColor = Colors.yellow,
        res = (firstnum ~/ Secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval,[double size=18,fontweight = 12, int backgroundcolor=0xFF81D4FA,boxshape=BoxShape.rectangle]) {

    return GestureDetector(
      onTap: () => btnclicked(btnval),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 54,
          width: 54,
          alignment: Alignment.center,
          child: Text(
            // ignore: unnecessary_string_interpolations
            "$btnval",
            style: TextStyle(
              fontSize: size,
              fontWeight: fontweight,
            ),
          ),
          decoration: BoxDecoration(
            shape: boxshape,
          
            color: Color(backgroundcolor),
          ),
        ),
      ),
    );
  }

  @override
        Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
        title: const Text('Apna Calculator'),
        ),
        body: Container (
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Expanded(
        child: Container(
        color: Colors.lightBlueAccent,
        padding: const EdgeInsets.all(11),
        alignment: Alignment.bottomRight,
        child: Text(
        texttodisplay,
        style: const TextStyle(

        backgroundColor : Colors.white60,
        fontSize: 21,
        fontWeight: FontWeight.w600,
         ),
         ),
         ),
         ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //<Widget> 
                custombutton('7'),
                custombutton("8"),
                custombutton("9"),
                custombutton("Clr",22,18,0xFF01579B,BoxShape.circle),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
             // <Widget>
              [
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("+",22,18,0xFFDB5219,BoxShape.circle),
              ],//
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("-",26,18,0xFFDB5219,BoxShape.circle),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                custombutton("=",22,18,0xFF01579B,BoxShape.circle),
                custombutton("0",22),
                custombutton("/",22,18,0xFFDB5219,BoxShape.circle),
                custombutton("x",22,18,0xFFDB5219,BoxShape.circle),
              ],
            ),

            //Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            //children: <Widget>[
            // Text(
            //  "Splash\nScreen",
            // style:TextStyle(
            // color : Colors.white,
            // fontWeight: FontWeight.w800,
            //  fontSize: 22,
            // fontFamily: "Cursive",
            //  ),
          ],
        ),
      ),
    );
  }
}