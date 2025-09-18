
import 'package:http/http.dart';


abstract class StockDataSource {
  Future<Response> getList([int? page]);
}
