// lib/features/properties/presentation/pages/properties_screen.dart

import 'package:auto_route/auto_route.dart';
import 'package:patahao/common/helpers/base_usecase.dart';
import 'package:patahao/common/res/colors.dart';
import 'package:patahao/common/res/l10n.dart';
import 'package:patahao/common/utils/debouncer.dart';
import 'package:patahao/features/properties/domain/usecases/list_properties_usecase.dart';
import 'package:patahao/features/properties/presentation/bloc/properties_bloc.dart';
import 'package:patahao/features/properties/presentation/widgets/properties_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({super.key});

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen> {
  late PropertiesBloc propertiesBloc;
  late ScrollController _scrollController;
  final Debouncer debouncer = Debouncer(milliseconds: 50);
  GetPropertiesParams queryParams = GetPropertiesParams(
    city: 'New York',
    stateCode: 'NY',
    limit: 20,
    offset: 0,
  );

  @override
  void initState() {
    super.initState();
    propertiesBloc = context.read<PropertiesBloc>();
    if (propertiesBloc.properties.isEmpty) {
      propertiesBloc.add(ListPropertiesEvent(params: queryParams));
    }
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      propertiesBloc.add(LoadMorePropertiesEvent(params: queryParams));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Title Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Text(
              'Find Your Dream Home',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color:
                          isDarkTheme() ? Colors.grey[700] : Colors.grey[200],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search by city (e.g., New York)',
                        hintStyle: TextStyle(fontSize: 16),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor:
                            isDarkTheme() ? Colors.grey[700] : Colors.grey[200],
                      ),
                      style: TextStyle(fontSize: 16),
                      onChanged: (value) {
                        if (value.isEmpty) return;

                        // Smart search: check if user included state code
                        String searchCity = value;
                        String? searchState;

                        if (value.contains(',')) {
                          // User typed something like "Los Angeles, CA"
                          final parts = value.split(',');
                          searchCity = parts[0].trim();
                          if (parts.length > 1) {
                            searchState = parts[1].trim();
                          }
                        }

                        queryParams = queryParams.copyWith(
                          city: searchCity,
                          stateCode: searchState,
                        );

                        debouncer.run(
                            timeout: 1000,
                            () => propertiesBloc.add(SearchPropertiesEvent(
                                query: searchCity, stateCode: searchState)));
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.filter_alt_outlined),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog.adaptive(
                              title: Text('Filters'),
                              content: Text('Filter feature coming soon!'),
                            ));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<PropertiesBloc, PropertiesState>(
              builder: (context, state) {
            if (state is LoadingMore || state is PropertiesLoadingState) {
              return LinearProgressIndicator(
                  color: isDarkTheme() ? Colors.grey[700] : Colors.grey[200]);
            }
            return const SizedBox.shrink();
          }),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PropertiesList(controller: _scrollController),
            ),
          ),
        ],
      ),
    );
  }
}
