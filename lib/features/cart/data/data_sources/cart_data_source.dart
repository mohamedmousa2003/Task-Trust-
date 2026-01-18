import '../models/add_cart.dart';
import '../models/delete_cart.dart';
import '../models/get_cart.dart';


abstract interface class GetCartDataSource {
  Future<GetCartModel> getCart();
  Future<AddCart> addToCart(AddCart model);
  Future<DeleteCart> deleteFromCart(DeleteCart deleteCart);
}
