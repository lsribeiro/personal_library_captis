import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/presentation/pages/home/home_cubit.dart';
import 'package:personal_library_captis/presentation/widgets/bottom_navigation/bottom_navigation_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final int _selectedIndex = 0;

  @override
  void initState() {
    context.read<HomeCubit>().getComicLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home Page"),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ListView(
            children: comicListWidget(state.lists),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateComicListDialog(context, (name) {
            context.read<HomeCubit>().createComicList(name);
          });
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _selectedIndex,
      ),
    );
  }

  List<Widget> comicListWidget(List<ComicList> comicList) {
    final widgetList = <Widget>[];

    comicList.forEach((e) {
      final childrenList = <Widget>[];

      e.comics.forEach((element) {
        childrenList.add(
          ListTile(
            leading: Icon(Icons.book),
            title: Text(element.title),
          ),
        );
      });

      widgetList.add(
        ExpansionTile(
          leading: Icon(Icons.list),
          title: Text(e.name),
          children: childrenList,
        ),
      );
    });

    return widgetList;
  }

  static Future<void> _showCreateComicListDialog(
      BuildContext _context, void Function(String) createComicList) {
    final _newComicListController = TextEditingController();

    return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Create your comic list"),
          children: [
            TextField(
              controller: _newComicListController,
              decoration: InputDecoration(hintText: "Comic list name"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.grey,
                ),
                MaterialButton(
                  onPressed: () {
                    if (_newComicListController.text.isNotEmpty) {
                      createComicList(_newComicListController.text);
                    }
                  },
                  child: Text(
                    "Create",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.grey,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
