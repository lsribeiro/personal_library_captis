import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_library_captis/core/constants/individual_type.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {},
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
}
