part of 'navigation_bar_cubit.dart';
@immutable
sealed class NavigationBarState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class NavigationBarInitial extends NavigationBarState {}

final class NavigationBarChangeIndexState extends NavigationBarState {}