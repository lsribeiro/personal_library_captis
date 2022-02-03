part of 'info_cubit.dart';

@immutable
class InfoState extends Equatable {
  final dynamic entity;

  InfoState({this.entity});

  @override
  // TODO: implement props
  List<Object?> get props => [entity];

  InfoState copyWith({
    dynamic entity,
  }) {
    return InfoState(
      entity: entity ?? this.entity,
    );
  }
}
