part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object?> get props => [];
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
}

class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

class CategoriesLoaded extends CategoriesState {
  final List<DtoCategories> categories;
  const CategoriesLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class CategoriesEmpty extends CategoriesState {
  const CategoriesEmpty();
}

class CategoriesError extends CategoriesState {
  final AppFailures failure;
  const CategoriesError(this.failure);

  @override
  List<Object?> get props => [failure];
}
