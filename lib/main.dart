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
    print('build method called');
    // this method is called when the widget is built
    return Scaffold(
      appBar:AppBar(
      title: Text('Home'),
    ),
    body: Center(
      // child: Text('${Provider.of<CounterProvider>(context,listen: true).getCount()}',
      // this is the way to access the provider and when you use listen: true, it will rebuild the widget when the value changes
      // it rebuild the whole UI of your homepage but you have to change only the text for it we have to use consumer
      child: Consumer<CounterProvider>(
        builder: (context, counterProvider, child) {
          // in builder we passed three parameters context, counterProvider and child
          // context is the build context of the widget
          // counterProvider is the instance of the CounterProvider class
          // child is the child widget that we can use to avoid rebuilding the widget
          return Text('${counterProvider.getCount()}',
          style: TextStyle(
            fontSize: 25,
            color: Colors.red,
          ),);
        },
      ),
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