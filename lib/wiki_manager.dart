import 'package:daily_quotes/data/wiki_data.dart';
import 'package:dio/dio.dart';
import 'package:daily_quotes/data/batch_data.dart';
import 'package:daily_quotes/data/quote_data.dart';

//https://medium.com/flutter-community/flutter-bloc-for-beginners-839e22adb9f5
class WikiManager {
  WikiManager();

  final dio = Dio();

  Future<WikiData> getQuote() async {
    final response = await dio.get(
        'https://florinbobis-quotes-net.hf.space/quotes/random?dataset=quotable');
    var quote = QuoteData.fromJson(response.data);

    final wikiResponse = await dio.get(
        'https://en.wikipedia.org/w/api.php?action=opensearch&search=${quote.author}&limit=1&namespace=0&format=json');

    //Json Format without property names
    List<dynamic> dataArray = wikiResponse.data;
    final foundPage = dataArray[1][0] as String;
    var wikiLink = dataArray[3][0] as String;

    final firstText = await dio.get(
        'https://en.wikipedia.org/w/api.php?action=query&prop=extracts|pageimages&exintro&explaintext&titles=$foundPage&pithumbsize=100&format=json');
    var batchData = BatchData.fromJson(firstText.data);
    return WikiData(quote, batchData, wikiLink);
  }
}
