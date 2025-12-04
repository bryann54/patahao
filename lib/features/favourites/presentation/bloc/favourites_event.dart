// lib/features/favourites/presentation/bloc/favourites_event.dart

part of 'favourites_bloc.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class ListFavouritesEvent extends FavouritesEvent {}

class AddFavouriteEvent extends FavouritesEvent {
  final PropertyResult model;

  const AddFavouriteEvent({required this.model});

  @override
  List<Object> get props => [model];
}

class DeleteFavouriteEvent extends FavouritesEvent {
  final PropertyResult model;

  const DeleteFavouriteEvent({required this.model});

  @override
  List<Object> get props => [model];
}

class CheckIfFavEvent extends FavouritesEvent {
  final PropertyResult property;

  const CheckIfFavEvent({required this.property});

  @override
  List<Object> get props => [property];
}
