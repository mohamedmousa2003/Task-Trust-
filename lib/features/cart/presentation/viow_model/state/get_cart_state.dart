part of '../cubit/get_cart_cubit.dart';

@immutable
sealed class GetCartState extends Equatable {
const GetCartState();
@override
List<Object?> get props => [];
}


final class GetCartInitial extends GetCartState {}


class GetCartLoading extends GetCartState {
  const GetCartLoading();
}


class GetCartLoaded extends GetCartState {
  final GetCartModel carts;
  const GetCartLoaded(this.carts );

  @override
  List<Object?> get props => [carts ];
}

 class DeleteCartLoaded extends GetCartState {
  final DeleteCart deleted;
  const DeleteCartLoaded(this.deleted);

  @override
  List<Object?> get props => [deleted];
}

class GetCartError extends GetCartState {
  final String message;

  const GetCartError(this.message);

  @override
  List<Object?> get props => [message];
}


class GetCartEmpty extends GetCartState {
  const GetCartEmpty();
}

