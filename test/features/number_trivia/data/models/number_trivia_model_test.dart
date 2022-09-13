import 'dart:convert';

import 'package:clean_tdd_learning/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_tdd_learning/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test text');

  test(
    'should be a subclass of NumberTrivia entitiy',
    () async {
      // assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );
  group('from Json', () {
    test(
      'Should return a valid model when the Json number is an int.',
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia.json'));

        final result = NumberTriviaModel.fromJson(jsonMap);

        expect(result, tNumberTriviaModel);
      },
    );

    test(
      'Should return a valid model when the Json number is a double.',
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia_double.json'));

        final result = NumberTriviaModel.fromJson(jsonMap);

        expect(result, tNumberTriviaModel);
      },
    );
  });

  group(
    'to Json',
    () {
      test(
        'should return the json map with proper data',
        () async {
          final result = tNumberTriviaModel.toJson();
          final expectedMap = {
            "text": "Test text",
            "number": 1,
          };

          expect(result, expectedMap);
        },
      );
    },
  );
}
