import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Animated list'),
          centerTitle: true,
        ),
        body: const CustomAnimadedList(),
      ),
    );
  }
}

class CustomAnimadedList extends StatefulWidget {
  const CustomAnimadedList({super.key});

  @override
  State<CustomAnimadedList> createState() => _CustomAnimadedListState();
}

class _CustomAnimadedListState extends State<CustomAnimadedList> {
  List<int> items = [];
  final GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
              controller: controller,
              key: key,
              initialItemCount: items.length,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: AnimationCardItem(
                    onDelete: () {
                      deleteItem(index);
                    },
                    itemNumber: items[index],
                  ),
                );
              }),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue
          ),
          onPressed: () {
            addItem(items.length +1);
          },
          child: const Text(
            'add',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ],
    );
  }

  void addItem(int itemNumber) {
    var index = items.length;
    items.add(itemNumber);

    key.currentState!.insertItem(index);
    Future.delayed(const Duration(milliseconds: 300), () {
      controller.animateTo(controller.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  void deleteItem(int index) {
    final removedItem = items.removeAt(index);
    key.currentState?.removeItem(index, (context, animation) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ).animate(animation),
        child: AnimationCardItem(itemNumber: removedItem, onDelete: () {}),
      );
    });
  }
}

class AnimationCardItem extends StatelessWidget {
  const AnimationCardItem(
      {super.key, required this.itemNumber, required this.onDelete});
  final int itemNumber;

  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.red,
        ),
        title: Text('item $itemNumber'),
        subtitle: const Text('ramy on fire'),
        trailing:
            IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
      ),
    );
  }
}
