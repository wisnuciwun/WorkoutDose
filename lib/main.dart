import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF99FF99),
        accentColor: Colors.green),
    home: App(),
  ));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List workouts = [];
  String newWorkout = "";

  onAddWorkout(value) {
    setState(() {
      workouts.add(value);
    });
  }

  onRemoveWorkout(value) {
    setState(() {
      workouts.removeAt(value);
    });
  }

  @override
  void initState() {
    workouts.add("item1");
    workouts.add("item2");
    workouts.add("item3");
    workouts.add("item4");
    workouts.add("item5");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout list"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(20, 20))),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          onAddWorkout(newWorkout);
                          Navigator.of(context)
                              .pop(); //to pop down the alert dialog
                        },
                        child: Text("Add"))
                  ],
                  title: Text('Add workout'),
                  content: TextField(
                    onChanged: (String value) {
                      newWorkout = value;
                    },
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (BuildContext context, int id) {
          return Dismissible(
            //can delete list with swipe
            key: Key(workouts[id]),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                trailing: IconButton(
                    onPressed: () {
                      onRemoveWorkout(id);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    )),
                title: Text(workouts[id]),
              ),
            ),
          );
        },
      ),
    );
  }
}
