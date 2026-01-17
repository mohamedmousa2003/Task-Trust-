import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:task_trust_development/di/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../data/models/categories_dto.dart';
import '../../domain/use_cases/cetCategories_use_case.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {

  CategoriesCubit() : super(const CategoriesInitial());

  Future<void> fetchCategories() async {


    final result = await getIt<GetCategoriesUseCase>().call();

    result.fold(
          (failure) => emit(CategoriesError(failure)), // AppFailures
          (data) {
        if (data.isEmpty) {
          emit(const CategoriesEmpty());
        } else {
          emit(CategoriesLoaded(data));
        }
      },
    );
  }
}
