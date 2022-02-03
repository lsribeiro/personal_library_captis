import 'package:flutter/material.dart';
import 'package:personal_library_captis/presentation/widgets/bottom_navigation/bottom_navigation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home Page"),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            leading: Icon(Icons.list),
            title: Text("List 1"),
            children: [
              ListTile(
                leading: Icon(Icons.book),
                title: Text("List number one"),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).restorablePush(_dialogBuilder);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _selectedIndex,
      ),
    );
  }

  static Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: Text("Create your comic list"),
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Comic list name"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () => print("Cancel"),
                child: Text("Cancel", style: TextStyle(color: Colors.white),),
                color: Colors.grey,
              ),
              MaterialButton(
                onPressed: () => print("Create"),
                child: Text("Create", style: TextStyle(color: Colors.white),),
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
