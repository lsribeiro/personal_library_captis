import 'package:get_it/get_it.dart';
import 'package:personal_library_captis/data/data_sources/local/comic_list_data_source.dart';
import 'package:personal_library_captis/data/data_sources/remote/search_data_source.dart';
import 'package:personal_library_captis/data/repositories/comic_list_repository_impl.dart';
import 'package:personal_library_captis/data/repositories/search_repository_impl.dart';
import 'package:personal_library_captis/domain/usecases/comcic_list/create_comic_list_use_case.dart';
import 'package:personal_library_captis/domain/usecases/comcic_list/get_comic_lists_use_case.dart';
import 'package:personal_library_captis/domain/usecases/search/search_characters_use_case.dart';
import 'package:personal_library_captis/domain/usecases/search/search_comics_use_case.dart';
import 'package:personal_library_captis/domain/usecases/search/search_creators_use_case.dart';
import 'package:personal_library_captis/presentation/pages/search/search_cubit.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => SearchCubit());

  sl.registerLazySingleton(() => SearchComicsUseCase(sl()));
  sl.registerLazySingleton(() => SearchCharactersUseCase(sl()));
  sl.registerLazySingleton(() => SearchCreatorsUseCase(sl()));
  sl.registerLazySingleton(() => GetComicListsUseCase(sl()));
  sl.registerLazySingleton(() => CreateComicListUseCase(sl()));

  sl.registerLazySingleton<SearchRepositoryImpl>(
    () => SearchRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<ComicListRepositoryImpl>(
        () => ComicListRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<SearchDataSource>(
        () => SearchDataSource(),
  );

  sl.registerLazySingleton<ComicListDataSource>(
        () => ComicListDataSource(),
  );
}
