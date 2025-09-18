import 'package:code_union_test/src/data/model/failure.dart';
import 'package:code_union_test/src/data/model/response.dart';
import 'package:code_union_test/src/domain/repository/get_repo.dart';
import 'package:dartz/dartz.dart';

import '../request/data_soruce_impl.dart';

class GetRepoImpl extends GetRepo {
  final StockDataSourceImpl ds;

  GetRepoImpl(this.ds);

  @override
  Future<Either<AppFailure, StockResponse>> getList() async {
    try {

      return Right(
        StockResponse.fromJson({
          "data": [
            {
              "id": 2864,
              "companyName": "Amesite Inc",
              "tradingSymbol": "AMST",
              "logo": "https://ailatapi.kz/media/logos/AMST.png",
              "currency": "USD",
              "shariahCheck": true,
              "analysisDate": "2025-05-18T00:38:07.000Z",
              "isCompliant": false,
              "price": {
                "price": 2.78,
                "changePercent": -7.95
              }
            },
            {
              "id": 2864,
              "companyName": "Amesite Inc",
              "tradingSymbol": "AMST",
              "logo": "https://ailatapi.kz/media/logos/AMST.png",
              "currency": "USD",
              "shariahCheck": true,
              "analysisDate": "2025-05-18T00:38:07.000Z",
              "isCompliant": false,
              "price": {
                "price": 2.78,
                "changePercent": -7.95
              }
            },     {
              "id": 2864,
              "companyName": "Amesite Inc",
              "tradingSymbol": "AMST",
              "logo": "https://ailatapi.kz/media/logos/AMST.png",
              "currency": "USD",
              "shariahCheck": true,
              "analysisDate": "2025-05-18T00:38:07.000Z",
              "isCompliant": false,
              "price": {
                "price": 2.78,
                "changePercent": -7.95
              }
            },     {
              "id": 2864,
              "companyName": "Amesite Inc",
              "tradingSymbol": "AMST",
              "logo": "https://ailatapi.kz/media/logos/AMST.png",
              "currency": "USD",
              "shariahCheck": true,
              "analysisDate": "2025-05-18T00:38:07.000Z",
              "isCompliant": false,
              "price": {
                "price": 2.78,
                "changePercent": -7.95
              }
            },     {
              "id": 2864,
              "companyName": "Amesite Inc",
              "tradingSymbol": "AMST",
              "logo": "https://ailatapi.kz/media/logos/AMST.png",
              "currency": "USD",
              "shariahCheck": true,
              "analysisDate": "2025-05-18T00:38:07.000Z",
              "isCompliant": false,
              "price": {
                "price": 2.78,
                "changePercent": -7.95
              }
            },     {
              "id": 2864,
              "companyName": "Amesite Inc",
              "tradingSymbol": "AMST",
              "logo": "https://ailatapi.kz/media/logos/AMST.png",
              "currency": "USD",
              "shariahCheck": true,
              "analysisDate": "2025-05-18T00:38:07.000Z",
              "isCompliant": false,
              "price": {
                "price": 2.78,
                "changePercent": -7.95
              }
            },     {
              "id": 2864,
              "companyName": "Amesite Inc",
              "tradingSymbol": "AMST",
              "logo": "https://ailatapi.kz/media/logos/AMST.png",
              "currency": "USD",
              "shariahCheck": false,
              "analysisDate": "2025-05-18T00:38:07.000Z",
              "isCompliant": true,
              "price": {
                "price": 2.78,
                "changePercent": -7.95
              }
            },     {
              "id": 2864,
              "companyName": "Amesite Inc",
              "tradingSymbol": "AMST",
              "logo": "https://ailatapi.kz/media/logos/AMST.png",
              "currency": "USD",
              "shariahCheck": true,
              "analysisDate": "2025-05-18T00:38:07.000Z",
              "isCompliant": false,
              "price": {
                "price": 2.78,
                "changePercent": -7.95
              }
            },     {
              "id": 2864,
              "companyName": "Amesite Inc",
              "tradingSymbol": "AMST",
              "logo": "https://ailatapi.kz/media/logos/AMST.png",
              "currency": "USD",
              "shariahCheck": true,
              "analysisDate": "2025-05-18T00:38:07.000Z",
              "isCompliant": true,
              "price": {
                "price": 2.78,
                "changePercent": -7.95
              }
            },     {
              "id": 2864,
              "companyName": "Amesite Inc",
              "tradingSymbol": "AMST",
              "logo": "https://ailatapi.kz/media/logos/AMST.png",
              "currency": "USD",
              "shariahCheck": true,
              "analysisDate": "2025-05-18T00:38:07.000Z",
              "isCompliant": false,
              "price": {
                "price": 2.78,
                "changePercent": -7.95
              }
            }
          ],
          "meta": {
            "count": 334
          }
        } as Map<String, dynamic>),
      );
      final result = await ds.getList();
      print(result.statusCode);
      print(result.body);
      if (result.statusCode == 200) {
        return Right(
          StockResponse.fromJson(result.body as Map<String, dynamic>),
        );
      }
      return Left(
        AppServerFailure(message: result.body, statusCode: result.statusCode),
      );
    } catch (e) {
      return Left(AppSomethingFailure(message: e.toString(), statusCode: -1));
    }
  }
}
