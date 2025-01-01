import 'package:auto_route/auto_route.dart';
import 'package:daily_quotes/bloc/quote_state.dart';
import 'package:daily_quotes/data/wiki_data.dart';
import 'package:daily_quotes/router/stack_router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteCubit, WikiData?>(builder: (context, data) {
      return data == null
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data.quoteData.quoteText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 25,
                        )),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                      text: data.quoteData.author,
                      style: Theme.of(context).textTheme.titleSmall,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushRoute(const AuthorRoute());
                        }),
                ),
              ],
            );
    });
  }
}
