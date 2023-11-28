abstract class BaseApiService {

  final String baseUrl = "www.myfinanceworld.com";
  final String apiKey = "b5fea450cdfa494b9fc20bf3a51abff50";

  Future<dynamic> getUserDataResponse(String url, String token);

  Future<dynamic> getUserExpenseResponse(String url, String token);

  Future<dynamic> getAllNewsPaginationResponse(String url, String countryCode, int pageSize, int page);
}