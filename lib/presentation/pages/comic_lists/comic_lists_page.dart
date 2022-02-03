import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/presentation/pages/comic_lists/comic_lists_cubit.dart';

class ComicListsPage extends StatelessWidget {
  final Comic comic;
  const ComicListsPage({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComicListsCubit(),
      child: ComicListsView(comic: comic,),
    );
  }
}

class ComicListsView extends StatefulWidget {
  final Comic comic;
  const ComicListsView({Key? key, required this.comic}) : super(key: key);

  @override
  _ComicListsViewState createState() => _ComicListsViewState();
}

class _ComicListsViewState extends State<ComicListsView> {
  @override
  void initState() {
    context.read<ComicListsCubit>().getComicLists(widget.comic.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Comic Lists"),
        leading: InkWell(
          onTap: () {
            context.read<ComicListsCubit>().addComicToComicLists(widget.comic);
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<ComicListsCubit, ComicListsState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.lists?.length ?? 0,
            itemBuilder: (context, index) {
              if (state.lists != null) {
                final comic = state.lists![index];
                return Row(
                  children: [
                    Checkbox(
                      value: state.checkedLists![index],
                      onChanged: (value) {
                        context.read<ComicListsCubit>().toggleComicList(index);
                      },
                    ),
                    Text(comic.name),
                  ],
                );
              }
              return SizedBox.shrink();
            },
          );
          return Container(
            child: comicListView(state.lists, state.checkedLists),
          );
        },
      ),
    );
  }

  Widget comicListView(
    List<ComicList>? comicLists,
    List<bool>? checkedLists,
  ) {
    final _widgetList = <Widget>[];

    print("COMIC LIST VIEW ${comicLists?.length}");
    print(checkedLists);

    if (comicLists != null && checkedLists != null) {
      for (var i = 0; i < comicLists.length; i++) {
        final comic = comicLists[i];

        _widgetList.add(
          Row(
            children: [
              BlocBuilder<ComicListsCubit, ComicListsState>(
                builder: (context, state) {
                  print(state.checkedLists);
                  return Checkbox(
                    value: state.checkedLists![i],
                    onChanged: (value) {
                      context.read<ComicListsCubit>().toggleComicList(i);
                    },
                  );
                },
              ),
              Text(comic.name),
            ],
          ),
        );
      }
    }

    return Column(
      children: _widgetList,
    );
  }
}
