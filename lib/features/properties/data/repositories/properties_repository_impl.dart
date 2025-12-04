// lib/features/properties/data/repositories/properties_repository_impl.dart

import 'package:patahao/core/api_client/models/server_error.dart';
import 'package:patahao/core/errors/exceptions.dart';
import 'package:patahao/core/errors/failures.dart';
import 'package:patahao/features/properties/data/datasources/properties_remote_datasource.dart';
import 'package:patahao/features/properties/data/models/query_property_model.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:patahao/features/properties/domain/repositories/properties_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PropertiesRepository)
class PropertiesRepositoryImpl implements PropertiesRepository {
  final PropertiesRemoteDatasource _remoteDatasource;

  PropertiesRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, PropertySearchResponse>> autoComplete(
      String input) async {
    try {
      final result = await _remoteDatasource.autoComplete(input);
      if (result is ServerError) {
        return Left(ServerFailure(badResponse: result));
      }
      return Right(PropertySearchResponse.fromJson(result));
    } on ServerException {
      return const Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure(badResponse: ServerError()));
    }
  }

  @override
  Future<Either<Failure, PropertySearchResponse>> listProperties(
      QueryPropertyModel query) async {
    try {
      final result = await _remoteDatasource.listProperties(query);
      if (result is ServerError) {
        return Left(ServerFailure(badResponse: result));
      }
      return Right(PropertySearchResponse.fromJson(result));
    } on ServerException {
      return const Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure(badResponse: ServerError()));
    }
  }

  @override
  Future<Either<Failure, PropertySearchResponse>> getPropertyDetail(
      String propertyId) async {
    try {
      final result = await _remoteDatasource.getPropertyDetail(propertyId);
      if (result is ServerError) {
        return Left(ServerFailure(badResponse: result));
      }
      return Right(PropertySearchResponse.fromJson(result));
    } on ServerException {
      return const Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure(badResponse: ServerError()));
    }
  }
}
