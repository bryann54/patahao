// lib/features/properties/data/models/property_search_response.dart

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'property_search_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PropertySearchResponse {
  final Data? data;
  final bool status;
  final String message;

  PropertySearchResponse({
    this.data,
    required this.status,
    required this.message,
  });

  factory PropertySearchResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertySearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PropertySearchResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  final Meta? meta;
  final List<AutoCompleteResult>? autocomplete;
  @JsonKey(name: 'home_search')
  final HomeSearch? homeSearch;

  Data({
    this.meta,
    this.autocomplete,
    this.homeSearch,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'es_took')
  final int? esTook;
  @JsonKey(name: 'es_total_hits')
  final int? esTotalHits;
  final String? version;

  Meta({
    this.esTook,
    this.esTotalHits,
    this.version,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

// AutoComplete Model
@JsonSerializable(explicitToJson: true)
class AutoCompleteResult {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: '_score')
  final double? score;
  @JsonKey(name: 'area_type')
  final String? areaType;
  final String? city;
  final String? state;
  @JsonKey(name: 'state_code')
  final String? stateCode;
  final String? country;
  final Centroid? centroid;
  @JsonKey(name: 'slug_id')
  final String? slugId;
  @JsonKey(name: 'geo_id')
  final String? geoId;
  @JsonKey(name: 'full_address')
  final String? fullAddress;

  AutoCompleteResult({
    this.id,
    this.score,
    this.areaType,
    this.city,
    this.state,
    this.stateCode,
    this.country,
    this.centroid,
    this.slugId,
    this.geoId,
    this.fullAddress,
  });

  factory AutoCompleteResult.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteResultFromJson(json);
  Map<String, dynamic> toJson() => _$AutoCompleteResultToJson(this);
}

@JsonSerializable()
class Centroid {
  final double? lon;
  final double? lat;

  Centroid({this.lon, this.lat});

  factory Centroid.fromJson(Map<String, dynamic> json) =>
      _$CentroidFromJson(json);
  Map<String, dynamic> toJson() => _$CentroidToJson(this);
}

// Home Search Results
@JsonSerializable(explicitToJson: true)
class HomeSearch {
  final int? count;
  final int? total;
  final List<PropertyResult>? results;

  HomeSearch({
    this.count,
    this.total,
    this.results,
  });

  factory HomeSearch.fromJson(Map<String, dynamic> json) =>
      _$HomeSearchFromJson(json);
  Map<String, dynamic> toJson() => _$HomeSearchToJson(this);
}

// Main Property Result Model
@JsonSerializable(explicitToJson: true)
class PropertyResult extends Equatable {
  @JsonKey(name: 'property_id')
  final String? propertyId;
  @JsonKey(name: 'listing_id')
  final String? listingId;
  final PropertyLocation? location;
  final PropertyDescription? description;
  @JsonKey(name: 'list_price')
  final double? listPrice;
  @JsonKey(name: 'price_reduced_amount')
  final int? priceReducedAmount;
  @JsonKey(name: 'list_date')
  final String? listDate;
  final String? status;
  @JsonKey(name: 'primary_photo')
  final PropertyPhoto? primaryPhoto;
  final List<PropertyPhoto>? photos;
  final PropertyFlags? flags;
  @JsonKey(name: 'virtual_tours')
  final List<VirtualTour>? virtualTours;
  final String? permalink;

  const PropertyResult({
    this.propertyId,
    this.listingId,
    this.location,
    this.description,
    this.listPrice,
    this.priceReducedAmount,
    this.listDate,
    this.status,
    this.primaryPhoto,
    this.photos,
    this.flags,
    this.virtualTours,
    this.permalink,
  });

  factory PropertyResult.fromJson(Map<String, dynamic> json) =>
      _$PropertyResultFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyResultToJson(this);

  @override
  List<Object?> get props => [propertyId, listingId];
}

@JsonSerializable(explicitToJson: true)
class PropertyLocation {
  final PropertyAddress? address;
  @JsonKey(name: 'county')
  final County? county;

  PropertyLocation({
    this.address,
    this.county,
  });

  factory PropertyLocation.fromJson(Map<String, dynamic> json) =>
      _$PropertyLocationFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyLocationToJson(this);
}

@JsonSerializable()
class PropertyAddress {
  final String? line;
  final String? city;
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @JsonKey(name: 'state_code')
  final String? stateCode;
  final String? state;
  final Coordinate? coordinate;

  PropertyAddress({
    this.line,
    this.city,
    this.postalCode,
    this.stateCode,
    this.state,
    this.coordinate,
  });

  factory PropertyAddress.fromJson(Map<String, dynamic> json) =>
      _$PropertyAddressFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyAddressToJson(this);
}

@JsonSerializable()
class Coordinate {
  final double? lat;
  final double? lon;

  Coordinate({this.lat, this.lon});

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinateToJson(this);
}

@JsonSerializable()
class County {
  final String? name;
  final String? fips;

  County({this.name, this.fips});

  factory County.fromJson(Map<String, dynamic> json) => _$CountyFromJson(json);
  Map<String, dynamic> toJson() => _$CountyToJson(this);
}

@JsonSerializable()
class PropertyDescription {
  final int? beds;
  final int? baths;
  @JsonKey(name: 'baths_full')
  final int? bathsFull;
  @JsonKey(name: 'baths_half')
  final int? bathsHalf;
  final int? sqft;
  @JsonKey(name: 'lot_sqft')
  final int? lotSqft;
  final String? type;
  @JsonKey(name: 'sub_type')
  final String? subType;
  final String? name;

  PropertyDescription({
    this.beds,
    this.baths,
    this.bathsFull,
    this.bathsHalf,
    this.sqft,
    this.lotSqft,
    this.type,
    this.subType,
    this.name,
  });

  factory PropertyDescription.fromJson(Map<String, dynamic> json) =>
      _$PropertyDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyDescriptionToJson(this);
}

@JsonSerializable()
class PropertyPhoto {
  final String? href;

  PropertyPhoto({this.href});

  factory PropertyPhoto.fromJson(Map<String, dynamic> json) =>
      _$PropertyPhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyPhotoToJson(this);
}

@JsonSerializable()
class PropertyFlags {
  @JsonKey(name: 'is_new_construction')
  final bool? isNewConstruction;
  @JsonKey(name: 'is_foreclosure')
  final bool? isForeclosure;
  @JsonKey(name: 'is_pending')
  final bool? isPending;
  @JsonKey(name: 'is_contingent')
  final bool? isContingent;

  PropertyFlags({
    this.isNewConstruction,
    this.isForeclosure,
    this.isPending,
    this.isContingent,
  });

  factory PropertyFlags.fromJson(Map<String, dynamic> json) =>
      _$PropertyFlagsFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyFlagsToJson(this);
}

@JsonSerializable()
class VirtualTour {
  final String? href;
  final String? type;

  VirtualTour({this.href, this.type});

  factory VirtualTour.fromJson(Map<String, dynamic> json) =>
      _$VirtualTourFromJson(json);
  Map<String, dynamic> toJson() => _$VirtualTourToJson(this);
}
