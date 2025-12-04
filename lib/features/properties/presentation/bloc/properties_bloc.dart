// lib/features/properties/presentation/bloc/properties_bloc.dart

import 'dart:async';

import 'package:patahao/common/helpers/base_usecase.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:patahao/features/properties/domain/usecases/list_properties_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'properties_event.dart';
part 'properties_state.dart';

@injectable
class PropertiesBloc extends Bloc<PropertiesEvent, PropertiesState> {
  final ListPropertiesUsecase _listPropertiesUsecase;
  final List<PropertyResult> properties = [];
  int currentOffset = 0;
  int totalResults = 0;

  PropertiesBloc(this._listPropertiesUsecase) : super(PropertiesInitial()) {
    on<ListPropertiesEvent>(_listProperties);
    on<LoadMorePropertiesEvent>(_loadMore);
    on<SearchPropertiesEvent>(_searchProperties);
  }

  FutureOr<void> _listProperties(
      ListPropertiesEvent event, Emitter<PropertiesState> emit) async {
    emit(PropertiesLoadingState());
    final params = event.params;
    final response = await _listPropertiesUsecase.call(params);
    emit(response.fold(
      (error) => ListPropertiesError(error: error.toString()),
      (response) {
        properties.clear();
        if (response.data?.homeSearch?.results != null) {
          properties.addAll(response.data!.homeSearch!.results!);
          totalResults = response.data?.homeSearch?.total ?? 0;
          currentOffset = params.limit ?? 20;
        }
        return ListPropertiesSuccess(properties: properties);
      },
    ));
  }

  FutureOr<void> _loadMore(
      LoadMorePropertiesEvent event, Emitter<PropertiesState> emit) async {
    if (currentOffset >= totalResults) {
      return; // No more data to load
    }

    emit(LoadingMore());
    final params = event.params.copyWith(offset: currentOffset);
    final response = await _listPropertiesUsecase.call(params);
    emit(response.fold(
      (error) => ListPropertiesSuccess(properties: properties),
      (more) {
        if (more.data?.homeSearch?.results != null) {
          properties.addAll(more.data!.homeSearch!.results!);
          currentOffset += params.limit ?? 20;
        }
        return ListPropertiesSuccess(properties: properties);
      },
    ));
  }

  FutureOr<void> _searchProperties(
      SearchPropertiesEvent event, Emitter<PropertiesState> emit) async {
    emit(PropertiesLoadingState());
    final params = GetPropertiesParams(
      city: event.query,
      stateCode: event.stateCode,
      limit: 20,
      offset: 0,
    );
    final response = await _listPropertiesUsecase.call(params);
    emit(response.fold(
      (error) => ListPropertiesError(error: error.toString()),
      (response) {
        properties.clear();
        if (response.data?.homeSearch?.results != null) {
          properties.addAll(response.data!.homeSearch!.results!);
          totalResults = response.data?.homeSearch?.total ?? 0;
          currentOffset = 20;
        }
        return ListPropertiesSuccess(properties: properties);
      },
    ));
  }
}
