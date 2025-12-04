// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:patahao/features/account/presentation/pages/account_screen.dart'
    as _i1;
import 'package:patahao/features/favourites/presentation/pages/favourites_screen.dart'
    as _i2;
import 'package:patahao/features/overview/presentation/pages/overview_screen.dart'
    as _i4;
import 'package:patahao/features/properties/presentation/pages/properties_screen.dart'
    as _i5;
import 'package:patahao/main_screen.dart' as _i3;

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i6.PageRouteInfo<void> {
  const AccountRoute({List<_i6.PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountScreen();
    },
  );
}

/// generated route for
/// [_i2.FavouritesScreen]
class FavouritesRoute extends _i6.PageRouteInfo<void> {
  const FavouritesRoute({List<_i6.PageRouteInfo>? children})
    : super(FavouritesRoute.name, initialChildren: children);

  static const String name = 'FavouritesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavouritesScreen();
    },
  );
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainScreen();
    },
  );
}

/// generated route for
/// [_i4.OverviewScreen]
class OverviewRoute extends _i6.PageRouteInfo<void> {
  const OverviewRoute({List<_i6.PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.OverviewScreen();
    },
  );
}

/// generated route for
/// [_i5.PropertiesScreen]
class PropertiesRoute extends _i6.PageRouteInfo<void> {
  const PropertiesRoute({List<_i6.PageRouteInfo>? children})
    : super(PropertiesRoute.name, initialChildren: children);

  static const String name = 'PropertiesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.PropertiesScreen();
    },
  );
}
