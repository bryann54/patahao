// lib/features/favourites/presentation/bloc/favourites_state.dart

part of 'favourites_bloc.dart';

abstract class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object?> get props => [];
}

class FavouritesInitial extends FavouritesState {}

class LoadingFavourites extends FavouritesState {
  final PropertyResult? property;

  const LoadingFavourites({this.property});

  @override
  List<Object?> get props => [property];
}

class LoadFavouritesError extends FavouritesState {
  final String error;

  const LoadFavouritesError({required this.error});

  @override
  List<Object> get props => [error];
}

class LoadFavouritesSuccess extends FavouritesState {
  final List<PropertyResult> favs;

  const LoadFavouritesSuccess({required this.favs});

  @override
  List<Object> get props => [favs];
}

class DeleteFavouritesSuccess extends FavouritesState {
  final List<PropertyResult> favs;

  const DeleteFavouritesSuccess({required this.favs});

  @override
  List<Object> get props => [favs];
}

class DeleteFavouriteError extends FavouritesState {
  final String error;

  const DeleteFavouriteError({required this.error});

  @override
  List<Object> get props => [error];
}

class AddFavouritesSuccess extends FavouritesState {
  final List<PropertyResult> favs;

  const AddFavouritesSuccess({required this.favs});

  @override
  List<Object> get props => [favs];
}

class AddFavouritesError extends FavouritesState {
  final String error;

  const AddFavouritesError({required this.error});

  @override
  List<Object> get props => [error];
}

class CheckIfFavSuccess extends FavouritesState {
  final PropertyResult property;
  final bool isFav;

  const CheckIfFavSuccess({required this.property, required this.isFav});

  @override
  List<Object> get props => [property, isFav];
}

class CheckIfFavError extends FavouritesState {
  final String error;

  const CheckIfFavError({required this.error});

  @override
  List<Object> get props => [error];
}
