import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sonsu/models/user.dart';

class ApiResponse {
  // _data will hold any response converted into
  // its own object. For example user.
  Object? data;
  // _apiError will hold the error object
  Object? apiError;
}

class ApiError {
  late String error;

  ApiError({required String error}) {
    error = this.error;
  }

  ApiError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    return data;
  }
}

String _baseUrl = "http://34.249.122.42:8080/";
Future<ApiResponse> sendNeed(
    String name, String location, String time) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(
      Uri.parse('${_baseUrl}needhelp/need'),
      body: {
        'neederName': name,
        'location': location,
        'reqTime': time,
      },
    );

    switch (response.statusCode) {
      case 200: //helper 찾음!
        apiResponse.data = User.fromJson(json.decode(response.body));
        break;
      case 400: //못 찾음!
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    apiResponse.apiError = ApiError(error: "Server error. Please retry");
  }
  return apiResponse;
}

Future<ApiResponse> sendHelpAccepted(
    String name, String whohelp) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(
      Uri.parse('${_baseUrl}needhelp/give'),
      body: {
        'helperName': name,
        'neederName': whohelp,
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(json.decode(response.body));
        break;
      case 400:
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    apiResponse.apiError = ApiError(error: "Server error. Please retry");
  }
  return apiResponse;
}
