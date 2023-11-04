import 'package:flutter/material.dart';
class AnimatedListHome extends StatefulWidget {
  const AnimatedListHome({super.key});

  @override
  State<AnimatedListHome> createState() => _AnimatedListHomeState();
}

class _AnimatedListHomeState extends State<AnimatedListHome> {
  final _itmes = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 23,),
            Expanded(
                child: AnimatedList(
              key: _key,
              initialItemCount: 0,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(key: UniqueKey(),
                    sizeFactor: animation,
                    child:myCard(context, index));
              },
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addItem(),
          child: const Icon(Icons.add),
        ));
  }

  Widget myCard(BuildContext context, int index) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.orange,
      child: ListTile(
        title: Text(
          _itmes[index],
          style: const TextStyle(fontSize: 25),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _removeItem(index);
          },
        ),
      ),
    );
  }

  void _addItem() {
    _itmes.insert(0, "Item ${_itmes.length + 1}");
    _key.currentState!.insertItem(
      0,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text("Deleted", style: TextStyle(fontSize: 24)),
          ),
        ),
      );
    });
    _itmes.removeAt(index);
  }
}
