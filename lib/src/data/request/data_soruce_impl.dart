
import 'package:code_union_test/src/core/api.dart';

import 'data_source.dart';
import 'package:http/http.dart' as http;

class StockDataSourceImpl extends StockDataSource {
  StockDataSourceImpl();

  @override
  Future<http.Response> getList([int? page]) async {
    final url = Uri.parse("${NetworkConst.baseUrl}${NetworkConst.getList}");
    final result = await http.get(url);
    return result;
  }
}
