// lib/features/properties/presentation/bloc/properties_state.dart

part of 'properties_bloc.dart';

abstract class PropertiesState extends Equatable {
  const PropertiesState();

  @override
  List<Object> get props => [];
}

class PropertiesInitial extends PropertiesState {}

class PropertiesLoadingState extends PropertiesState {}

class LoadingMore extends PropertiesState {}

class ListPropertiesSuccess extends PropertiesState {
  final List<PropertyResult> properties;

  const ListPropertiesSuccess({required this.properties});

  @override
  List<Object> get props => [properties];
}

class ListPropertiesError extends PropertiesState {
  final String error;

  const ListPropertiesError({required this.error});

  @override
  List<Object> get props => [error];
}
