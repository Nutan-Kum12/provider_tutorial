import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_first/pages/add_data_page.dart';
import 'package:provider_first/provider/list_map_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: Consumer<ListMapProvider>(
        builder: (ctx, provider, child) {
          var allItems = provider.getItem();
          return allItems.isEmpty
              ? const Center(
                  child: Text('No items found'),
                )
              : ListView.builder(
                  itemCount: allItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(allItems[index]['name']),
                      subtitle: Text(allItems[index]['value']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // 👈 Add this to avoid overflow
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              provider.removeItem(index);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit), // Changed to edit icon for update
                            onPressed: () {
                              provider.updateItem(index, {
                                'name':'Updated ${DateTime.now().millisecondsSinceEpoch}',
                                'value': (index + 1).toString(),
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddDataPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
