import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../data/models/categories_dto.dart';
import '../repositories/categories_repo.dart';


@injectable
class GetCategoriesUseCase {

  GetCategoriesRepo getCategoriesRepo;
  GetCategoriesUseCase(this.getCategoriesRepo);

  Future<Either<AppFailures, List<DtoCategories>>> call(){
    return getCategoriesRepo.getCategories();
  }

}
