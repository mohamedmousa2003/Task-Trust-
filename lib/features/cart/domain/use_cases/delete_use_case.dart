import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../../di/injectable.dart';
import '../../data/models/delete_cart.dart';
import '../repositories/cart_repo.dart';

@injectable
class DeleteUseCase {

  Future<Either<AppFailures, DeleteCart>> call(DeleteCart deleteCart){
    return getIt<GetCartRepo>().deleteFromCart(deleteCart);
  }
}