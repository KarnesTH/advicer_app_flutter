import 'dart:convert';

import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/infrastructure/models/advice_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  final tAdviceModel = AdviceModel(advice: "Test", id: 1);

  test("model should be subclass of AdviceEntity", () {
    // assert
    expect(tAdviceModel, isA<AdviceEntity>());
  });

  group("fromJson Factory", () {
    test("should return a valid model if the JSON advice is correct", () {
      // arrange
      final Map<String, dynamic> jsonMap = jsonDecode(fixture("advice.json"));
      // act
      final result = AdviceModel.fromJson(jsonMap);
      // assert
      expect(result, tAdviceModel);
    });
  });
}
