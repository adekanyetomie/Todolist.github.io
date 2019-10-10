import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: new TodoList()
    );
  }
}
class TodoList extends StatefulWidget{
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList>{
  List todoElements = [];

  void addTodoElements(){
    setState(() {
      int index = todoElements.length;
      todoElements.add('Item ' + index.toString());
    });
  }
  Widget buildTodoList(){
    return new ListView.builder(
      itemBuilder: (context, index){
        if (index < todoElements.length){
          return buildTodoElement(todoElements[index]);
        }
      }

    );
  }
  Widget buildTodoElement( todo){
    return new ListTile(
      title: new Text(todo),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Todo List'),
        ),
        body: buildTodoList(),
        floatingActionButton: new FloatingActionButton(
          onPressed: addTodoElements,
          tooltip: 'Add Task',
          child: new Icon(Icons.add),
        ),
    );
  }
}

