import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../di/injectable.dart';
import '../../data/models/get_cart.dart';
import '../repositories/cart_repo.dart';

@injectable
class GetCartUseCase {
  Future<Either<AppFailures,GetCartModel>> call(){
    return getIt<GetCartRepo>().getCart();
  }
}