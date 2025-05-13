import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_first/pages/add_data_page.dart';
import 'package:provider_first/pages/list_page.dart';
import 'package:provider_first/provider/counter_provider.dart';
import 'package:provider_first/provider/list_map_provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: MyApp(),
    ),
  );
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
      home: ListPage()
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
        
        builder: (ctx,counterProvider, __) {
          // in builder we passed three parameters context, counterProvider and child
           // context: the current BuildContext
          // counterProvider: the current value from the provider
         // child: an optional constant child widget to prevent rebuilds
          print("Consumer called");
          return Text(
          '${counterProvider.getCount()}',
          // '${ctx.watch<CounterProvider>().getCount()}',
          // return Text(
            //  '${Provider.of<CounterProvider>(ctx, listen: true).counter}',
          style: TextStyle(
            fontSize: 25,
            color: Colors.red,
          ),);
        },
      ),
     ),
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
         FloatingActionButton(
        onPressed: ()
        {
          Provider.of<CounterProvider>(context,listen: false).increment(); // Always listen false
        },
        child: Icon(Icons.add),
        ),
         FloatingActionButton(
        onPressed: ()
        {
          Provider.of<CounterProvider>(context,listen: false).decrement(); // Always listen false
        },
        child: Icon(Icons.remove),
        ),
      ]
    ),
    );
  }
}