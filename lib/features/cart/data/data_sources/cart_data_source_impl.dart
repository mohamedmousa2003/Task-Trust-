import 'package:injectable/injectable.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../../../../di/injectable.dart';
import '../models/add_cart.dart';
import '../models/delete_cart.dart';
import '../models/get_cart.dart';
import 'cart_data_source.dart';

@Injectable(as: GetCartDataSource)
class GetCartDataSourceImpl implements GetCartDataSource {

  @override
  Future<GetCartModel> getCart() async {
    try {
      final response = await getIt<ApiManager>().getData(
        endPoint: EndPoints.getORAddCart,
        param: {
          "guest_id": EndPoints.guestId,
        },
      );

      return GetCartModel.fromJson(response.data);

    } catch (e) {
      throw Exception("Error fetching cart: $e");
    }
  }

  @override
  Future<AddCart> addToCart(AddCart model) async {
    try{
    final response = await getIt<ApiManager>().postData(
      endPoint: EndPoints.getORAddCart,
      body: model.toJson(),
    );

    return AddCart.fromJson(response.data);
  } catch (e) {
      throw Exception("Error adding to cart: $e");
    }
  }

  @override
  Future<DeleteCart> deleteFromCart(DeleteCart deleteCart) async{
    try{
      final response = await getIt<ApiManager>().deleteData(
          endPoint: EndPoints.cart,
        body:  deleteCart.toJson(),
      );

      return DeleteCart.fromJson(response.data);
    } catch (e) {
  throw Exception("Error adding to cart: $e");
  }


  }

}
