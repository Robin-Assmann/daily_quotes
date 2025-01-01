import 'package:auto_route/auto_route.dart';
import 'package:daily_quotes/bloc/quote_state.dart';
import 'package:daily_quotes/data/wiki_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AuthorScreen extends StatefulWidget {
  const AuthorScreen({super.key});

  @override
  State<AuthorScreen> createState() => _AuthorScreenState();
}

class _AuthorScreenState extends State<AuthorScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<QuoteCubit, WikiData?>(builder: (_, data) {
      return data == null
          ? const CircularProgressIndicator()
          : Align(
              child: Wrap(
                spacing: 25,
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              iconSize: 15,
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                context.maybePop();
                              },
                            ),
                            SizedBox(
                              width: size.width * 0.3 - 40,
                              child: RichText(
                                text: TextSpan(
                                  text: data.quoteData.author,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                  if (data.batchData.query.pages.values.first.thumbnail != null)
                    SizedBox(
                      width: size.width * 0.3,
                      child: FittedBox(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(data.batchData.query.pages.values
                              .first.thumbnail!.source),
                        ),
                      ),
                    ),
                  RichText(
                    text: TextSpan(
                        text: data.wikiLink,
                        style: Theme.of(context).textTheme.titleSmall,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _openUrl(data.wikiLink);
                          }),
                  ),
                  Text(data.batchData.query.pages.values.first.extract),
                ],
              ),
            );
    });
  }

  _openUrl(String wikiLink) async {
    final Uri url = Uri.parse(wikiLink);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
