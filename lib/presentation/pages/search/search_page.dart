import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_library_captis/domain/constants/search_types.dart';
import 'package:personal_library_captis/presentation/pages/search/search_cubit.dart';
import 'package:personal_library_captis/presentation/widgets/bottom_navigation/bottom_navigation_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Search Page"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () => print("Search"),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
            ),
            searchOptionBar,
            Expanded(
              child: GridView.count(
                childAspectRatio: 300 / 450,
                // childAspectRatio: itemWidth / itemHeight,
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(100, (index) {
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_uncanny.jpg"),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Text("Spider-Man"),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationWidget(
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }

  Widget get searchOptionBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        searchOption("Comics", SearchTypes.comics),
        searchOption("Characters", SearchTypes.characters),
        searchOption("Creators", SearchTypes.creators),
      ],
    );
  }

  Widget searchOption(String text, SearchTypes option) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: state.getSearchOptionValue(option),
              onChanged: (newValue) {
                context.read<SearchCubit>().toggleSearchOption(option);
              },
            ),
            Text(text),
          ],
        );
        //
      },
    );
  }
}
