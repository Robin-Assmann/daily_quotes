import 'package:daily_quotes/data/wiki_data.dart';
import 'package:daily_quotes/wiki_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteCubit extends Cubit<WikiData?> {
  QuoteCubit(this.wikiManager) : super(null){
    refreshData();
  }

  final WikiManager wikiManager;

  refreshData() async {
    try {
      final data = await wikiManager.getQuote();
      emit(data);
    } catch (error, stacktrace) {
      print(stacktrace);
      refreshData();
    }
  }
}
