import 'dart:convert';

import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/infrastructure/exceptions/exceptions.dart';
import 'package:advicer/infrastructure/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdvicerRemoteDatasource {
  /// Request a random advice from free api
  /// throws Serverexception if Response code isn`t 200
  Future<AdviceEntity> getRandomAdviceFromApi();
}

class AdvicerRemoteDatasourceImplementation implements AdvicerRemoteDatasource {
  final http.Client client;

  AdvicerRemoteDatasourceImplementation({required this.client});

  @override
  Future<AdviceEntity> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse("https://api.adviceslip.com/advice"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = jsonDecode(response.body);

      return AdviceModel.fromJson(responseBody['slip']);
    }
  }
}
