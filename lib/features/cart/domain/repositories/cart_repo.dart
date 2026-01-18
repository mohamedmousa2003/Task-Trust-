import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failures.dart';
import '../../data/models/add_cart.dart';
import '../../data/models/delete_cart.dart';
import '../../data/models/get_cart.dart';

abstract interface class GetCartRepo {
  Future<Either<AppFailures,GetCartModel>> getCart();
  Future<Either<AppFailures,AddCart>> addToCart(AddCart cart);

  Future<Either<AppFailures,DeleteCart>> deleteFromCart(DeleteCart deleteCart);

}