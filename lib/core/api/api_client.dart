import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:poetry_app/core/api/api_constants.dart';
import 'package:poetry_app/core/exception/api_exceptions.dart';

enum Method { get, post, put, delete, patch }

class ApiClient {
  final client = Client();

  Future<dynamic> call({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
  }) async {
    Response response;
    try {
      if (method == Method.delete) {
        response = await client.delete(Uri.parse(url), body: params);
      } else if (method == Method.post) {
        response = await client.post(Uri.parse(url), body: params);
      } else if (method == Method.put) {
        response = await client.put(Uri.parse(url), body: params);
      } else if (method == Method.patch) {
        response = await client.patch(Uri.parse(url), body: params);
      } else {
        response = await client.get(Uri.parse('${ApiConstants.BASE_URL}$url'));
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        throw Exception('Error');
      }
    } on SocketException {
      throw NetworkException();
    } on FormatException {
      throw InvalidUri();
    } catch (e) {
      throw Exception(e);
    }
  }
}
