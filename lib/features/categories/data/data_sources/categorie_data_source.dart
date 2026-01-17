import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failures.dart';
import '../models/categories_dto.dart';

abstract class CategoriesDataSource {
  Future<Either<AppFailures, List<DtoCategories>>> getCategories();
}
