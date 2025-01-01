import 'package:auto_route/auto_route.dart';
import 'package:daily_quotes/router/stack_router.gr.dart';

//https://stackoverflow.com/questions/48098085/nesting-routes-with-flutter
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class StackRouter extends RootStackRouter {
  StackRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/wrapper",
          page: WrapperRoute.page,
          initial: true,
          children: [
            AutoRoute(path: 'quote', page: QuoteRoute.page, initial: true),
            AutoRoute(path: 'author', page: AuthorRoute.page),
          ],
        ),
      ];
}
