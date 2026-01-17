// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../features/categories/data/data_sources/categorie_data_source.dart'
    as _i448;
import '../features/categories/data/data_sources/categories_data_source_impl.dart'
    as _i705;
import '../features/categories/data/repositories/categories__repoimple.dart'
    as _i32;
import '../features/categories/domain/repositories/categories_repo.dart'
    as _i590;
import '../features/categories/domain/use_cases/cetCategories_use_case.dart'
    as _i779;
import '../features/categories/presentation/cubit/categories_cubit.dart'
    as _i1018;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i1018.CategoriesCubit>(() => _i1018.CategoriesCubit());
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i448.CategoriesDataSource>(
      () => _i705.CategoriesDataSourceImpl(),
    );
    gh.factory<_i590.GetCategoriesRepo>(
      () => _i32.GetCategoriesRepoImpl(gh<_i448.CategoriesDataSource>()),
    );
    gh.factory<_i779.GetCategoriesUseCase>(
      () => _i779.GetCategoriesUseCase(gh<_i590.GetCategoriesRepo>()),
    );
    return this;
  }
}
