part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  final List<ComicList> lists;

  HomeState({required this.lists});

  @override
  List<Object?> get props => [lists];
}
