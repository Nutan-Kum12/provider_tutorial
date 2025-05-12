import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_first/provider/counter_provider.dart';

void main() {
  runApp(MyApp());
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
      home: ChangeNotifierProvider(create: (_) => CounterProvider(),
        child: MyHomePage(), // this is the home page of the app
      ),
    ); 
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text('Home'),
    ),
    body: Center(
      child: Text('${Provider.of<CounterProvider>(context,listen: true).getCount()}',style: TextStyle(
        fontSize: 25,
        color: Colors.red,
      ),),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: ()
      {
        Provider.of<CounterProvider>(context,listen: false).increment(); // Always listen false
      },
      child: Icon(Icons.add),
      ),
    );
  }
}