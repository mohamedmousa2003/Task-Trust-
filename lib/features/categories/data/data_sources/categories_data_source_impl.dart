import 'dart:convert';
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_trust_development/di/injectable.dart';
import '../../../../core/api/api_config.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../core/exceptions/network_exception.dart';
import '../models/categories_dto.dart';
import 'categorie_data_source.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl implements CategoriesDataSource {
  final String _username = 'testapp';
  final String _password = '5S0Q YjyH 4s3G elpe 5F8v u8as';

  @override
  Future<Either<AppFailures, List<DtoCategories>>> getCategories() async {
    try {
      final basicAuth = 'Basic ${base64Encode(utf8.encode('$_username:$_password'))}';

      final response = await getIt<ApiManager>().getData(
        endPoint: EndPoints.getAllCategories,
        headers: {
          'Authorization': basicAuth,
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 15));
      List<DtoCategories> categories = [];

      final responseData = response.data;

      if (responseData != null) {
        if (responseData is Map<String, dynamic> && responseData['data'] is List) {
          categories = (responseData['data'] as List)
              .whereType<Map<String, dynamic>>()
              .map((item) => DtoCategories.fromJson(item))
              .toList();
        } else if (responseData is List) {
          categories = responseData
              .whereType<Map<String, dynamic>>()
              .map((item) => DtoCategories.fromJson(item))
              .toList();
        }
      }

      return Right(categories);
    }  on TimeoutException {
      return Left(TimeoutFailure());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
