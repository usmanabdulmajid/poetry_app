import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:poetry_app/data/api/api_constants.dart';
import 'package:poetry_app/exception/api_exceptions.dart';

class ApiClient {
  final Client client;
  ApiClient(this.client);

  Future<dynamic> getData(String path) async {
    try {
      final Response response = await client
          .get(Uri.parse('${ApiConstants.BASE_URL}$path'))
          .timeout(const Duration(seconds: 40));
      if (response.statusCode != 200) {
        throw ResponseException();
      }
      return jsonDecode(response.body);
    } on TimeoutException {
      throw TimeOut();
    } on FormatException {
      throw InvalidUri();
    } on SocketException {
      throw InvalidNetwork();
    } catch (e) {
      throw ResponseException();
    }
  }
}
