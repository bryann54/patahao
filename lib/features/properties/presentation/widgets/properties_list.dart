// lib/features/properties/presentation/widgets/properties_list.dart

import 'package:patahao/common/helpers/base_usecase.dart';
import 'package:patahao/common/res/l10n.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:patahao/features/properties/presentation/bloc/properties_bloc.dart';
import 'package:patahao/features/properties/presentation/widgets/property_card.dart';
import 'package:patahao/features/properties/presentation/widgets/properties_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertiesList extends StatelessWidget {
  final ScrollController controller;
  const PropertiesList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final propertiesBloc = context.read<PropertiesBloc>();
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        propertiesBloc.add(ListPropertiesEvent(
          params: GetPropertiesParams(
            city: 'New York',
            stateCode: 'NY',
            limit: 20,
            offset: 0,
          ),
        ));
      },
      child: BlocBuilder<PropertiesBloc, PropertiesState>(
          builder: (context, state) {
        if (state is PropertiesLoadingState) {
          return PropertiesShimmer();
        } else if (state is ListPropertiesError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  state.error,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              IconButton(
                  onPressed: () => propertiesBloc.add(ListPropertiesEvent(
                        params: GetPropertiesParams(
                          city: 'New York',
                          stateCode: 'NY',
                          limit: 20,
                          offset: 0,
                        ),
                      )),
                  icon: Icon(Icons.replay_outlined))
            ],
          );
        } else if (state is ListPropertiesSuccess ||
            propertiesBloc.properties.isNotEmpty) {
          late List<PropertyResult> properties;
          if (state is ListPropertiesSuccess) {
            properties = state.properties;
          } else {
            properties = propertiesBloc.properties;
          }
          if (properties.isEmpty) {
            return Center(
                child: Text(AppLocalizations.getString(context, 'noData')));
          }
          return ListView.separated(
            controller: controller,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: properties.length,
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (context, index) =>
                PropertyCard(property: properties[index]),
          );
        }
        return Center(
            child: Text(AppLocalizations.getString(context, 'noData')));
      }),
    );
  }
}
