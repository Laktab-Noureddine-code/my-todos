import "package:flutter/material.dart";

class Todo extends StatefulWidget {
  const Todo({super.key});
  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final task = TextEditingController();
  final searchValue = TextEditingController();
  List<String> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO List"), backgroundColor: Colors.blue),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchValue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Search...",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (searchValue.text != "") {
                        tasks = tasks
                            .where((n) => n == searchValue.text)
                            .toList();
                      }
                    });
                  },
                  child: Icon(Icons.search),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: task,
                    decoration: InputDecoration(
                      labelText: "Entrer Votre Task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (task.text != "") {
                        tasks.add(task.text);
                        task.clear();
                      }
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
