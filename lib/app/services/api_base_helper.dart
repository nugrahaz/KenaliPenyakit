import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  Future<dynamic> get({required String url}) async {
    try {
      final response = await http
          .get(
            (Uri.parse(url)),
            // headers: getHeader(),
          )
          .timeout(const Duration(seconds: 24));

      if (response.statusCode == 200) {
        // debugPrint(response.body);
        final items = await compute(jsonDecode, response.body);
        return items;
        // return json.decode(response.body.toString());
      }
    } on SocketException {
      print("No internet connection");
      //code
    } on TimeoutException {
      print("Timeout connection");
      //code
    }
  }

  Future<dynamic> post({required String url, required dynamic body}) async {
    try {
      final response = await http
          .post((Uri.parse(url)), body: body
              // headers: getHeader(),
              )
          .timeout(const Duration(seconds: 24));

      if (response.statusCode == 200) {
        // debugPrint(response.body);

        final items = await compute(jsonDecode, response.body);

        // return json.decode(response.body.toString());
        return items;
      }
    } on SocketException {
      print("No internet connection");
      //code
    } on TimeoutException {
      print("Timeout connection");
      //code
    }
  }

  getHeader() {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
    };
    // 'Authorization': 'Bearer ${UserLocal().getAccessToken()}',
  }
}
