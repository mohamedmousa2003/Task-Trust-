import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../di/injectable.dart';
import '../../data/models/add_cart.dart';
import '../repositories/cart_repo.dart';

@injectable
class AddCartUseCase {
  Future<Either<AppFailures, AddCart>> call(AddCart cart){
    return getIt<GetCartRepo>().addToCart(cart);
  }
}