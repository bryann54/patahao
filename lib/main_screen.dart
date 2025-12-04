// main_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:patahao/common/helpers/app_router.gr.dart';
import 'package:patahao/common/res/l10n.dart';
import 'package:patahao/core/di/injector.dart';
import 'package:patahao/features/account/presentation/bloc/account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patahao/features/favourites/presentation/bloc/favourites_bloc.dart';
import 'package:patahao/features/properties/presentation/bloc/properties_bloc.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<PropertiesBloc>()),
        BlocProvider(create: (Context) => getIt<FavouritesBloc>()),
        BlocProvider(create: (context) => getIt<AccountBloc>())
      ],
      child: AutoTabsScaffold(
          lazyLoad: false,
          routes: const [OverviewRoute(), PropertiesRoute(), FavouritesRoute(), AccountRoute()],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.dashboard),
                  label: AppLocalizations.getString(context, 'overview'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.search),
                  label: AppLocalizations.getString(context, 'Search'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite_outline),
                  label: AppLocalizations.getString(context, 'favourites'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.account_circle),
                  label: AppLocalizations.getString(context, 'account'),
                ),
              ],
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: Colors.blue,
              onTap: tabsRouter.setActiveIndex,
            );
          }),
    );
  }
}
