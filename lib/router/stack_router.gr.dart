// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:daily_quotes/screens/author_screen.dart' as _i1;
import 'package:daily_quotes/screens/quote_screen.dart' as _i2;
import 'package:daily_quotes/screens/wrapper_screen.dart' as _i3;

/// generated route for
/// [_i1.AuthorScreen]
class AuthorRoute extends _i4.PageRouteInfo<void> {
  const AuthorRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AuthorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthorScreen();
    },
  );
}

/// generated route for
/// [_i2.QuoteScreen]
class QuoteRoute extends _i4.PageRouteInfo<void> {
  const QuoteRoute({List<_i4.PageRouteInfo>? children})
      : super(
          QuoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuoteRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.QuoteScreen();
    },
  );
}

/// generated route for
/// [_i3.WrapperScreen]
class WrapperRoute extends _i4.PageRouteInfo<void> {
  const WrapperRoute({List<_i4.PageRouteInfo>? children})
      : super(
          WrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'WrapperRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.WrapperScreen();
    },
  );
}
