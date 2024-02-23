import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:point_of_sale_flutter/core/constants/variables.dart';
import 'package:point_of_sale_flutter/data/datasources/auth_local_datasource.dart';
import '../models/response/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/api/login');
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to Login');
    }
  }

  // logout
  Future<Either<String, bool>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/logout');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${authData!.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return const Right(true);
    } else {
      return const Left('Failed to Logout');
    }
  }
}
