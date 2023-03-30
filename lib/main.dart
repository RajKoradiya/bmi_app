// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wt = TextEditingController();
  var ft = TextEditingController();
  var inch = TextEditingController();
  var result = "";
  var bgColor = Colors.blue.shade200;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
          body: Container(
            color: bgColor,
            child: Center(
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("BMI", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: wt,
                      decoration: InputDecoration(
                        label: Text("Enter Your Weight(in kgs)",),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: ft,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text("Enter your Height(in feet)",),
                        prefixIcon: Icon(Icons.height)
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: inch,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text("Enter your Height(in inch)"),
                        prefixIcon: Icon(Icons.height)
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      var weight = wt.text.toString();
                      var feet = ft.text.toString();
                      var inchs = inch.text.toString();

                      if(weight != "" && feet != "" && inchs != ""){
                        var iwt = int.parse(weight);
                        var ift = int.parse(feet);
                        var iinch = int.parse(inchs);

                        var tinch = (ift * 12) + iinch;
                        var tcm = tinch * 2.54;
                        var tm = tcm/100;

                        var bmi = iwt / pow(tm, 2);

                        var msg = "";

                        if(bmi > 25){
                          msg = "You're OverWeight!";
                          bgColor = Colors.orange.shade200;
                        }
                        else if(bmi < 18)
                        {
                          msg = "You're UnderWeight";
                          bgColor = Colors.red.shade200;
                        }
                        else{
                          msg = "You're Fit";
                          bgColor = Colors.green.shade200;
                        }
                        setState(() {
                          result = "$msg \n The BMI is ${bmi.toStringAsFixed(3)}";
                        });
                      }
                      else{
                        setState(() {
                          result = "Please fill all field !!";
                        });
                      }

                    }, child: Text("Calculate", style: TextStyle(fontSize: 20),)),
                    SizedBox(height: 10,),
                    Text(result, style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),
            ),
          )

      );
    }
  }



