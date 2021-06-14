

import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';

class RandomWordsWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    print("RandomWordsWidget bind");
    final wordPair = new WordPair.random();
    return Padding(padding: const EdgeInsets.all(18),child: Text(wordPair.toString()));
  }
  
}