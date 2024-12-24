class UrlHelper {
  Future<String> prepareFullUrlWithParams({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> pathParams,
  }) async {
    String finalUrl =
        baseUrl + Uri.decodeComponent(_replacePathParams(endPoint, pathParams));
    return Uri.decodeComponent(finalUrl);
  }

  String _replacePathParams(String endPoint, Map<String, String> pathParams) {
    String pathParamsReplacedString = endPoint;
    pathParams.forEach((key, value) {
      if (pathParamsReplacedString.contains("{$key}")) {
        pathParamsReplacedString =
            pathParamsReplacedString.replaceAll("{$key}", value);
      }
    });

    return pathParamsReplacedString;
  }

  Future<Map<String, String>> getHeaders() async {

    final headers = {
      "Source": "android",
      // "AndroidAppVersion": appConfig.appVersion,
      // "AndroidAppVersionCode": appConfig.appVersionCode,
      // "AndroidAppFlavour": Environment.env,
      // "AndroidAppBuildType": appConfig.androidAppBuildType,
    };

    // if (currentUserLoginInfo != null) {
    //   headers["LoggedInUserUid"] = currentUserLoginInfo.uid;
    //   headers["AuthToken"] = currentUserLoginInfo.firebaseAuthToken;
    // }

    return headers;
  }
}
