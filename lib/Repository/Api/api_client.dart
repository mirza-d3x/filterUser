import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'api_exception.dart';

class ApiClient {
  static const String basePath = 'http://185.193.17.122/';

  Future<Response> invokeApi(String path, String method, Object? body) async {
    Map<String, String> headerparams = {};
    if (method == 'POST' ||
        method == 'GET' ||
        method == 'PATCH' ||
        method == 'PUT' ||
        method == 'DELETE') {
      headerparams = {
        "authorization": "Bearer ",
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
    }
    print(headerparams);
    Response response;

    String url = basePath + path;
    print(url);

    final nullableHeaderParams = (headerparams.isEmpty) ? null : headerparams;

    switch (method) {
      case "POST":
        response = await post(
          Uri.parse(url),
          headers: headerparams,
          body: jsonEncode(body),
        );
        break;
      case "PUT":
        print("Editing====================================");
        print(jsonEncode(body));
        response = await put(Uri.parse(url),
            headers: headerparams, body: jsonEncode(body));
        print("Editing====================================");
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: nullableHeaderParams);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      case "PATCH":
        response = await patch(
          Uri.parse(url),
          headers: headerparams,
          body: jsonEncode(body),
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: headerparams,
          body: body,
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: headerparams);
    }
    print('status of $path =>${response.statusCode}');
    print(response.body);
    if (response.statusCode >= 400) {
      log('$path : ${response.statusCode} : ${response.body}');

      throw ApiException(
          message: _decodeBodyBytes(response), statusCode: response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers["content-type"];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}
