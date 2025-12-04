// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertySearchResponse _$PropertySearchResponseFromJson(
        Map<String, dynamic> json) =>
    PropertySearchResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$PropertySearchResponseToJson(
        PropertySearchResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      autocomplete: (json['autocomplete'] as List<dynamic>?)
          ?.map((e) => AutoCompleteResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeSearch: json['home_search'] == null
          ? null
          : HomeSearch.fromJson(json['home_search'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'autocomplete': instance.autocomplete?.map((e) => e.toJson()).toList(),
      'home_search': instance.homeSearch?.toJson(),
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      esTook: (json['es_took'] as num?)?.toInt(),
      esTotalHits: (json['es_total_hits'] as num?)?.toInt(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'es_took': instance.esTook,
      'es_total_hits': instance.esTotalHits,
      'version': instance.version,
    };

AutoCompleteResult _$AutoCompleteResultFromJson(Map<String, dynamic> json) =>
    AutoCompleteResult(
      id: json['_id'] as String?,
      score: (json['_score'] as num?)?.toDouble(),
      areaType: json['area_type'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      stateCode: json['state_code'] as String?,
      country: json['country'] as String?,
      centroid: json['centroid'] == null
          ? null
          : Centroid.fromJson(json['centroid'] as Map<String, dynamic>),
      slugId: json['slug_id'] as String?,
      geoId: json['geo_id'] as String?,
      fullAddress: json['full_address'] as String?,
    );

Map<String, dynamic> _$AutoCompleteResultToJson(AutoCompleteResult instance) =>
    <String, dynamic>{
      '_id': instance.id,
      '_score': instance.score,
      'area_type': instance.areaType,
      'city': instance.city,
      'state': instance.state,
      'state_code': instance.stateCode,
      'country': instance.country,
      'centroid': instance.centroid?.toJson(),
      'slug_id': instance.slugId,
      'geo_id': instance.geoId,
      'full_address': instance.fullAddress,
    };

Centroid _$CentroidFromJson(Map<String, dynamic> json) => Centroid(
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CentroidToJson(Centroid instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

HomeSearch _$HomeSearchFromJson(Map<String, dynamic> json) => HomeSearch(
      count: (json['count'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PropertyResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeSearchToJson(HomeSearch instance) =>
    <String, dynamic>{
      'count': instance.count,
      'total': instance.total,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

PropertyResult _$PropertyResultFromJson(Map<String, dynamic> json) =>
    PropertyResult(
      propertyId: json['property_id'] as String?,
      listingId: json['listing_id'] as String?,
      location: json['location'] == null
          ? null
          : PropertyLocation.fromJson(json['location'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : PropertyDescription.fromJson(
              json['description'] as Map<String, dynamic>),
      listPrice: (json['list_price'] as num?)?.toDouble(),
      priceReducedAmount: (json['price_reduced_amount'] as num?)?.toInt(),
      listDate: json['list_date'] as String?,
      status: json['status'] as String?,
      primaryPhoto: json['primary_photo'] == null
          ? null
          : PropertyPhoto.fromJson(
              json['primary_photo'] as Map<String, dynamic>),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PropertyPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      flags: json['flags'] == null
          ? null
          : PropertyFlags.fromJson(json['flags'] as Map<String, dynamic>),
      virtualTours: (json['virtual_tours'] as List<dynamic>?)
          ?.map((e) => VirtualTour.fromJson(e as Map<String, dynamic>))
          .toList(),
      permalink: json['permalink'] as String?,
    );

Map<String, dynamic> _$PropertyResultToJson(PropertyResult instance) =>
    <String, dynamic>{
      'property_id': instance.propertyId,
      'listing_id': instance.listingId,
      'location': instance.location?.toJson(),
      'description': instance.description?.toJson(),
      'list_price': instance.listPrice,
      'price_reduced_amount': instance.priceReducedAmount,
      'list_date': instance.listDate,
      'status': instance.status,
      'primary_photo': instance.primaryPhoto?.toJson(),
      'photos': instance.photos?.map((e) => e.toJson()).toList(),
      'flags': instance.flags?.toJson(),
      'virtual_tours': instance.virtualTours?.map((e) => e.toJson()).toList(),
      'permalink': instance.permalink,
    };

PropertyLocation _$PropertyLocationFromJson(Map<String, dynamic> json) =>
    PropertyLocation(
      address: json['address'] == null
          ? null
          : PropertyAddress.fromJson(json['address'] as Map<String, dynamic>),
      county: json['county'] == null
          ? null
          : County.fromJson(json['county'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyLocationToJson(PropertyLocation instance) =>
    <String, dynamic>{
      'address': instance.address?.toJson(),
      'county': instance.county?.toJson(),
    };

PropertyAddress _$PropertyAddressFromJson(Map<String, dynamic> json) =>
    PropertyAddress(
      line: json['line'] as String?,
      city: json['city'] as String?,
      postalCode: json['postal_code'] as String?,
      stateCode: json['state_code'] as String?,
      state: json['state'] as String?,
      coordinate: json['coordinate'] == null
          ? null
          : Coordinate.fromJson(json['coordinate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyAddressToJson(PropertyAddress instance) =>
    <String, dynamic>{
      'line': instance.line,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'state_code': instance.stateCode,
      'state': instance.state,
      'coordinate': instance.coordinate,
    };

Coordinate _$CoordinateFromJson(Map<String, dynamic> json) => Coordinate(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinateToJson(Coordinate instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

County _$CountyFromJson(Map<String, dynamic> json) => County(
      name: json['name'] as String?,
      fips: json['fips'] as String?,
    );

Map<String, dynamic> _$CountyToJson(County instance) => <String, dynamic>{
      'name': instance.name,
      'fips': instance.fips,
    };

PropertyDescription _$PropertyDescriptionFromJson(Map<String, dynamic> json) =>
    PropertyDescription(
      beds: (json['beds'] as num?)?.toInt(),
      baths: (json['baths'] as num?)?.toInt(),
      bathsFull: (json['baths_full'] as num?)?.toInt(),
      bathsHalf: (json['baths_half'] as num?)?.toInt(),
      sqft: (json['sqft'] as num?)?.toInt(),
      lotSqft: (json['lot_sqft'] as num?)?.toInt(),
      type: json['type'] as String?,
      subType: json['sub_type'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PropertyDescriptionToJson(
        PropertyDescription instance) =>
    <String, dynamic>{
      'beds': instance.beds,
      'baths': instance.baths,
      'baths_full': instance.bathsFull,
      'baths_half': instance.bathsHalf,
      'sqft': instance.sqft,
      'lot_sqft': instance.lotSqft,
      'type': instance.type,
      'sub_type': instance.subType,
      'name': instance.name,
    };

PropertyPhoto _$PropertyPhotoFromJson(Map<String, dynamic> json) =>
    PropertyPhoto(
      href: json['href'] as String?,
    );

Map<String, dynamic> _$PropertyPhotoToJson(PropertyPhoto instance) =>
    <String, dynamic>{
      'href': instance.href,
    };

PropertyFlags _$PropertyFlagsFromJson(Map<String, dynamic> json) =>
    PropertyFlags(
      isNewConstruction: json['is_new_construction'] as bool?,
      isForeclosure: json['is_foreclosure'] as bool?,
      isPending: json['is_pending'] as bool?,
      isContingent: json['is_contingent'] as bool?,
    );

Map<String, dynamic> _$PropertyFlagsToJson(PropertyFlags instance) =>
    <String, dynamic>{
      'is_new_construction': instance.isNewConstruction,
      'is_foreclosure': instance.isForeclosure,
      'is_pending': instance.isPending,
      'is_contingent': instance.isContingent,
    };

VirtualTour _$VirtualTourFromJson(Map<String, dynamic> json) => VirtualTour(
      href: json['href'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$VirtualTourToJson(VirtualTour instance) =>
    <String, dynamic>{
      'href': instance.href,
      'type': instance.type,
    };
