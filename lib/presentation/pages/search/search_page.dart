import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_library_captis/domain/constants/search_types.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';
import 'package:personal_library_captis/presentation/pages/search/search_cubit.dart';
import 'package:personal_library_captis/presentation/widgets/bottom_navigation/bottom_navigation_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: SearchView(),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
                  suffixIcon: BlocBuilder<SearchCubit, SearchState>(
                    builder: (BuildContext context, state) {
                      return InkWell(
                        onTap: () {
                          context.read<SearchCubit>().executeQuery();
                        },
                        child: Icon(Icons.search, color: Colors.grey),
                      );
                    },
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
            Expanded(child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return GridView.count(
                  childAspectRatio: 300 / 450,
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: buildSearchCards(state.searchResults),
                );
              },
            )),
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

  Widget comicCard(Comic comic) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(comic.thumbnail),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            child: Text(comic.title),
          )
        ],
      ),
    );
  }

  Widget individualCard(Individual individual) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(individual.thumbnail),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            child: Text(individual.name),
          )
        ],
      ),
    );
  }

  List<Widget> buildSearchCards(List<dynamic> searchResults) {
    final widgets = <Widget>[];
    searchResults.forEach((element) {
      if (element is Comic) {
        widgets.add(comicCard(element));
      }
      if (element is Individual) {
        widgets.add(individualCard(element));
      }
    });

    return widgets;
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
