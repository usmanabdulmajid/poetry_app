import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:poetry_app/core/exception/api_exceptions.dart';
import 'package:poetry_app/core/local_db/local_db.dart';
import 'package:poetry_app/core/api/api_client.dart';
import 'package:poetry_app/model/poem.dart';
import 'package:poetry_app/repository/poem_repository_contract.dart';

class PoemRepositoryImp implements PoemRepositoryContract {
  final ApiClient apiClient;
  final LocalDb localDb;
  PoemRepositoryImp(this.apiClient, this.localDb);
  @override
  Future<List<String>> poets() async {
    List<String> poets = await localDb.poets();
    if (poets.isEmpty) {
      try {
        final data = await apiClient.call(url: '/authors', method: Method.get);
        var result = jsonDecode(data)['authors'] as List;
        var authors = result.map((e) => e.toString()).toList();
        await localDb.cacheNames(authors);
        poets = await localDb.poets();
      } on NetworkException catch (e) {
        throw NetworkException();
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return poets;
  }

  @override
  Future<List<Poem>> poems(String poet) async {
    List<Poem> poems = await localDb.poems(poet);
    if (poems.isEmpty) {
      try {
        final data =
            await apiClient.call(url: '/author/$poet', method: Method.get);
        var result = jsonDecode(data) as List;
        var poetries = result.map((e) => Poem.fromJson(e)).toList();
        await localDb.cachePoetry(poetries);
        poems = await localDb.poems(poet);
      } on NetworkException {
        throw NetworkException();
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return poems;
  }

  @override
  Future<List<String>> searchPoet(String name) async {
    final poets = await localDb.searchPoet(name);
    return poets;
  }
}
