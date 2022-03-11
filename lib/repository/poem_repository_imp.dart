import 'dart:convert';

import 'package:poetry_app/cache/cache_contract.dart';
import 'package:poetry_app/core/api/api_client.dart';
import 'package:poetry_app/model/poem.dart';
import 'package:poetry_app/repository/poem_repository_contract.dart';

class PoemRepositoryImp implements PoemRepositoryContract {
  final ApiClient apiClient;
  final CacheContract cache;
  PoemRepositoryImp(this.apiClient, this.cache);
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
  Future<List<Poem>> poems(String author) async {
    List<Poem> poems = await cache.poems(author);
    if (poems.isEmpty) {
      final data =
          await apiClient.call(url: '/author/$author', method: Method.get);
      var result = jsonDecode(data) as List;
      var poetries = result.map((e) => Poem.fromJson(e)).toList();
      cache.cachePoetry(poetries);
      poems = await cache.poems(author);
    }

    return poems;
  }
}
