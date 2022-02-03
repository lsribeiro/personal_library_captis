import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_library_captis/core/constants/individual_type.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';
import 'package:personal_library_captis/presentation/pages/comic_lists/comic_lists_page.dart';
import 'package:personal_library_captis/presentation/pages/info/info_cubit.dart';

class InfoPage extends StatelessWidget {
  final dynamic entity;

  const InfoPage({Key? key, this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfoCubit(),
      child: InfoView(
        entity: this.entity,
      ),
    );
  }
}

class InfoView extends StatefulWidget {
  final dynamic entity;

  const InfoView({Key? key, this.entity}) : super(key: key);

  @override
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  void initState() {
    context.read<InfoCubit>().getInfo(widget.entity);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Info Page"),
        actions: [
          if (widget.entity is Comic)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicListsPage(comic: widget.entity as Comic),
                    ),
                  );
                },
                child: Icon(
                  Icons.add,
                  size: 32.0,
                ),
              ),
            ),
        ],
      ),
      body: Container(
        child: BlocBuilder<InfoCubit, InfoState>(
          builder: (context, state) {
            return entityWidget(state.entity);
          },
        ),
        // child:
      ),
    );
  }

  Widget entityWidget(dynamic entity) {
    switch (entity.runtimeType) {
      case Comic:
        print("Comic");
        final comic = entity as Comic;
        return Column(
          children: [
            Image.network(comic.thumbnail),
            Text(comic.title),
            if (comic.description != null) Text(comic.description ?? ""),
          ],
        );
        break;
      case Individual:
        print("Individual");
        final individual = entity as Individual;
        return Column(
          children: [
            if (individual.thumbnail != null) Image.network(individual.thumbnail ?? ""),
            Text(individual.name),
          ],
        );
        break;
    }

    return SizedBox.shrink();
  }

  Future<void> _showSelectComicListsDialog(
    BuildContext _context,
    List<ComicList>? lists,
    List<bool>? checkedLists,
    void Function(List<ComicList>) addComicToComicLists,
    void Function(int) checkComic,
  ) {
    InfoCubit infoCubit = BlocProvider.of<InfoCubit>(context);
    return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        final dialog = SimpleDialog(
          title: Text("Comic Lists"),
          children: [
            // comicListView(infoCubit.state.lists, infoCubit.state.checkedLists),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Add"),
                ),
              ],
            )
          ],
        );

        return BlocProvider<InfoCubit>.value(
          value: infoCubit,
          child: dialog,
        );
      },
    );
  }
}
