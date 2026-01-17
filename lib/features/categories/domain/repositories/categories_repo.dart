import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failures.dart';
import '../../data/models/categories_dto.dart';

abstract  class GetCategoriesRepo{

  Future<Either<AppFailures,List<DtoCategories>>> getCategories();
}