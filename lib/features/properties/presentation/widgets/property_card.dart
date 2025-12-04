// lib/features/properties/presentation/widgets/property_card.dart

import 'package:patahao/common/res/colors.dart';
import 'package:patahao/features/favourites/presentation/bloc/favourites_bloc.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PropertyCard extends StatefulWidget {
  final PropertyResult property;

  const PropertyCard({super.key, required this.property});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool isFav = false;
  late FavouritesBloc favBloc;

  @override
  void initState() {
    super.initState();
    favBloc = context.read<FavouritesBloc>();
    favBloc.add(CheckIfFavEvent(property: widget.property));
  }

  String formatPrice(double? price) {
    if (price == null) return 'N/A';
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
    return formatter.format(price);
  }

  @override
  Widget build(BuildContext context) {
    final property = widget.property;
    final address = property.location?.address;
    final description = property.description;

    return BlocListener<FavouritesBloc, FavouritesState>(
      listener: (context, state) {
        if (state is CheckIfFavSuccess) {
          if (state.property.propertyId == widget.property.propertyId) {
            setState(() {
              isFav = state.isFav;
            });
          }
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: CachedNetworkImage(
                    imageUrl: property.primaryPhoto?.href ??
                        'https://via.placeholder.com/400x200',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 200,
                      color: Colors.grey[300],
                      child:
                          Icon(Icons.home, size: 50, color: Colors.grey[600]),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      property.status?.toUpperCase() ?? 'FOR SALE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price
                  Text(
                    formatPrice(property.listPrice),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 5),

                  // Beds, Baths, Sqft
                  Row(
                    children: [
                      if (description?.beds != null) ...[
                        Icon(Icons.bed, size: 16, color: Colors.grey[600]),
                        SizedBox(width: 4),
                        Text('${description!.beds} beds'),
                        SizedBox(width: 12),
                      ],
                      if (description?.baths != null) ...[
                        Icon(Icons.bathtub, size: 16, color: Colors.grey[600]),
                        SizedBox(width: 4),
                        Text('${description!.baths} baths'),
                        SizedBox(width: 12),
                      ],
                      if (description?.sqft != null) ...[
                        Icon(Icons.square_foot,
                            size: 16, color: Colors.grey[600]),
                        SizedBox(width: 4),
                        Text('${description!.sqft} sqft'),
                      ],
                    ],
                  ),
                  SizedBox(height: 8),

                  // Address
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 16, color: Colors.grey[600]),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${address?.line ?? ''}, ${address?.city ?? ''}, ${address?.stateCode ?? ''}',
                          style: TextStyle(
                            color: isDarkTheme()
                                ? Colors.grey[400]
                                : Colors.grey[700],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Property Type & Favorite Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (description?.type != null)
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            description!.type!.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      else
                        SizedBox.shrink(),
                      BlocBuilder<FavouritesBloc, FavouritesState>(
                        builder: (context, state) {
                          if (state is LoadingFavourites &&
                              state.property?.propertyId ==
                                  widget.property.propertyId) {
                            return SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator.adaptive(
                                  strokeWidth: 2),
                            );
                          }
                          return IconButton(
                            onPressed: () {
                              isFav
                                  ? favBloc.add(DeleteFavouriteEvent(
                                      model: widget.property))
                                  : favBloc.add(AddFavouriteEvent(
                                      model: widget.property));
                            },
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? Colors.red : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
