import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_library_captis/domain/entities/comic_list.dart';
import 'package:personal_library_captis/core/di/injection_container.dart' as di;
import 'package:personal_library_captis/domain/usecases/auth/get_user_use_case.dart';
import 'package:personal_library_captis/domain/usecases/auth/sign_in_use_case.dart';
import 'package:personal_library_captis/domain/usecases/comcic_list/create_comic_list_use_case.dart';
import 'package:personal_library_captis/domain/usecases/comcic_list/get_comic_lists_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(lists: []));

  void getComicLists() async {
    final _getComicListsUseCase = di.sl.get<GetComicListsUseCase>();
    final _comicLists = await _getComicListsUseCase.call();

    emit(state.copyWith(lists: _comicLists));
  }

  void createComicList(String comicListName) async {
    final _createComicListUseCase = di.sl.get<CreateComicListUseCase>();
    final _getUser = di.sl.get<GetUserUseCase>();
    final _comicLists = await _createComicListUseCase.call(comicListName);

    final user = _getUser.call();

    print("USER: $user");

    emit(state.copyWith(lists: _comicLists));
  }
}
