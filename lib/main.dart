import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(200, 25, 20, 255)
          ),
      ),
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

  void addTodoElements(task){
    if (task.length >0){}
    setState(() => todoElements.add(task));
  }
  void modalDeleteElement(index){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return new AlertDialog(
          title: new Text('Have you completed "${todoElements[index]}" task?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Cancel?'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            new FlatButton(
              child: new Text('Completed'),
              onPressed: () {
                deleteTodoElements(index);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
  void deleteTodoElements(index){
    setState(()=> todoElements.removeAt(index));

  }
  Widget buildTodoList(){
    return new ListView.builder(
      itemBuilder: (context, index){
        if (index < todoElements.length){
          return buildTodoElement(todoElements[index], index);
        }
      }

    );
  }
  Widget buildTodoElement( todo, index){
    return new ListTile(
      title: new Text(todo),
      onTap: () => modalDeleteElement(index),
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
          onPressed: todoNewScreen,
          tooltip: 'Add Task',
          child: new Icon(Icons.add),
        ),
    );
  }
  void todoNewScreen(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Add a new task') ,
              ),
              body: new TextField(
                autocorrect: true,
                autofocus: true,
                onSubmitted: (value){
                  addTodoElements(value);
                  Navigator.pop(context);
                  decoration: new InputDecoration(
                    hintText: 'Enter your task here ...',
                    contentPadding: const EdgeInsets.all(12.0)
                  );
                },
                ),
            );
        }
      )
    );
  }
}

