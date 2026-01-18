import 'package:equatable/equatable.dart';
import '../../../data/models/add_cart.dart';

abstract class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object?> get props => [];
}

class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {
  final AddCart cart;

  const AddToCartSuccess(this.cart);

  @override
  List<Object?> get props => [cart];
}

class AddToCartError extends AddToCartState {
  final String message;

  const AddToCartError(this.message);

  @override
  List<Object?> get props => [message];
}
