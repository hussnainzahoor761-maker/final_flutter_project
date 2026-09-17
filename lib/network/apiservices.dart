import 'package:dio/dio.dart';
import 'package:flutter_final_project/network/session.dart';
import 'package:flutter_final_project/network/networkclient.dart';
import 'package:flutter_final_project/utils/constants.dart';

class ApiServices {
  NetworkClient networkClient;
  ApiServices(this.networkClient);

  Future<Response> getMyProperties({
    String? status,
    String? query,
    int page = 0,
    int size = 20,
  }) {
    final params = <String, dynamic>{'page': page, 'size': size};
    if (status != null) params['status'] = status;
    if (query != null) params['q'] = query;
    return networkClient.get(
      Constants.myPropertiesEndpoint,
      params: params,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> login(Map<String, dynamic> parameters) {
    return networkClient.post(Constants.loginEndpoint, parameters);
  }

  Future<Response> signup(Map<String, dynamic> parameters) {
    return networkClient.post(Constants.signupEndpoint, parameters);
  }

  Future<Response> refreshToken(Map<String, dynamic> parameters) {
    return networkClient.post(Constants.refreshTokenEndpoint, parameters);
  }

  Future<Response> logout(Map<String, dynamic> parameters) {
    return networkClient.post(Constants.logoutEndpoint, parameters);
  }

  Future<Response> forgetopassword(Map<String, dynamic> parameters) {
    return networkClient.post(Constants.forgotPasswordEndpoint, parameters);
  }

  Future<Response> verifyotpresponse(Map<String, dynamic> parameters) {
    return networkClient.post(Constants.verifyOtpEndpoint, parameters);
  }

  Future<Response> createnewpassword(Map<String, dynamic> parameters) {
    return networkClient.post(Constants.resetPasswordEndpoint, parameters);
  }

  Future<Response> featuredProperties({
    String? type,
    int page = 0,
    int size = 20,
  }) {
    return networkClient.get(
      Constants.featuredPropertiesEndpoint,
      params: {"type": ?type, "page": page, "size": size},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> propertyTypes() {
    return networkClient.get(
      Constants.propertyTypesEndpoint,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> propertySuggestions({String? query, int limit = 5}) {
    return networkClient.get(
      Constants.propertySuggestionsEndpoint,
      params: {
        if (query != null && query.isNotEmpty) "q": query,
        "limit": limit,
      },
      token: Session.instance.accessToken,
    );
  }

  Future<Response> newDevelopments({int page = 0, int size = 20}) {
    return networkClient.get(
      Constants.newDevelopmentsEndpoint,
      params: {"page": page, "size": size},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> propertyAmenities() {
    return networkClient.get(
      Constants.propertyAmenitiesEndpoint,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> recommendedProperties({int page = 0, int size = 20}) {
    return networkClient.get(
      Constants.recommendedPropertiesEndpoint,
      params: {"page": page, "size": size},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> uploadPropertyMedia(
    int propertyId,
    List<Map<String, dynamic>> files, {
    required String mediaType,
  }) {
    final multipartFiles = files
        .map(
          (file) => MultipartFile.fromBytes(
            file['bytes'] as List<int>,
            filename: file['name'] as String?,
          ),
        )
        .toList();
    return networkClient.postMultipart(
      '${Constants.searchPropertiesEndpoint}/$propertyId/photos',
      FormData.fromMap({'mediaType': mediaType, 'files': multipartFiles}),
    );
  }

  Future<Response> searchProperties1({Map<String, dynamic>? params}) =>
      networkClient.get(Constants.searchPropertiesEndpoint, params: params);

  Future<Response> searchProperties(Map<String, dynamic> parameters) {
    return networkClient.get(
      Constants.searchPropertiesEndpoint,
      params: parameters,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> createProperty(Map<String, dynamic> parameters) {
    return networkClient.post(
      Constants.searchPropertiesEndpoint,
      parameters,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> publishProperty(int id, {String status = 'FOR_SALE'}) {
    return networkClient.post(
      '${Constants.searchPropertiesEndpoint}/$id/publish',
      {},
      queryParameters: {'status': status},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> propertyById(int id) {
    return networkClient.get(
      "properties/$id",
      token: Session.instance.accessToken,
    );
  }

  Future<Response> favoriteProperty(int id) {
    return networkClient.put(
      "properties/$id/favorite",
      {},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> unfavoriteProperty(int id) {
    return networkClient.delete(
      "properties/$id/favorite",
      token: Session.instance.accessToken,
    );
  }

  Future<Response> favorites({int page = 0, int size = 20}) {
    return networkClient.get(
      Constants.favoritePropertiesEndpoint,
      params: {"page": page, "size": size},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> myProperties({int page = 0, int size = 20}) {
    return networkClient.get(
      Constants.myPropertiesEndpoint,
      params: {"page": page, "size": size},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> notifications({int page = 0, int size = 20}) {
    return networkClient.get(
      Constants.notificationsEndpoint,
      params: {"page": page, "size": size},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> markNotificationRead(int id) {
    return networkClient.post(
      "notifications/$id/read",
      {},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> markAllNotificationsRead() {
    return networkClient.post(
      "notifications/read-all",
      {},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> news({int page = 0, int size = 10}) {
    return networkClient.get(
      Constants.newsEndpoint,
      params: {"page": page, "size": size},
      token: Session.instance.accessToken,
    );
  }

  Future<Response> currentUser() {
    return networkClient.get(
      Constants.currentUserEndpoint,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> updateProfile(Map<String, dynamic> parameters) {
    return networkClient.patch(
      Constants.currentUserEndpoint,
      parameters,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> languages() {
    return networkClient.get(Constants.languagesEndpoint);
  }

  Future<Response> notificationPreferences() {
    return networkClient.get(
      Constants.notificationPreferencesEndpoint,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> updateNotificationPreferences(
    Map<String, dynamic> parameters,
  ) {
    return networkClient.patch(
      Constants.notificationPreferencesEndpoint,
      parameters,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> paymentMethods() {
    return networkClient.get(
      Constants.paymentMethodsEndpoint,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> addCard(Map<String, dynamic> parameters) {
    return networkClient.post(
      Constants.addCardEndpoint,
      parameters,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> twoFactorStatus() {
    return networkClient.get(
      Constants.twoFactorEndpoint,
      token: Session.instance.accessToken,
    );
  }

  Future<Response> addnewcard(Map<String, dynamic> parameters) {
    return networkClient.post(Constants.addnewcard, parameters);
  }
}
