import 'package:manage_finance_app/data/remote/api_endPoints.dart';
import 'package:manage_finance_app/data/remote/base_api_service.dart';
import 'package:manage_finance_app/data/remote/netword_api_service.dart';
import 'package:manage_finance_app/repository/user/user_repo.dart';


class HomeRepoImp extends UserRepo {

  final BaseApiService _apiService = NetworkApiService();
  static const int _pageSize = 10;

  @override
  Future getUserData(String token) async {
    try {
      dynamic response = await _apiService.getUserDataResponse(ApiEndPoints().getUserData, token) as Map<String, dynamic>;
      return response;
    } catch(e) {
      rethrow;
    }
  }

  @override
  Future getUserExpenseData(String token) async {
    try {
      dynamic response = await _apiService.getUserExpenseResponse(ApiEndPoints().getUserExpenses, token) as Map<String, dynamic>;
      return response;
    } catch(e) {
      rethrow;
    }
  }
}