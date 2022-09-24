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

String _baseUrl = "http://192.168.1.9:8080/";
Future<ApiResponse> sendNeed(
    String name, String location, String time, BuildContext context) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(
      Uri.parse('${_baseUrl}needhelp/need'),
      body: {
        'name': name,
        'location': location,
        'reqTime': time,
      },
    );

    switch (response.statusCode) {
      case 200: //helper 찾음!
        apiResponse.data = User.fromJson(json.decode(response.body));
        Get.toNamed('match-complete',
            arguments: {"name": "김철수", "age": "22세", "gender": "남자"});
        break;
      case 400: //못 찾음!
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        const snackBar = SnackBar(
          content: Text(
            '주변에 도움을 줄 사람이 없습니다. 다시 시도해보세요.',
            style: TextStyle(color: Colors.black),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white70,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Get.back();
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

Future<ApiResponse> signIn(String name, String password) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(
      Uri.parse('${_baseUrl}user/login'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': name,
        'password': password,
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(json.decode(response.body));
        break;
      case 401:
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

Future<ApiResponse> getUserDetails(String name) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(Uri.parse('${_baseUrl}user/$name'));

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(json.decode(response.body));
        break;
      case 401:
        debugPrint((apiResponse.apiError as ApiError).error);
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        debugPrint((apiResponse.apiError as ApiError).error);
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    apiResponse.apiError = ApiError(error: "Server error. Please retry");
  }
  return apiResponse;
}

Future<ApiResponse> checkname(String name) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(
      Uri.parse('${_baseUrl}user/join/name-check'),
      body: {
        'name': name,
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(json.decode(response.body));
        break;
      case 401:
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

Future<ApiResponse> checkNickname(String nickname) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(
      Uri.parse('${_baseUrl}user/join/nickname-check'),
      body: {
        'user_name': nickname,
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(json.decode(response.body));
        break;
      case 401:
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
