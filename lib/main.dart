import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
 
  int _count=0; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text('Home'),
    ),
    body: Center(
      child: Text('$_count',style: TextStyle(
        fontSize: 25,
        color: Colors.red,
      ),),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: ()
      {
        
      },
      child: Icon(Icons.add),
      ),
    );
  }
}