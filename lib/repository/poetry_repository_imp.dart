import 'dart:convert';

import 'package:poetry_app/cache/cache_contract.dart';
import 'package:poetry_app/core/api/api_client.dart';
import 'package:poetry_app/model/poetry.dart';
import 'package:poetry_app/repository/poetry_repository_contract.dart';

class PoetryRepositoryImp implements PoetryRepositoryContract {
  final ApiClient apiClient;
  final CacheContract cache;
  PoetryRepositoryImp(this.apiClient, this.cache);
  @override
  Future<List<String>> authors() async {
    List<String> poets = await cache.poets();
    if (poets.isEmpty) {
      final data = await apiClient.call(url: '/authors', method: Method.get);
      var result = jsonDecode(data)['authors'] as List;
      var authors = result.map((e) => e.toString()).toList();
      cache.cacheNames(authors);
      poets = await cache.poets();
    }

    return poets;
  }

  @override
  Future<List<Poetry>> poems(String author) async {
    List<Poetry> poems = await cache.poems(author);
    if (poems.isEmpty) {
      final data =
          await apiClient.call(url: '/author/$author', method: Method.get);
      var result = jsonDecode(data) as List;
      var poetries = result.map((e) => Poetry.fromJson(e)).toList();
      cache.cachePoetry(poetries);
      poems = await cache.poems(author);
    }

    return poems;
  }
}
