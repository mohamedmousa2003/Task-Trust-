import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../domain/repositories/categories_repo.dart';
import '../data_sources/categorie_data_source.dart';
import '../models/categories_dto.dart';


@Injectable(as: GetCategoriesRepo)
class GetCategoriesRepoImpl implements GetCategoriesRepo {
  final CategoriesDataSource categoriesDataSource;

  GetCategoriesRepoImpl(this.categoriesDataSource);

  @override
  Future<Either<AppFailures, List<DtoCategories>>> getCategories() async {
    try {
      final result = await categoriesDataSource.getCategories();
      return result;
    } catch (e) {
      // Catch any unexpected exception
      return Left(UnknownFailure(e.toString()));
    }
  }
}
