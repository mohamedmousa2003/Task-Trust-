import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../di/injectable.dart';
import '../../domain/repositories/cart_repo.dart';
import '../data_sources/cart_data_source.dart';
import '../models/add_cart.dart';
import '../models/delete_cart.dart';
import '../models/get_cart.dart';

@Injectable(as: GetCartRepo)
class GetCartRepoImpl implements GetCartRepo {

  @override
  Future<Either<AppFailures, GetCartModel>> getCart() async {
    try {
      final result = await getIt<GetCartDataSource>().getCart();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<AppFailures, AddCart>> addToCart(AddCart cart) async{
    try {
      final result = await getIt<GetCartDataSource>().addToCart(cart);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<AppFailures, DeleteCart>> deleteFromCart(DeleteCart deleteCart) async{
    try {
      final result = await getIt<GetCartDataSource>().deleteFromCart(deleteCart);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}



