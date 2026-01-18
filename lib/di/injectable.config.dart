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
import '../features/cart/data/data_sources/cart_data_source.dart' as _i372;
import '../features/cart/data/data_sources/cart_data_source_impl.dart' as _i658;
import '../features/cart/data/repositories/cart_repo_impl.dart' as _i234;
import '../features/cart/domain/repositories/cart_repo.dart' as _i414;
import '../features/cart/domain/use_cases/add_cart_use_case.dart' as _i755;
import '../features/cart/domain/use_cases/delete_use_case.dart' as _i462;
import '../features/cart/domain/use_cases/get_cart_use_case.dart' as _i1030;
import '../features/cart/presentation/viow_model/cubit/add_to_cart_cubit.dart'
    as _i469;
import '../features/cart/presentation/viow_model/cubit/get_cart_cubit.dart'
    as _i901;
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
    gh.factory<_i755.AddCartUseCase>(() => _i755.AddCartUseCase());
    gh.factory<_i462.DeleteUseCase>(() => _i462.DeleteUseCase());
    gh.factory<_i1030.GetCartUseCase>(() => _i1030.GetCartUseCase());
    gh.factory<_i901.GetCartCubit>(() => _i901.GetCartCubit());
    gh.factory<_i1018.CategoriesCubit>(() => _i1018.CategoriesCubit());
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i448.CategoriesDataSource>(
      () => _i705.CategoriesDataSourceImpl(),
    );
    gh.factory<_i414.GetCartRepo>(() => _i234.GetCartRepoImpl());
    gh.factory<_i372.GetCartDataSource>(() => _i658.GetCartDataSourceImpl());
    gh.factory<_i469.AddToCartCubit>(
      () => _i469.AddToCartCubit(gh<_i755.AddCartUseCase>()),
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
