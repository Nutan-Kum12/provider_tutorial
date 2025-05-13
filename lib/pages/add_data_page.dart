import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_first/provider/list_map_provider.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: Center(
        child: IconButton(onPressed: ()
        {
            context.read<ListMapProvider>().addItem({
            'name': 'Item ${DateTime.now().millisecondsSinceEpoch}',
            'value': "1",
          });
        }, icon:Icon(Icons.add)),
      ),
    );
  }
}