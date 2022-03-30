// ignore_for_file: deprecated_member_use

import 'dart:html';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> _food_objects = [
    {
      'id': 1,
      'food': 'Rice with hotdogs',
      'image': 'rice_w_h.jpg',
      'price': 'K34'
    },
    {
      'id': 2,
      'food': 'Rice with potatoes',
      'image': 'rice_w_p.jpeg',
      'price': 'K34'
    },
    {
      'id': 3,
      'food': 'Rice with nothing',
      'image': 'rice_w_n.jpeg',
      'price': 'K34'
    },
    {
      'id': 4,
      'food': 'Rice with chilli',
      'image': 'rice_w_c.jpg',
      'price': 'K34'
    },
    {
      'id': 5,
      'food': 'Rice with tomato source',
      'image': 'rice_w_t.jpeg',
      'price': 'K34'
    },
    {
      'id': 5,
      'food': 'Rice with tomato source',
      'image': 'rice_w_t.jpeg',
      'price': 'K34'
    },
    {
      'id': 5,
      'food': 'Rice with tomato source',
      'image': 'rice_w_t.jpeg',
      'price': 'K34'
    },
    {
      'id': 5,
      'food': 'Rice with tomato source',
      'image': 'rice_w_t.jpeg',
      'price': 'K34'
    },
    {
      'id': 5,
      'food': 'Rice with tomato source',
      'image': 'rice_w_t.jpeg',
      'price': 'K34'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
        children: [
          // 1. for image in header
          FittedBox(
          fit: BoxFit.fitWidth,
          child: Image.asset(
            'assets/images/fruits.jpeg'
          ,)
          ),
          
          // for food listing
          Container(
            alignment: FractionalOffset.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BackButton(
                onPressed: () {  },
                ),
                const Text('My Basket', style: TextStyle(color: Color(0xFF2E3233), fontWeight: FontWeight.bold, fontSize: 24),),
                const Text('K176.00', style: TextStyle(color: Color(0xFF2E3233), fontWeight: FontWeight.bold, fontSize: 24),),
              ],
            ),
          ), 

          Align(alignment: Alignment.topRight, child: Container()),
          Column(
            children: _food_objects.map((element) => Card(
            child: Row(
              children: [
                Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromARGB(255, 49, 45, 45),
                    ),
                    child: Image.asset("assets/images/rice_w_h.jpg", width: 70, height: 70,),
                  ),
                ),
                Row(
                  children: const [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("Rice", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),],
                ) 
              ],
            ),
          )).toList()
          ),

          
        ],
      ))
    );
  }
}
