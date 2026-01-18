import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/add_cart.dart';
import '../../../domain/use_cases/add_cart_use_case.dart';
import '../state/add_to_cart_state.dart';

@injectable
class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.addCartUseCase)
      : super(AddToCartInitial());

  final AddCartUseCase addCartUseCase;

  Future<void> addCart(AddCart addCart) async {
    emit(AddToCartLoading());

    final result = await addCartUseCase(addCart);

    result.fold(
          (failure) {
        emit(AddToCartError(failure.message));
      },
          (data) {
        emit(AddToCartSuccess(data));
      },
    );
  }
}

