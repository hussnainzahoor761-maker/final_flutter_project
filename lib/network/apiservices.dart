import 'package:dio/dio.dart';
import 'package:flutter_final_project/network/networkclient.dart';
import 'package:flutter_final_project/utils/constants.dart';

class ApiServices {
  NetworkClient networkClient;
  ApiServices(this.networkClient);

  Future<Response> login(Map<String, dynamic> parameters) {
    return networkClient.post(Constants.loginendpoints, parameters);
  }
}
