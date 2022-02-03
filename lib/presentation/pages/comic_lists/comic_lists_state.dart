part of 'comic_lists_cubit.dart';

@immutable
class ComicListsState extends Equatable {
  final List<ComicList>? lists;
  final List<bool>? checkedLists;

  ComicListsState({this.lists, this.checkedLists});

  @override
  // TODO: implement props
  List<Object?> get props => [lists, checkedLists];

  ComicListsState copyWith({
    List<ComicList>? lists,
    List<bool>? checkedLists,
  }) {
    return ComicListsState(
      lists: lists ?? this.lists,
      checkedLists: checkedLists ?? this.checkedLists,
    );
  }
}
