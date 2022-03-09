import 'dart:convert';

import 'package:poetry_app/data/api/api_client.dart';
import 'package:poetry_app/data/data_source/remote/remote_data_source_contract.dart';
import 'package:poetry_app/model/poetry.dart';

class RemoteDataSourceImp implements RemoteDataSourceContract {
  final ApiClient apiClient;
  RemoteDataSourceImp(this.apiClient);

  @override
  Future<List<String>> authors() async {
    final data = await apiClient.call('authors');
    var result = jsonDecode(data) as List;
    return result.map((e) => e.toString()).toList();
  }

  @override
  Future<List<Poetry>> authorPoems(String authorName) async {
    final data = await apiClient.call(authorName);
    var result = jsonDecode(data.body) as List;
    return result.map((e) => Poetry.fromJson(e)).toList();
  }
}
