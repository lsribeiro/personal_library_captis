import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_library_captis/core/constants/individual_type.dart';
import 'package:personal_library_captis/domain/entities/comic.dart';
import 'package:personal_library_captis/domain/entities/individual.dart';
import 'package:personal_library_captis/core/di/injection_container.dart' as di;
import 'package:personal_library_captis/domain/usecases/info/get_character_use_case.dart';
import 'package:personal_library_captis/domain/usecases/info/get_comic_use_case.dart';
import 'package:personal_library_captis/domain/usecases/info/get_creator_use_case.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(InfoState());

  dynamic getInfo(dynamic entity) async {
    final _getCharacterUseCase = di.sl.get<GetCharacterUseCase>();
    final _getComicUseCase = di.sl.get<GetComicUseCase>();
    final _getCreatorUseCase = di.sl.get<GetCreatorUseCase>();

    switch (entity.runtimeType) {
      case Individual:
        final individual = entity as Individual;
        print("Is individual ${entity.type}");
        switch(individual.type) {
          case IndividualType.character:
            print("Is Character");
            final character = await _getCharacterUseCase.call(entity.id);
            print(character);
            emit(state.copyWith(entity: character));
            break;
          case IndividualType.creator:
            print("Is Creator");
            final creator = await _getCreatorUseCase.call(entity.id);
            print(creator);
            emit(state.copyWith(entity: creator));
            break;
          default:
            emit(state.copyWith(entity: null));
            break;
        }
        break;
      case Comic:
        final comic = await _getComicUseCase.call(entity.id);
        print(comic);
        emit(state.copyWith(entity: comic));
        break;
    }
  }
}
