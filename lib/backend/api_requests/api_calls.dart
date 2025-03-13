import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ApinasaCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'APINASA',
      apiUrl:
          'https://api.nasa.gov/planetary/apod?api_key=dSVpWfRtgJid5TI7AMJ4LyyaVBS7xMTMzI8m9ib3',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? author(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.copyright''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date''',
      ));
  static String? explanation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.explanation''',
      ));
  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hdurl''',
      ));
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
