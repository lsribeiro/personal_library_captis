part of 'info_cubit.dart';

@immutable
class InfoState extends Equatable {
  final dynamic entity;
  final List<ComicList>? lists;

  InfoState({this.entity, this.lists});

  @override
  // TODO: implement props
  List<Object?> get props => [entity, lists];

  InfoState copyWith({
    dynamic entity,
    List<ComicList>? lists,
  }) {
    return InfoState(
      entity: entity ?? this.entity,
      lists: lists ?? this.lists,
    );
  }
}
