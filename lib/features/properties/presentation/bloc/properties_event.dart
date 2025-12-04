// lib/features/properties/presentation/bloc/properties_event.dart

part of 'properties_bloc.dart';

abstract class PropertiesEvent extends Equatable {
  const PropertiesEvent();

  @override
  List<Object> get props => [];
}

class ListPropertiesEvent extends PropertiesEvent {
  final GetPropertiesParams params;

  const ListPropertiesEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class LoadMorePropertiesEvent extends PropertiesEvent {
  final GetPropertiesParams params;

  const LoadMorePropertiesEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class SearchPropertiesEvent extends PropertiesEvent {
  final String query;
  final String? stateCode;

  const SearchPropertiesEvent({
    required this.query,
    this.stateCode,
  });

  @override
  List<Object> get props => [query];
}
