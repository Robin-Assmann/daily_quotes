import 'dart:ui';

import 'package:daily_quotes/data/quote_data.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;
import 'batch_data.dart';

class WikiData {
  WikiData(this.quoteData, this.batchData, this.wikiLink);

  final QuoteData quoteData;
  final BatchData batchData;
  final String wikiLink;

  Color color() => HSLColor.fromColor(
          Color((math.Random(quoteData.id).nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1))
      .withSaturation(0.4)
      .withLightness(0.6)
      .toColor();
}
