import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/end_points.dart';
import '../../../../../di/injectable.dart';
import '../../../data/models/delete_cart.dart';
import '../../../data/models/get_cart.dart';
import '../../../domain/use_cases/delete_use_case.dart';
import '../../../domain/use_cases/get_cart_use_case.dart';

part '../state/get_cart_state.dart';

@injectable
class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit() : super(GetCartInitial());

  getCart()async{
    emit(GetCartLoading());
    var product=await getIt<GetCartUseCase>().call();
    product.fold(
          (failure) {
        emit(GetCartError(failure.message));
      }, (data) {
      emit(GetCartLoaded(data,));
    },
    );
  }


  Future<void> updateQuantity({
    required num productId,
    required num quantity,
  }) async {
    emit(GetCartLoading());

    final result = await getIt<DeleteUseCase>().call(
      DeleteCart(
        guestId: EndPoints.guestId,
        productId: productId,
        quantity: quantity,
      ),
    );

    result.fold(
          (failure) {
        emit(GetCartError(failure.message));
      },
          (_) async {
        await getCart(); // refresh
      },
    );
  }


  delete(DeleteCart cart) async {
    emit(GetCartLoading());

    final result = await getIt<DeleteUseCase>().call(cart);

    result.fold(
          (failure) {
        emit(GetCartError(failure.message));
      },
          (data) async {
        await getCart();
      },
    );
  }

}
