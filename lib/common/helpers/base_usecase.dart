import 'package:patahao/core/errors/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type?>> call(Params params);
}

// Pass this when the usecase expects no parameters
// e.g a call to get a list of shows
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetHotelsParams extends Equatable {
  final String engine;
  final String q;
  final String gl;
  final String hl;
  final String currency;
  final String checkInDate;
  final String checkOutDate;
  final String? nextPageToken;

  const GetHotelsParams(
      {this.engine = 'google_hotels',
      this.q = 'Bali Resorts',
      this.gl = 'us',
      this.hl = 'en',
      this.currency = 'USD',
      required this.checkInDate,
      required this.checkOutDate,
      this.nextPageToken});

  GetHotelsParams copyWith({
    String? engine,
    String? q,
    String? gl,
    String? hl,
    String? currency,
    String? checkInDate,
    String? checkOutDate,
    String? nextPageToken,
  }) {
    return GetHotelsParams(
      engine: engine ?? this.engine,
      q: q ?? this.q,
      gl: gl ?? this.gl,
      hl: hl ?? this.hl,
      currency: currency ?? this.currency,
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      nextPageToken: nextPageToken ?? this.nextPageToken,
    );
  }

  @override
  List<Object?> get props =>
      [engine, q, gl, hl, currency, checkInDate, checkOutDate];
}

// Parameters class
class GetPropertiesParams extends Equatable {
  final String? city;
  final String? stateCode;
  final int? limit;
  final int? offset;
  final String? sort;
  final int? bedsMin;
  final int? bedsMax;
  final int? bathsMin;
  final int? priceMin;
  final int? priceMax;
  final int? sqftMin;
  final int? sqftMax;
  final String? propType;

  const GetPropertiesParams({
    this.city,
    this.stateCode,
    this.limit,
    this.offset,
    this.sort,
    this.bedsMin,
    this.bedsMax,
    this.bathsMin,
    this.priceMin,
    this.priceMax,
    this.sqftMin,
    this.sqftMax,
    this.propType,
  });

  GetPropertiesParams copyWith({
    String? city,
    String? stateCode,
    int? limit,
    int? offset,
    String? sort,
    int? bedsMin,
    int? bedsMax,
    int? bathsMin,
    int? priceMin,
    int? priceMax,
    int? sqftMin,
    int? sqftMax,
    String? propType,
  }) {
    return GetPropertiesParams(
      city: city ?? this.city,
      stateCode: stateCode ?? this.stateCode,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      sort: sort ?? this.sort,
      bedsMin: bedsMin ?? this.bedsMin,
      bedsMax: bedsMax ?? this.bedsMax,
      bathsMin: bathsMin ?? this.bathsMin,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      sqftMin: sqftMin ?? this.sqftMin,
      sqftMax: sqftMax ?? this.sqftMax,
      propType: propType ?? this.propType,
    );
  }

  @override
  List<Object?> get props => [
        city,
        stateCode,
        limit,
        offset,
        sort,
        bedsMin,
        bedsMax,
        bathsMin,
        priceMin,
        priceMax,
        sqftMin,
        sqftMax,
        propType,
      ];
}
