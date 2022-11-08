import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database.dart';
import 'package:todo_app/dialod_box.dart';
import 'package:todo_app/todotile.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _myBox = Hive.box("mybox");
  final _controller = TextEditingController();

  final searchController = TextEditingController();
  ToDoDatabase db = ToDoDatabase();
  // List todoList = [];

  void clickbox(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controllerr: _controller,
          OnSave: saveNewTask,
        );
      },
    );
  }

  void delete(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TODO App "),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return createNewTask();
        },
        backgroundColor: Colors.yellow.shade600,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          
           
             
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
               
                return ToDoTile(
                  deleteFunction: (p0) {
                    return delete(index);
                  },
                  // deleteFunction: (p0) {
                  //   setState(() {
                  //     db.todoList.removeAt(index);
                  //   });
                  //   db.updateDatabase();
                  // },
                  taskName: db.todoList[index][0].toString(),
                  isCOmpleted: db.todoList[index][1] ?? false,
                  onChanged: (value) {
                    return clickbox(value, index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const TextField(
      // onChanged: (value) => _runFilter(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
      ),
    ),
  );
}
