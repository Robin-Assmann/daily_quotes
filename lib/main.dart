import 'package:daily_quotes/data/batch_data.dart';
import 'package:daily_quotes/data/quote_data.dart';
import 'package:daily_quotes/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    const App(),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();

  bool _isLoading() =>
      _quote == null || _wikiLink == null || _batchData == null;

  QuoteData? _quote;
  String? _wikiLink;
  BatchData? _batchData;

  @override
  void initState() {
    _getQuote();
    super.initState();
  }

  _incrementCounter() {
    _getQuote();
  }

  _getQuote() async {
    final response = await dio.get(
        'https://florinbobis-quotes-net.hf.space/quotes/random?dataset=quotable');
    _quote = QuoteData.fromJson(response.data);

    final wikiResponse = await dio.get(
        'https://en.wikipedia.org/w/api.php?action=opensearch&search=${_quote!.author}&limit=1&namespace=0&format=json');

    //Json Format without property names
    List<dynamic> dataArray = wikiResponse.data;
    final foundPage = dataArray[1][0] as String;
    _wikiLink = dataArray[3][0] as String;

    final firstText = await dio.get(
        'https://en.wikipedia.org/w/api.php?action=query&prop=extracts|pageimages&exintro&explaintext&titles=$foundPage&pithumbsize=200&format=json');
    _batchData = BatchData.fromJson(firstText.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _isLoading()
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_quote!.quoteText),
                    Text(_quote!.author),
                    Text(_batchData!.query.pages.values.first.extract),
                    Text(_wikiLink!),
                    if (_batchData!.query.pages.values.first.thumbnail != null)
                      Image.network(_batchData!
                          .query.pages.values.first.thumbnail!.source),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Reroll',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
