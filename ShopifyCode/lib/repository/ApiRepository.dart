import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../repository/ApiConst.dart';
import 'ApiResponse.dart';
import '../util/utils.dart';

/*
connectivity
success        200
server down    503
error  ->      else block (500)

*/

class ApiRepository {
  // final Dio client;
  // ApiRepository(this.client);
  static Dio client = Dio();

  static Future<ApiResponse> getAPI(String apiName) async {
    if (await Utils.isInternetConnected()) {
      try {
        String callingUrl;
        callingUrl = ApiConst.baseUrl + apiName;
        // String token = await Session().getToken();
        String token = "";
        debugPrint("-------------------------");
        debugPrint("url:-------------- ${callingUrl}");
        debugPrint("token:------------ ${token}");
        if (token.isNotEmpty) {
          client.options.headers["authorization"] = "Bearer " + token;
        }

        var response = await client.get(callingUrl);
        debugPrint(
            "----------------------ApiRepository--getAPI----------$response");
        // return response;
        // return ApiResponse(status: true, statusCode: "200", message: "Success", data: clist);

        if (response.statusCode == 200 || response.statusCode == 201) {
          // final jsonData = response.data["countries"] as List;
          // List<Countries> clist = jsonData.map((tagJson) => Countries.fromJson(tagJson)).toList();

          return ApiResponse(
              status: true,
              statusCode: "200",
              message: "Success",
              data: response.data);
        } else if (response.statusCode == 503) {
          debugPrint("----------------------------------api repository 503 ");
          return ApiResponse(
              status: false, statusCode: "503", message: "Server Down");
        } else {
          debugPrint("----------------------------------api repository 500");
          return ApiResponse(
              status: false,
              statusCode: "500",
              message: "Something went wrong");
        }
      } on DioException catch (e) {
        return exceptionOccured(e);
      }
    } else {
      return ApiResponse(
          status: false, statusCode: "144", message: "No Internet Connection");
    }
  }

  static Future<dynamic> deleteAPI(String apiName, {Object? data}) async {
    if (await Utils.isInternetConnected()) {
      try {
        String callingUrl = ApiConst.baseUrl + apiName;
        // String token = await Session().getToken();
        String token = "";
        debugPrint("-------------------------");
        debugPrint("url:-------------- ${callingUrl}");
        debugPrint("token:------------ ${token}");
        if (token.isNotEmpty) {
          client.options.headers["authorization"] = "Bearer " + token;
        }
        // client.options.headers["authorization"] = "Bearer " + token;
        // debugPrint("data : ${data.toString()}");
        debugPrint("Tag Delete call---------------------${data}");
        var response = data != null
            ? await client.delete(callingUrl, data: data)
            : await client.delete(callingUrl);
        debugPrint(
            "----------------------ApiRepository--deleteAPI----------$response");
        debugPrint("Tag Deleted---------------------");
        // return response;
        if (response.statusCode == 200) {
          return ApiResponse(
              status: true,
              statusCode: "200",
              message: "Success",
              data: response.data);
        } else if (response.statusCode == 503) {
          debugPrint("----------------------------------api repository 503 ");
          return ApiResponse(
              status: false, statusCode: "503", message: "Server Down");
        } else {
          debugPrint("----------------------------------api repository 500");
          return ApiResponse(
              status: false,
              statusCode: "500",
              message: "Something went wrong");
        }
      } on DioException catch (e) {
        return exceptionOccured(e);
      }
    } else {
      return ApiResponse(
          status: false, statusCode: "144", message: "No Internet Connection");
    }
  }

  static Future<dynamic> postAPI(String apiName, var formData) async {
    if (await Utils.isInternetConnected()) {
      try {
        String callingUrl = ApiConst.baseUrl + apiName;

        debugPrint("-------------------------");
        // String token = await Session().getToken();
        String token = "";
        debugPrint("-------------------------");
        debugPrint("url:-------------- ${callingUrl}");
        debugPrint("token:------------ ${token}");
        debugPrint("data eeee:-------------- ${formData.toString()}");

        if (token.isNotEmpty) {
          client.options.headers["authorization"] = "Bearer " + token;
        }

        var response = await client.post(callingUrl, data: formData);
        // response come when status is 200 only
        debugPrint(
            "----------------------ApiRepository--postAPI----------$response");
        // return response;
        if (response.statusCode == 200 || response.statusCode == 201) {
          return ApiResponse(
              status: true,
              statusCode: "200", 
              message: "Success",
              data: response.data);
        } else if (response.statusCode == 503) {
          debugPrint("----------------------------------api repository 503 ");
          return ApiResponse(
              status: false, statusCode: "503", message: "Server Down");
        } else {
          debugPrint("----------------------------------api repository 500");
          return ApiResponse(
              status: false,
              statusCode: "500",
              message: "Something went wrong");
        }
      } on DioException catch (e) {
        return exceptionOccured(e);
      }
    } else {
      return ApiResponse(
          status: false, statusCode: "144", message: "No Internet Connection");
    }
  }

  static Future<dynamic> putAPI(String apiName, var formData) async {
    if (await Utils.isInternetConnected()) {
      try {
        String callingUrl = ApiConst.baseUrl + apiName;

        debugPrint("-------------------------");
        // String token = await Session().getToken();
        String token = "";
        debugPrint("-------------------------");
        debugPrint("url:-------------- ${callingUrl}");
        debugPrint("token:------------ ${token}");
        debugPrint("data eeee:-------------- ${formData.toString()}");

        if (token.isNotEmpty) {
          client.options.headers["authorization"] = "Bearer " + token;
        }

        var response = await client.put(callingUrl, data: formData);
        // response come when status is 200 only
        debugPrint(
            "----------------------ApiRepositoryeerr------------$response");
        debugPrint(
            "----------------------ApiRepositoryee------------${response.statusCode}");
        // return response;
        if (response.statusCode == 200 || response.statusCode == 201) {
          return ApiResponse(
              status: true,
              statusCode: "200",
              message: "Success",
              data: response.data);
        } else if (response.statusCode == 503) {
          debugPrint("----------------------------------api repository 503 ");
          return ApiResponse(
              status: false, statusCode: "503", message: "Server Down");
        } else {
          debugPrint("----------------------------------api repository 500");
          return ApiResponse(
              status: false,
              statusCode: "500",
              message: "Something went wrong");
        }
      } on DioException catch (e) {
        return exceptionOccured(e);
      }
    } else {
      return ApiResponse(
          status: false, statusCode: "144", message: "No Internet Connection");
    }
  }

  static exceptionOccured(DioException e) {
    Map<String, dynamic>? response;
    if (e.response != null) {
      response = e.response?.data;
    }

    //todo: other Exception code come here or message return
    if (response != null) {
      return ApiResponse(
          status: false,
          statusCode: e.response?.statusCode.toString() ?? "500",
          message:
              "${response.containsKey("error") ? response["error"] : response["message"]}");
    } else {
      // var err = {'"status"': 'false', '"message"': '"${e.message}"'};
      // return err;
      // debugPrint("----------------------------------error     " + e.response.toString() +" " + e.response!.statusCode.toString());
      return ApiResponse(
          status: false, statusCode: "500", message: "${e.message}");
    }
  }

  static Future<ApiResponse> getAPIFORZIP(String apiName, String token) async {
    if (await Utils.isInternetConnected()) {
      try {
        String callingUrl;
        callingUrl = ApiConst.baseUrl + apiName;
        // String token = await Session().getToken();
        // String token = "";
        // debugPrint("-------------------------");
        // debugPrint("url:-------------- ${callingUrl}");
        // debugPrint("token:------------ ${token}");
        // if (token.isNotEmpty) {
        //   client.options.headers["apiKey"] = "";
        // }//01HTC14KYSWSDPY530XYXS3X5P
        apiName == "health" ? callingUrl = apiName : callingUrl = apiName;
        var headers = {'apikey': token};
        var response = await client.get(callingUrl,
            options: Options(
              headers: headers,
            ));
        debugPrint(
            "----------------------ApiRepository--getAPIFORZIP----------$response");
        // return response;
        // return ApiResponse(status: true, statusCode: "200", message: "Success", data: clist);

        if (response.statusCode == 200) {
          // final jsonData = response.data["countries"] as List;
          // List<Countries> clist = jsonData.map((tagJson) => Countries.fromJson(tagJson)).toList();

          return ApiResponse(
              status: true,
              statusCode: "200",
              message: "Success",
              data: response.data);
        } else if (response.statusCode == 503) {
          debugPrint("----------------------------------api repository 503 ");
          return ApiResponse(
              status: false, statusCode: "503", message: "Server Down");
        } else {
          debugPrint("----------------------------------api repository 500");
          return ApiResponse(
              status: false,
              statusCode: "500",
              message: "Something went wrong");
        }
      } on DioException catch (e) {
        return exceptionOccured(e);
      }
    } else {
      return ApiResponse(
          status: false, statusCode: "144", message: "No Internet Connection");
    }
  }

  static Future<ApiResponse> getAPIForBoostAI(String apiName) async {
    if (await Utils.isInternetConnected()) {
      try {
        String callingUrl;
        apiName == "health" ? callingUrl = apiName : callingUrl = apiName;
        // String token = await Session().getToken();
        String token = "";
        debugPrint("-------------------------");
        debugPrint("url:-------------- ${callingUrl}");
        debugPrint("token:------------ ${token}");
        if (token.isNotEmpty) {
          client.options.headers["authorization"] = "Bearer " + token;
        }

        var response = await client.get(callingUrl);
        debugPrint(
            "----------------------ApiRepository--getAPI----------$response");
        // return response;
        // return ApiResponse(status: true, statusCode: "200", message: "Success", data: clist);

        if (response.statusCode == 200) {
          // final jsonData = response.data["countries"] as List;
          // List<Countries> clist = jsonData.map((tagJson) => Countries.fromJson(tagJson)).toList();

          return ApiResponse(
              status: true,
              statusCode: "200",
              message: "Success",
              data: response.data);
        } else if (response.statusCode == 503) {
          debugPrint("----------------------------------api repository 503 ");
          return ApiResponse(
              status: false, statusCode: "503", message: "Server Down");
        } else {
          debugPrint("----------------------------------api repository 500");
          return ApiResponse(
              status: false,
              statusCode: "500",
              message: "Something went wrong");
        }
      } on DioException catch (e) {
        return exceptionOccured(e);
      }
    } else {
      return ApiResponse(
          status: false, statusCode: "144", message: "No Internet Connection");
    }
  }

  static Future<ApiResponse> getAPIForKiwiSizing(String apiName) async {
    if (await Utils.isInternetConnected()) {
      try {
        debugPrint("url:-------------- ${apiName}");

        var response = await client.get(apiName);
        debugPrint(
            "----------------------ApiRepository--getAPIForKiwiSizing----------$response");

        bool status = response.data.length > 0 ? true : false;
        if (response.statusCode == 200) {
          return ApiResponse(
            status: status,
            statusCode: "200",
            message: "Success",
          );
        } else if (response.statusCode == 503) {
          debugPrint("----------------------------------api repository 503 ");
          return ApiResponse(
              status: status, statusCode: "503", message: "Server Down");
        } else {
          debugPrint("----------------------------------api repository 500");
          return ApiResponse(
              status: status,
              statusCode: "500",
              message: "Something went wrong");
        }
      } on DioException catch (e) {
        return exceptionOccured(e);
      }
    } else {
      return ApiResponse(
          status: false, statusCode: "144", message: "No Internet Connection");
    }
  }
}
