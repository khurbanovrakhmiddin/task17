import 'package:code_union_test/src/domain/repository/get_repo.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/failure.dart';
import '../../data/model/response.dart';

class GetListUseCase {
  final GetRepo repo;

  const GetListUseCase(this.repo);

  Future<Either<AppFailure, StockResponse>> call() async {
    return await repo.getList();
  }
}
