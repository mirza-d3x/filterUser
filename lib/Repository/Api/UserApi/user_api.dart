import 'dart:convert';

import 'package:creativelabs/Model/get_user_details.dart';
import 'package:creativelabs/Repository/Api/api_client.dart';
import 'package:http/http.dart';

class UserApi {
  ApiClient apiClient = ApiClient();

  Future<GetUserDetailsModel> getAllUsers() async {
    String path = 'get_all_user_details';
    Map body = {
      "user_id": "53",
      "accessToken": "e43f7cb369aaa442a870cfc051a76efb"
    };
    Response response =
        await apiClient.invokeApi(path: path, method: 'POST', body: body);
    return GetUserDetailsModel.fromJson(jsonDecode(response.body));
  }
}
