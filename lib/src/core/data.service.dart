import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'auth.service.dart';

class DataService {
  static bool isButtonDisabled = false;

  static Future<Map> getHeaders() async {
    final accessToken = await AuthService.getAccessToken();

    var data = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ' + accessToken,
    };
    return data;
  }

  static Future<Map> get(String url, {Map<String, String> params}) async {
    http.Response response = await http.get(
      Uri.http(
        GlobalConfiguration().getValue<String>('coreDomain'),
        GlobalConfiguration().getValue<String>('baseUri') + url,
        params,
      ),
      headers: await DataService.getHeaders(),
    );
    if (response.statusCode != 200) {
      Fluttertoast.showToast(
        msg: 'Failed to fetch data',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return {'item': [], 'data': []};
    }

    return json.decode(response.body);
  }

  static Future<Map> post(String url, Map data, [bool showToast = true]) async {
    var fullUrl = Uri.http(
      GlobalConfiguration().getValue<String>('coreDomain'),
      GlobalConfiguration().getValue<String>('baseUri') + url,
    );
    http.Response response = await http.post(
      fullUrl,
      body: json.encode(data),
      headers: await DataService.getHeaders(),
    );
    if (response.statusCode != 200) {
      if (showToast)
        Fluttertoast.showToast(
          msg: "Failed to create a data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      return null;
    }
    return json.decode(response.body);
  }

  static Future<Map> postRaw(String url, data) async {
    isButtonDisabled = true;
    Response response = await Dio().post(
      "http://" +
          GlobalConfiguration().getValue<String>('coreDomain') +
          GlobalConfiguration().getValue<String>('baseUri') +
          url,
      data: data,
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer ' + await AuthService.getAccessToken(),
        },
      ),
    );
    isButtonDisabled = false;
    if (response.statusCode != 200) {
      Fluttertoast.showToast(
        msg: "Failed to create a data",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    }
    var dataList = response.data.values.toList();
    return dataList[0];
  }

  static Future<Map> put(String url, Map data) async {
    isButtonDisabled = true;
    var fullUrl = Uri.http(
      GlobalConfiguration().getValue<String>('coreDomain'),
      GlobalConfiguration().getValue<String>('baseUri') + url,
    );
    http.Response response = await http.put(
      fullUrl,
      body: json.encode(data),
      headers: await DataService.getHeaders(),
    );
    isButtonDisabled = false;
    if (response.statusCode != 200) {
      Fluttertoast.showToast(
        msg: "Failed to update",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    }

    return json.decode(response.body);
  }

  static Future<Map> delete(String url) async {
    isButtonDisabled = true;
    var fullUrl = Uri.http(
      GlobalConfiguration().getValue<String>('coreDomain'),
      GlobalConfiguration().getValue<String>('baseUri') + url,
    );
    http.Response response = await http.delete(
      fullUrl,
      headers: await DataService.getHeaders(),
    );
    isButtonDisabled = false;
    if (response.statusCode != 200) {
      Fluttertoast.showToast(
        msg: "Failed to delete",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    }
    return json.decode(response.body);
  }

  static Future<Map> patch(String url, Map data) async {
    isButtonDisabled = true;
    var fullUrl = Uri.http(
      GlobalConfiguration().getValue<String>('coreDomain'),
      GlobalConfiguration().getValue<String>('baseUri') + url,
    );
    http.Response response = await http.patch(
      fullUrl,
      body: json.encode(data),
      headers: await DataService.getHeaders(),
    );
    isButtonDisabled = false;
    if (response.statusCode != 200) {
      Fluttertoast.showToast(
        msg: "Failed to update",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    }

    return json.decode(response.body);
  }
}
