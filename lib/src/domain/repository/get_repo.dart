import 'package:code_union_test/src/data/model/response.dart';
import "package:dartz/dartz.dart";

import '../../data/model/failure.dart';
abstract class GetRepo {
  Future<Either<AppFailure,StockResponse>> getList();
}